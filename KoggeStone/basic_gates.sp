***** these are all the basic gates ***** 
.subckt not    in out    M=1 
mn1p   out in vss vss   nmos   l=0.25u w='0.25u*1*M' 
mp1p   out in vdd vdd   pmos   l=0.25u w='0.25u*2*M' 
.ends not 
 
.subckt andnor_stat    a_and b_and c_nor out M=1 
mn0  n3  a_and  vss vss nmos l=0.25u w='0.25u*2*M' 
mn1  out b_and  n3  vss nmos l=0.25u w='0.25u*2*M' 
mn2  out c_nor  vss vss nmos l=0.25u w='0.25u*1*M' 
mp0  n5  a_and  vdd vdd pmos l=0.25u w='0.25u*4*M' 
mp1  n5  b_and  vdd vdd pmos l=0.25u w='0.25u*4*M' 
mp2  out c_nor  n5  vdd pmos l=0.25u w='0.25u*4*M' 
.ends andnor_stat 
 
.subckt nand_stat    a b out   M=1 
mn0  n1  a   vss vss nmos l=0.25u w='0.25u*2*M' 
mn1  out b   n1  vss nmos l=0.25u w='0.25u*2*M' 
mp0  out a   vdd vdd pmos l=0.25u w='0.25u*2*M' 
mp1  out b   vdd vdd pmos l=0.25u w='0.25u*2*M' 
.ends nand_stat 
 
.subckt xor_stat    a a_not b b_not out M=1 
mp0   n0  a     vdd vdd   pmos   l=0.25u w='0.25u*4*M' 
mp1   out b_not n0  vdd   pmos   l=0.25u w='0.25u*4*M' 
mp2   n1  b     vdd vdd   pmos   l=0.25u w='0.25u*4*M' 
mp3   out a_not n1  vdd   pmos   l=0.25u w='0.25u*4*M' 
mn0   n2  a     vss vss   nmos   l=0.25u w='0.25u*2*M' 
mn1   out b     n2  vss   nmos   l=0.25u w='0.25u*2*M' 
mn2   n3  a_not vss vss   nmos   l=0.25u w='0.25u*2*M' 
mn3   out b_not n3  vss   nmos   l=0.25u w='0.25u*2*M' 
.ends xor_stat 
 
.subckt buffer in out  
xnot1 in in_not not 
xnot2 in_not out not 
.ends buffer