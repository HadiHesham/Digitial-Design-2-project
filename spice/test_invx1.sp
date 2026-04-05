

.include "stdcells.sp"

VDD VPWR 0 1.8
VSS VGND 0 0

VIN A 0 PULSE(0 1.8 0 0.01n 0.01n 5n 10n)

X1 A Y VPWR VGND invx8
Cload Y 0 0.01p

.tran 0.01n 20n

.control
run
plot V(A) V(Y)
.endc

.end
