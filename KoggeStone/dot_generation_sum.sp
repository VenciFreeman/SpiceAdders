********************************************************** 
***    describe here the p-g generation blocks, the    *** 
***      sums blocks and the dot operators blocks      *** 
********************************************************** 
.include ./basic_gates.sp  
.subckt dot    G_ik G_kj P_ik P_kj  G_ij P_ij N=1 
xandnor P_ik G_kj G_ik G_ij_not andnor_stat M=2*N 
xnot1 G_ij_not G_ij not M=3*N 
xnand P_ik P_kj P_ij_not nand_stat M=1*N 
xnot2 P_ij_not P_ij  not M=3*N 
.ends dot 
 
.subckt generation a b G P N=1 
xnot1 a a_not not M=3*N 
xnot2 b b_not not M=3*N 
xnand a b ab_not nand_stat M=1*N 
xnot3 ab_not G not M=3*N 
xxor  a a_not b b_not P xor_stat M=12*N 
.ends generation 
 
.subckt sum P G  S N=12.5 
xnot1 P P_not not M=N 
xnot2 G G_not not M=N 
xxor P P_not G G_not S xor_stat M=4*N 
.ends sum