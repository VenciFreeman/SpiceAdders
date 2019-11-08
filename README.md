# Adders

## Introduction

- This Project uses SPICE to simulate and optimize a 16-bit adder.
  - The main program simulated a **16-bit carry skip adder**;
  - Used stimulus vector;
  - Tried **Kogge-Stone adder** and modular, but **haven't achieve it**.
- Programming Environment: Visual Studio Code;
- Simulating Environment: hspui J-2014.09-2;
- Viewing Environment: SPICE Explorer c2009.03.

## Procedures

1. Create .sp code file, call library, configure the analysis and output parameters;
2. Simulate some basic logic gates and sub circuits such as 2-AND, 2-OR and 2-XOR;
3. Add the bit calculation modules;
4. Add the group calculation modules;
5. Add a selector;
6. Edit the netlist of the circuit;
7. Define the input by stimulus vector
8. Add the measure statements to measure the delay.
9. Simulate;
10. Optimize by modifying the sizes of transistor.

## Results

```spice
****** transient analysis tnom = 25.000 temp = 90.000 ******
tplh = -23.9074p  targ = 100.3261n  trig = 100.3500n
tphl =  29.7033p  targ = 150.8797n  trig = 150.8500n
tp   =  2.8979p
```

## Technical Analysis

### Fixed size

Fixed size block-carry-skip adders split the bits of the input bits into blocks of bits each, resulting in k=n/m blocks. The critical path consists of the ripple path and the skip element of the first block, the skip paths that are enclosed between the first and the last block, and finally the ripple-path of the last block. The optimal block size for a given adder width n is derived by equating to 0. And only positive block sizes are realizable: m=sqrt(n/2)

### Variable size

The performance can be improved, i.e. all carries propagated more quickly by varying the block sizes. Accordingly the initial blocks of the adder are made smaller so as to quickly detect carry generates that must be propagated the furthers, the middle blocks are made larger because they are not the problem case, and then the most significant blocks are again made smaller so that the late arriving carry inputs can be processed quickly.

### optimization

This problem is made complex by the fact that a carry-skip adders are implemented with physical devices whose size and other parameters also affects addition time.

## Conclusions

A carry-skip adder consists of a simple ripple carry-adder with a special speed up carry chain called a skip chain. Carry skip adder is a fast adder compared to ripple carry adder when addition of large number of bits take place; carry skip adder has O(sqrt(n)) delay provides a good compromise in terms of delay, along with a simple and regular layout This chain defines the distribution of ripple carry blocks, which compose the skip adder. A carry-skip adder is designed to speed up a wide adder by aiding the propagation of a carry bit around a portion of the entire adder. Actually the ripple carry adder is faster for small values of N.

- the basic idea is to form multi-level carry chains
  - Break the bits into groups
  - Ripple the carry in each group, in parallel
  - Ripple the global carry across the groups
    - Middle groups have longer to generate carry outs; should be larger
    - Early and late groups have ripples in critical path; should be shorter

The adder topology which has the best compromise between area, delay and power dissipation are carry look-ahead and carry increment adders and they are suitable for high performance and low-power circuits. The fastest adders are carry select and carry save adders with the penalty of area. The simplest adder topologies that are suitable for low power applications are ripple carry adder, carry skip and carry bypass adder with least gate count and maximum delay.
