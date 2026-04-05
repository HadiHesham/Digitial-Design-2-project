.subckt invx1 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8 w=1.00u l=0.15u
X2 Y A VGND VGND sky130_fd_pr__nfet_01v8 w=0.42u l=0.15u
.ends invx1

.subckt invx2 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8 w=2.00u l=0.15u
X2 Y A VGND VGND sky130_fd_pr__nfet_01v8 w=0.84u l=0.15u
.ends invx2

.subckt invx4 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8 w=4.00u l=0.15u
X2 Y A VGND VGND sky130_fd_pr__nfet_01v8 w=1.68u l=0.15u
.ends invx4

.subckt invx8 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8 w=8.00u l=0.15u
X2 Y A VGND VGND sky130_fd_pr__nfet_01v8 w=3.36u l=0.15u
.ends invx8

.subckt nand2x1 A B Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8 w=1.00u l=0.15u
X2 Y B VPWR VPWR sky130_fd_pr__pfet_01v8 w=1.00u l=0.15u
X3 Y A N1 VGND sky130_fd_pr__nfet_01v8 w=0.84u l=0.15u
X4 N1 B VGND VGND sky130_fd_pr__nfet_01v8 w=0.84u l=0.15u
.ends nand2x1

.subckt nand2x2 A B Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8 w=2.00u l=0.15u
X2 Y B VPWR VPWR sky130_fd_pr__pfet_01v8 w=2.00u l=0.15u
X3 Y A N1 VGND sky130_fd_pr__nfet_01v8 w=1.68u l=0.15u
X4 N1 B VGND VGND sky130_fd_pr__nfet_01v8 w=1.68u l=0.15u
.ends nand2x2

.subckt nand2x4 A B Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8 w=4.00u l=0.15u
X2 Y B VPWR VPWR sky130_fd_pr__pfet_01v8 w=4.00u l=0.15u
X3 Y A N1 VGND sky130_fd_pr__nfet_01v8 w=3.36u l=0.15u
X4 N1 B VGND VGND sky130_fd_pr__nfet_01v8 w=3.36u l=0.15u
.ends nand2x4

.subckt nor2x1 A B Y VPWR VGND
X1 Y A N1 VPWR sky130_fd_pr__pfet_01v8 w=2.00u l=0.15u
X2 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8 w=2.00u l=0.15u
X3 Y A VGND VGND sky130_fd_pr__nfet_01v8 w=0.42u l=0.15u
X4 Y B VGND VGND sky130_fd_pr__nfet_01v8 w=0.42u l=0.15u
.ends nor2x1

.subckt nor2x2 A B Y VPWR VGND
X1 Y A N1 VPWR sky130_fd_pr__pfet_01v8 w=4.00u l=0.15u
X2 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8 w=4.00u l=0.15u
X3 Y A VGND VGND sky130_fd_pr__nfet_01v8 w=0.84u l=0.15u
X4 Y B VGND VGND sky130_fd_pr__nfet_01v8 w=0.84u l=0.15u
.ends nor2x2

.subckt nor2x4 A B Y VPWR VGND
X1 Y A N1 VPWR sky130_fd_pr__pfet_01v8 w=8.00u l=0.15u
X2 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8 w=8.00u l=0.15u
X3 Y A VGND VGND sky130_fd_pr__nfet_01v8 w=1.68u l=0.15u
X4 Y B VGND VGND sky130_fd_pr__nfet_01v8 w=1.68u l=0.15u
.ends nor2x4

.subckt maj3x1 A B C Y VPWR VGND
X1 A B NAB VPWR VGND nand2x1
X2 A C NAC VPWR VGND nand2x1
X3 B C NBC VPWR VGND nand2x1
X4 NAB NAC T1 VPWR VGND nand2x1
X5 T1 U1 VPWR VGND invx1
X6 U1 NBC Y VPWR VGND nand2x1
.ends maj3x1

.subckt maj3x2 A B C Y VPWR VGND
X1 A B NAB VPWR VGND nand2x2
X2 A C NAC VPWR VGND nand2x2
X3 B C NBC VPWR VGND nand2x2
X4 NAB NAC T1 VPWR VGND nand2x2
X5 T1 U1 VPWR VGND invx2
X6 U1 NBC Y VPWR VGND nand2x2
.ends maj3x2

.subckt maj3x4 A B C Y VPWR VGND
X1 A B NAB VPWR VGND nand2x4
X2 A C NAC VPWR VGND nand2x4
X3 B C NBC VPWR VGND nand2x4
X4 NAB NAC T1 VPWR VGND nand2x4
X5 T1 U1 VPWR VGND invx4
X6 U1 NBC Y VPWR VGND nand2x4
.ends maj3x4
