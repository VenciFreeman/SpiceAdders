**** this is the Kogge-Stone adder **** 
.include ./dot_generation_sum.sp 
.subckt KS_adder a[15:0] b[15:0] sum[15:0] 
 
xgene0 a0 b0 G0 P0 generation  
xgene1 a1 b1 G1 P1 generation  
xgene2 a2 b2 G2 P2 generation  
xgene3 a3 b3 G3 P3 generation  
xgene4 a4 b4 G4 P4 generation  
xgene5 a5 b5 G5 P5 generation  
xgene6 a6 b6 G6 P6 generation  
xgene7 a7 b7 G7 P7 generation  
xgene8 a8 b8 G8 P8 generation  
xgene9 a9 b9 G9 P9 generation  
xgene10 a10 b10 G10 P10 generation  
xgene11 a11 b11 G11 P11 generation  
xgene12 a12 b12 G12 P12 generation  
xgene13 a13 b13 G13 P13 generation  
xgene14 a14 b14 G14 P14 generation  
xgene15 a15 b15 G15 P15 generation  
 
xdot1_0 G1 G0 P1 P0 G1_0 P1_0  dot 
xdot2_1 G2 G1 P2 P1 G2_1 P2_1  dot 
xdot3_2 G3 G2 P3 P2 G3_2 P3_2  dot 
xdot4_3 G4 G3 P4 P3 G4_3 P4_3  dot 
xdot5_4 G5 G4 P5 P4 G5_4 P5_4  dot 
xdot6_5 G6 G5 P6 P5 G6_5 P6_5  dot 
xdot7_6 G7 G6 P7 P6 G7_6 P7_6  dot 
xdot8_7 G8 G7 P8 P7 G8_7 P8_7  dot 
xdot9_8 G9 G8 P9 P8 G9_8 P9_8  dot 
xdot10_9 G10 G9 P10 P9 G10_9 P10_9  dot 
xdot11_10 G11 G10 P11 P10 G11_10 P11_10  dot 
xdot12_11 G12 G11 P12 P11 G12_11 P12_11  dot 
xdot13_12 G13 G12 P13 P12 G13_12 P13_12  dot 
xdot14_13 G14 G13 P14 P13 G14_13 P14_13  dot 
xdot15_14 G15 G14 P15 P14 G15_14 P15_14  dot 
 
xdot2_0 G2_1 G0 P2_1 P0 G2_0 P2_0 dot 
xdot3_0 G3_2 G1_0 P3_2 P1_0 G3_0 P3_0 dot 
xdot4_1 G4_3 G2_1 P4_3 P2_1 G4_1 P4_1 dot 
xdot5_2 G5_4 G3_2 P5_4 P3_2 G5_2 P5_2 dot 
xdot6_3 G6_5 G4_3 P6_5 P4_3 G6_3 P6_3 dot 
xdot7_4 G7_6 G5_4 P7_6 P5_4 G7_4 P7_4 dot 
xdot8_5 G8_7 G6_5 P8_7 P6_5 G8_5 P8_5 dot 
xdot9_6 G9_8 G7_6 P9_8 P7_6 G9_6 P9_6 dot 
xdot10_7 G10_9 G8_7 P10_9 P8_7 G10_7 P10_7 dot 
xdot11_8 G11_10 G9_8 P11_10 P9_8 G11_8 P11_8 dot 
xdot12_9 G12_11 G10_9 P12_11 P10_9 G12_9 P12_9 dot 
xdot13_10 G13_12 G11_10 P13_12 P11_10 G13_10 P13_10 dot 
xdot14_11 G14_13 G12_11 P14_13 P12_11 G14_11 P14_11 dot 
xdot15_12 G15_14 G13_12 P15_14 P13_12 G15_12 P15_12 dot 
 
xdot4_0 G4_1 G0 P4_1 P0 G4_0 P4_0 dot 
xdot5_0 G5_2 G1_0 P5_2 P1_0 G5_0 P5_0 dot 
xdot6_0 G6_3 G2_0 P6_3 P2_0 G6_0 P6_0 dot 
xdot7_0 G7_4 G3_0 P7_4 P3_0 G7_0 P7_0 dot 
xdot8_1 G8_5 G4_1 P8-5 P4_1 G8_1 P8_1 dot 
xdot9_2 G9_6 G5_2 P9_6 P5_2 G9_2 P9_2 dot 
xdot10_3 G10_7 G6_3 P10_7 P6_3 G10_3 P10_3 dot 
xdot11_4 G11_8 G7_4 P11_8 P7_4 G11_4 P11_4 dot 
xdot12_5 G12_9 G8_5 P12_9 P8_5 G12_5 P12_5 dot 
xdot13_6 G13_10 G9_6 P13_10 G9_6 G13_6 P13_6 dot 
xdot14_7 G14_11 G10_7 P14_11 P10_7 G14_7 P14_7 dot 
xdot15_8 G15_12 G11_8 P15_12 P11_8 G15_8 P15_8 dot 
 
xdot8_0 G8_1 G0 P8_1 P0 G8_0 P8_0 dot 
xdot9_0 G9_2 G1_0 P9_2 P1_0 G9_0 P9_0 dot 
xdot10_0 G10_3 G2_0 P10_3 P2_0 G10_0 P10_0 dot 
xdot11_0 G11_4 G3_0 P11_4 P3_0 G11_0 P11_0 dot 
xdot12_0 G12_5 G4_0 P12_5 P4_0 G12_0 P12_0 dot 
xdot13_0 G13_6 G5_0 P13_6 P5_0 G13_0 P13_0 dot 
xdot14_0 G14_7 G6_0 P14_7 P6_0 G14_0 P14_0 dot 
xdot15_0 G15_8 G7_0 P15_8 P7_0 G15_0 P15_0 dot 
 
xsum0 P0 0 sum0 sum  
xsum1 P1 G0 sum1 sum  
xsum2 P2 G1_0 sum2 sum 
xsum3 P3 G2_0 sum3 sum 
xsum4 P4 G3_0 sum4 sum 
xsum5 P5 G4_0 sum5 sum 
xsum6 P6 G5_0 sum6 sum 
xsum7 P7 G6_0 sum7 sum 
xsum8 P8 G7_0 sum8 sum 
xsum9 P9 G8_0 sum9 sum 
xsum10 P10 G9_0 sum10 sum 
xsum11 P11 G10_0 sum11 sum 
xsum12 P12 G11_0 sum12 sum 
xsum13 P13 G12_0 sum13 sum 
xsum14 P14 G13_0 sum14 sum 
xsum15 P15 G14_0 sum15 sum 
 
.ends KS_adder 
.end