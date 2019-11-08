* CarrySkip.sp
.TITLE carry_skip_adder

************************ Parameters definition ************************
.lib   "../LIB/models" ptm16hp_bulk 
.option list node post   
.option runlvl=6
.temp 90
.param nLength=16n
.param pLength=16n
.param nWidth=24n
.param pWidth=48n
.param SUPPLY=0.7
.global  VDD

************************ Subcircuit definition ************************
******************************** 2-AND ********************************
.subckt and a b y
M0 y net1 0 0 nch L=nLength W=nWidth 
M1 net1 a net2 net2 nch L=nLength W=2*nWidth 
M2 net2 b 0 0 nch L=nLength W=2*nWidth 
M3 y net1 VDD  VDD  pch L=pLength W=pWidth
M4 net1 b VDD  VDD pch L=pLength W=pWidth
M5 net1 a VDD  VDD  pch L=pLength W=pWidth 
.ends

****************************** inverter ******************************
.subckt  inv   a     y
M0      y      a     0      0    nch   W=nWidth L=nLength 
M1       y     a     VDD   VDD   pch   W=pWidth L=pLength 
.ends

******************************** 2-OR ********************************
.subckt or a  b  y 
M0 y net1 0 0 nch L=nLength W=nWidth 
M1 net1 a 0 0 nch L=nLength W=nWidth 
M2 net1 b 0 0 nch L=nLength W=nWidth 
M3 y net1 VDD  VDD  pch L=pLength W=pWidth
M4 net1 b net2  net2 pch L=pLength W=2*pWidth
M5 net2 a VDD  VDD  pch L=pLength W=2*pWidth 
.ends 

******************************* 2-XOR ********************************
.subckt xor a  b  y 
X1 a /a inv
X2 b /b inv
X3 a /b m1 and
X4 /a b m2 and
X5 m1 m2 y or
.ends 

.MODEL pch PMOS LEVEL=1 
.MODEL nch NMOS LEVEL=1 

.subckt bit1 a   b   c   c1   s0  
Xp0 a    b   p0 xor 
Xg0 a    b   g0 and 
Xm  c    p0  m  and 
Xc1 g0   m   c1 or 
Xs0 c    p0  s0 xor 
//CLOAD  s0  0  CL 
.ends 

.subckt bit2 a   b   c   s0  
Xp0 a    b   p0 xor  
Xs0 c    p0  s0 xor 
//CLOAD  s0  0  CL 
.ends 

.subckt  bit3 a    b   gin   pin   gout   pout 
Xp0    a  b   p0  xor 
Xg0    a  b   g0  and 
Xm    gin p0  X   and 
Xgout g0  X  gout or 
Xpout p0 pin pout and
//CLOAD   s0  0   CL 
.ends 

.subckt bit4 a b g0 p0  
Xp0 a  b  p0  xor 
Xg0 a  b  g0  and 
.ends 

.subckt group1  c0  ina1 inb1 ina2 inb2 ina3 inb3 ina4 inb4 s1 s2 s3 s4
Xbit1    ina1  inb1  c0   c1   s1  bit1 
Xbit2    ina2  inb2  c1   c2   s2  bit1 
Xbit3    ina3  inb3  c2   c3   s3  bit1
Xbit4    ina4  inb4  c3   s4  bit2
.ends 

.subckt group2 ina1 inb1 ina2 inb2 ina3 inb3 ina4 inb4 g41 p41
Xbit1    ina1  inb1 g11  p11  bit4
Xbit2    ina2  inb2 g11  p11  g21  p21  bit3 
Xbit3    ina3  inb3 g21  p21  g31  p31  bit3
Xbit4    ina4  inb4 g31  p31  g41  p41  bit3
.ends

****************************** Selector ******************************
.subckt select c0 p41 g41 g40
Xm   c0  p41   X  and
Xg40 g41  X   g40 or 
.ends

****************************** Netlist *******************************
Vdd Vdd 0 'SUPPLY'

XGROUP1_1  c0  ina1 inb1 ina2 inb2 ina3 inb3 ina4 inb4 s1 s2 s3 s4 group1
XGROUP2_1 ina1 inb1 ina2 inb2 ina3 inb3 ina4 inb4 g41 p41 group2
XSELECT1   c0  p41  g41  g40 select

XGROUP1_2 g40  ina5 inb5 ina6 inb6 ina7 inb7 ina8 inb8 s5 s6 s7 s8 group1
XGROUP2_2 ina5 inb5 ina6 inb6 ina7 inb7 ina8 inb8 g85 p85 group2
XSELECT2  g40  p85  g85  g80 select

XGROUP1_3 g80  ina9 inb9  ina10 inb10 ina11 inb11 ina12 inb12 s9 s10 s11 s12 group1
XGROUP2_3 ina9 inb9 ina10 inb10 ina11 inb11 ina12 inb12 g129 p129 group2
XSELECT3  g80  p129 g129  g120  select

XGROUP1_4 g120  ina13 inb13 ina14 inb14 ina15 inb15 ina16 inb16 s13 s14 s15 s16 group1
XGROUP2_4 ina13 inb13 ina14 inb14 ina15 inb15 ina16 inb16 g1613 p1613 group2
XSELECT4  g120  p1613 g1613 g160 select

Va1   ina1    0    0
Va2   ina2    0    0
Va3   ina3    0    0
Va4   ina4    0    0
Va5   ina5    0    0
Va6   ina6    0    0
Va7   ina7    0    0
Va8   ina8    0    0
Va9   ina9    0    0
Va10  ina10   0    0
Va11  ina11   0    0
Va12  ina12   0    0
Va13  ina13   0    0
Va14  ina14   0    0
Va15  ina15   0    0
Va16  ina16   0    0
Vb1   inb1    0 'SUPPLY'
Vb2   inb2    0 'SUPPLY'
Vb3   inb3    0 'SUPPLY'
Vb4   inb4    0 'SUPPLY'
Vb5   inb5    0 'SUPPLY'
Vb6   inb6    0 'SUPPLY'
Vb7   inb7    0 'SUPPLY'
Vb8   inb8    0 'SUPPLY'
Vb9   inb9    0 'SUPPLY'
Vb10  inb10   0 'SUPPLY'
Vb11  inb11   0 'SUPPLY'
Vb12  inb12   0 'SUPPLY'
Vb13  inb13   0 'SUPPLY'
Vb14  inb14   0 'SUPPLY'
Vb15  inb15   0 'SUPPLY'
Vb16  inb16   0 'SUPPLY'
Vc     c0     0  pulse   0 'SUPPLY' 100ps 500ps 500ps 50ns 100ns 

*.vec stimulus.vect
*.tran 100p 100n
****************************** Measure *******************************
.tran 100ps 1u
.measure TRAN   tplh
 + TRIG  v(c0)  VAL='SUPPLY/2' RISE=2 
 + TARG v(g160) VAL='SUPPLY/2' RISE=2
 .measure TRAN  tphl
 + TRIG  v(c0)  VAL='SUPPLY/2' FALL=2
 + TARG v(g160) VAL='SUPPLY/2' FALL=2 
.measure  tp    param='(tphl+tplh)/2'

.END