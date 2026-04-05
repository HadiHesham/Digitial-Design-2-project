.include "stdcells.sp"

VDD VPWR 0 1.8
VSS VGND 0 0

VA A 0 0
VB B 0 0
VC C 0 0

X1 A B C Y VPWR VGND maj3x1

.control
alter @VA[dc] = 0
alter @VB[dc] = 0
alter @VC[dc] = 0
op
print v(a) v(b) v(c) v(y)

alter @VA[dc] = 0
alter @VB[dc] = 0
alter @VC[dc] = 1.8
op
print v(a) v(b) v(c) v(y)

alter @VA[dc] = 0
alter @VB[dc] = 1.8
alter @VC[dc] = 0
op
print v(a) v(b) v(c) v(y)

alter @VA[dc] = 0
alter @VB[dc] = 1.8
alter @VC[dc] = 1.8
op
print v(a) v(b) v(c) v(y)

alter @VA[dc] = 1.8
alter @VB[dc] = 0
alter @VC[dc] = 0
op
print v(a) v(b) v(c) v(y)

alter @VA[dc] = 1.8
alter @VB[dc] = 0
alter @VC[dc] = 1.8
op
print v(a) v(b) v(c) v(y)

alter @VA[dc] = 1.8
alter @VB[dc] = 1.8
alter @VC[dc] = 0
op
print v(a) v(b) v(c) v(y)

alter @VA[dc] = 1.8
alter @VB[dc] = 1.8
alter @VC[dc] = 1.8
op
print v(a) v(b) v(c) v(y)

quit
.endc

.end
