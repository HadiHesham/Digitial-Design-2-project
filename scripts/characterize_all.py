import re
import subprocess
from pathlib import Path

TIN_VALUES = [0.0100, 0.0231, 0.0531, 0.1225, 0.2823, 0.6507, 1.5000]
LOAD_VALUES = [0.0005, 0.0013, 0.0035, 0.0094, 0.0249, 0.0662, 0.1758]

CELLS = [
    "nand2x1", "nand2x2", "nand2x4",
    "nor2x1", "nor2x2", "nor2x4",
    "maj3x1", "maj3x2", "maj3x4",
]

START_FROM = "nand2x1"

LIB_PATH = "/Users/hadihesham/pdks/volare/sky130/versions/dd7771c384ed36b91a25e9f8b314355fc26561be/sky130A/libs.tech/ngspice/sky130.lib.spice"

PROJECT_ROOT = Path(__file__).resolve().parent.parent
SPICE_DIR = PROJECT_ROOT / "spice"
RESULTS_DIR = PROJECT_ROOT / "results"
NETLIST_DIR = PROJECT_ROOT / "generated_netlists"

RESULTS_DIR.mkdir(exist_ok=True)
NETLIST_DIR.mkdir(exist_ok=True)

def classify_cell(cell: str) -> str:
    if cell.startswith("inv"):
        return "inv"
    if cell.startswith("nand2"):
        return "nand2"
    if cell.startswith("nor2"):
        return "nor2"
    if cell.startswith("maj3"):
        return "maj3"
    raise ValueError(f"Unknown cell family: {cell}")

def measure_block(family: str) -> str:
    if family in ("inv", "nand2", "nor2"):
        return """
.measure tran tphl TRIG v(A) VAL=0.9 RISE=1 TARG v(Y) VAL=0.9 FALL=1
.measure tran tplh TRIG v(A) VAL=0.9 FALL=1 TARG v(Y) VAL=0.9 RISE=1
.measure tran fall_transition TRIG v(Y) VAL=1.44 FALL=1 TARG v(Y) VAL=0.36 FALL=1
.measure tran rise_transition TRIG v(Y) VAL=0.36 RISE=1 TARG v(Y) VAL=1.44 RISE=1
""".strip()
    if family == "maj3":
        return """
.measure tran tphl TRIG v(A) VAL=0.9 FALL=1 TARG v(Y) VAL=0.9 FALL=1
.measure tran tplh TRIG v(A) VAL=0.9 RISE=1 TARG v(Y) VAL=0.9 RISE=1
.measure tran fall_transition TRIG v(Y) VAL=1.44 FALL=1 TARG v(Y) VAL=0.36 FALL=1
.measure tran rise_transition TRIG v(Y) VAL=0.36 RISE=1 TARG v(Y) VAL=1.44 RISE=1
""".strip()
    raise ValueError(f"Unsupported family: {family}")

def instance_block(cell: str, family: str) -> str:
    if family == "inv":
        return f"XU1 A Y VPWR 0 {cell}"
    if family in ("nand2", "nor2"):
        return f"XU1 A B Y VPWR 0 {cell}"
    if family == "maj3":
        return f"XU1 A B C Y VPWR 0 {cell}"
    raise ValueError(f"Unsupported family: {family}")

def source_block(tin_ns: float, family: str) -> str:
    pulse_width_ns = 50.0
    period_ns = 100.0

    lines = [
        "VDD VDD_SRC 0 1.8",
        "RVDD VDD_SRC VPWR 1",
        f"VA A_SRC 0 PULSE(0 1.8 0 {tin_ns}n {tin_ns}n {pulse_width_ns}n {period_ns}n)",
        "RINA A_SRC A 1",
    ]

    if family == "nand2":
        lines.append("VB B_SRC 0 1.8")
        lines.append("RINB B_SRC B 1")
    elif family == "nor2":
        lines.append("VB B_SRC 0 0")
        lines.append("RINB B_SRC B 1")
    elif family == "maj3":
        lines.append("VB B_SRC 0 1.8")
        lines.append("RINB B_SRC B 1")
        lines.append("VC C_SRC 0 0")
        lines.append("RINC C_SRC C 1")

    return "\n".join(lines)

