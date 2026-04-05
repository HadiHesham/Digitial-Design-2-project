
.subckt invx1 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X2 Y A VGND VGND sky130_fd_pr__nfet_01v8
.ends invx1

.subckt invx2 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X2 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X3 Y A VGND VGND sky130_fd_pr__nfet_01v8
X4 Y A VGND VGND sky130_fd_pr__nfet_01v8
.ends invx2

.subckt invx4 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X2 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X3 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X4 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X5 Y A VGND VGND sky130_fd_pr__nfet_01v8
X6 Y A VGND VGND sky130_fd_pr__nfet_01v8
X7 Y A VGND VGND sky130_fd_pr__nfet_01v8
X8 Y A VGND VGND sky130_fd_pr__nfet_01v8
.ends invx4

.subckt invx8 A Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X2 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X3 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X4 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X5 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X6 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X7 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X8 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X9 Y A VGND VGND sky130_fd_pr__nfet_01v8
X10 Y A VGND VGND sky130_fd_pr__nfet_01v8
X11 Y A VGND VGND sky130_fd_pr__nfet_01v8
X12 Y A VGND VGND sky130_fd_pr__nfet_01v8
X13 Y A VGND VGND sky130_fd_pr__nfet_01v8
X14 Y A VGND VGND sky130_fd_pr__nfet_01v8
X15 Y A VGND VGND sky130_fd_pr__nfet_01v8
X16 Y A VGND VGND sky130_fd_pr__nfet_01v8
.ends invx8

.subckt nand2x1 A B Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X2 Y B VPWR VPWR sky130_fd_pr__pfet_01v8
X3 Y A N1 VGND sky130_fd_pr__nfet_01v8
X4 N1 B VGND VGND sky130_fd_pr__nfet_01v8
.ends nand2x1

.subckt nand2x2 A B Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X2 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X3 Y B VPWR VPWR sky130_fd_pr__pfet_01v8
X4 Y B VPWR VPWR sky130_fd_pr__pfet_01v8
X5 Y A N1 VGND sky130_fd_pr__nfet_01v8
X6 Y A N1 VGND sky130_fd_pr__nfet_01v8
X7 N1 B VGND VGND sky130_fd_pr__nfet_01v8
X8 N1 B VGND VGND sky130_fd_pr__nfet_01v8
.ends nand2x2

.subckt nand2x4 A B Y VPWR VGND
X1 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X2 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X3 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X4 Y A VPWR VPWR sky130_fd_pr__pfet_01v8
X5 Y B VPWR VPWR sky130_fd_pr__pfet_01v8
X6 Y B VPWR VPWR sky130_fd_pr__pfet_01v8
X7 Y B VPWR VPWR sky130_fd_pr__pfet_01v8
X8 Y B VPWR VPWR sky130_fd_pr__pfet_01v8
X9 Y A N1 VGND sky130_fd_pr__nfet_01v8
X10 Y A N1 VGND sky130_fd_pr__nfet_01v8
X11 Y A N1 VGND sky130_fd_pr__nfet_01v8
X12 Y A N1 VGND sky130_fd_pr__nfet_01v8
X13 N1 B VGND VGND sky130_fd_pr__nfet_01v8
X14 N1 B VGND VGND sky130_fd_pr__nfet_01v8
X15 N1 B VGND VGND sky130_fd_pr__nfet_01v8
X16 N1 B VGND VGND sky130_fd_pr__nfet_01v8
.ends nand2x4

.subckt nor2x1 A B Y VPWR VGND
X1 Y A N1 VPWR sky130_fd_pr__pfet_01v8
X2 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8
X3 Y A VGND VGND sky130_fd_pr__nfet_01v8
X4 Y B VGND VGND sky130_fd_pr__nfet_01v8
.ends nor2x1

.subckt nor2x2 A B Y VPWR VGND
X1 Y A N1 VPWR sky130_fd_pr__pfet_01v8
X2 Y A N1 VPWR sky130_fd_pr__pfet_01v8
X3 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8
X4 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8
X5 Y A VGND VGND sky130_fd_pr__nfet_01v8
X6 Y A VGND VGND sky130_fd_pr__nfet_01v8
X7 Y B VGND VGND sky130_fd_pr__nfet_01v8
X8 Y B VGND VGND sky130_fd_pr__nfet_01v8
.ends nor2x2

.subckt nor2x4 A B Y VPWR VGND
X1 Y A N1 VPWR sky130_fd_pr__pfet_01v8
X2 Y A N1 VPWR sky130_fd_pr__pfet_01v8
X3 Y A N1 VPWR sky130_fd_pr__pfet_01v8
X4 Y A N1 VPWR sky130_fd_pr__pfet_01v8
X5 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8
X6 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8
X7 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8
X8 N1 B VPWR VPWR sky130_fd_pr__pfet_01v8
X9 Y A VGND VGND sky130_fd_pr__nfet_01v8
X10 Y A VGND VGND sky130_fd_pr__nfet_01v8
X11 Y A VGND VGND sky130_fd_pr__nfet_01v8
X12 Y A VGND VGND sky130_fd_pr__nfet_01v8
X13 Y B VGND VGND sky130_fd_pr__nfet_01v8
X14 Y B VGND VGND sky130_fd_pr__nfet_01v8
X15 Y B VGND VGND sky130_fd_pr__nfet_01v8
X16 Y B VGND VGND sky130_fd_pr__nfet_01v8
.ends nor2x4

