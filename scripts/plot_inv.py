import csv
import matplotlib.pyplot as plt

cells = ["invx1", "invx2", "invx4", "invx8"]
target_tin = "0.1225"

for cell in cells:
    with open(f"results/{cell}_cell_rise.csv", "r") as f:
        rows = list(csv.reader(f))

    loads = [float(x) for x in rows[0][1:]]
    target_row = None

    for row in rows[1:]:
        if row[0] == target_tin:
            target_row = [float(x) for x in row[1:]]
            break

    if target_row is None:
        raise ValueError(f"Could not find tin={target_tin} in {cell}_cell_rise.csv")

    plt.plot(loads, target_row, marker="o", label=cell)

plt.xlabel("Load (pF)")
plt.ylabel("cell_rise delay (s)")
plt.title("Delay vs Load for inverter family at tin = 0.1225 ns")
plt.legend()
plt.grid(True)
plt.savefig("results/inverter_delay_plot.png", dpi=300, bbox_inches="tight")
plt.show()