def build_netlist(cell: str, tin_ns: float, load_pf: float) -> str:
    family = classify_cell(cell)
    sources = source_block(tin_ns, family)
    inst = instance_block(cell, family)
    measures = measure_block(family)

    return f"""
.lib "{LIB_PATH}" tt
.temp 25
.include "{(SPICE_DIR / "stdcells.sp").as_posix()}"

{sources}

{inst}

Cload Y 0 {load_pf}p

.tran 0.01n 200n

{measures}

.end
""".strip()

def parse_measures(log_text: str) -> dict:
    patterns = {
        "tphl": r"tphl\s*=\s*([+-]?\d*\.?\d+(?:[eE][+-]?\d+)?)",
        "tplh": r"tplh\s*=\s*([+-]?\d*\.?\d+(?:[eE][+-]?\d+)?)",
        "fall_transition": r"fall_transition\s*=\s*([+-]?\d*\.?\d+(?:[eE][+-]?\d+)?)",
        "rise_transition": r"rise_transition\s*=\s*([+-]?\d*\.?\d+(?:[eE][+-]?\d+)?)",
    }

    values = {}
    for key, pattern in patterns.items():
        match = re.search(pattern, log_text, re.IGNORECASE)
        if not match:
            raise ValueError(f"Missing {key}")
        values[key] = float(match.group(1))
    return values

def run_ngspice(netlist_text: str, run_name: str) -> dict:
    cir_path = NETLIST_DIR / f"{run_name}.sp"
    log_path = RESULTS_DIR / f"{run_name}.log"

    cir_path.write_text(netlist_text)

    result = subprocess.run(
        ["ngspice", "-b", "-o", str(log_path), str(cir_path)],
        capture_output=True,
        text=True,
    )

    if result.returncode != 0:
        raise RuntimeError(f"ngspice failed for {run_name}\nLog: {log_path}")

    log_text = log_path.read_text()
    return parse_measures(log_text)

def write_table(path: Path, matrix: list[list[float]]) -> None:
    with path.open("w") as f:
        f.write("tin/load," + ",".join(str(x) for x in LOAD_VALUES) + "\n")
        for tin, row in zip(TIN_VALUES, matrix):
            f.write(str(tin) + "," + ",".join(f"{v:.6e}" for v in row) + "\n")

def characterize_cell(cell: str) -> None:
    print(f"\n=== Characterizing {cell} ===")

    cell_rise = []
    cell_fall = []
    rise_transition = []
    fall_transition = []

    for tin in TIN_VALUES:
        row_cell_rise = []
        row_cell_fall = []
        row_rise_transition = []
        row_fall_transition = []

        for load in LOAD_VALUES:
            run_name = f"{cell}_tin_{tin}_load_{load}"
            data = run_ngspice(build_netlist(cell, tin, load), run_name)

            row_cell_rise.append(data["tplh"])
            row_cell_fall.append(data["tphl"])
            row_rise_transition.append(data["rise_transition"])
            row_fall_transition.append(data["fall_transition"])

            print(f"{cell}: tin={tin}, load={load} DONE")

        cell_rise.append(row_cell_rise)
        cell_fall.append(row_cell_fall)
        rise_transition.append(row_rise_transition)
        fall_transition.append(row_fall_transition)

    write_table(RESULTS_DIR / f"{cell}_cell_rise.csv", cell_rise)
    write_table(RESULTS_DIR / f"{cell}_cell_fall.csv", cell_fall)
    write_table(RESULTS_DIR / f"{cell}_rise_transition.csv", rise_transition)
    write_table(RESULTS_DIR / f"{cell}_fall_transition.csv", fall_transition)

def main() -> None:
    start_index = CELLS.index(START_FROM)
    for cell in CELLS[start_index:]:
        characterize_cell(cell)

if __name__ == "__main__":
    main()
