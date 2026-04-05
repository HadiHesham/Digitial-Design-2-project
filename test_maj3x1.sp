.include "stdcells.sp"

VDD VPWR 0 1.8
VSS VGND 0 0

VA A 0 PULSE(0 1.8 0n 0.01n 0.01n 5n 10n)
VB B 0 PULSE(0 1.8 2n 0.01n 0.01n 5n 10n)
VC C 0 PULSE(0 1.8 4n 0.01n 0.01n 5n 10n)

X1 A B C Y VPWR VGND maj3x1

Cload Y 0 0.01p

.tran 0.01n 30n

.control
run
plot V(A) V(B) V(C) V(Y)
.endc

.end
