# pfd-parallel-listnumden-converter

## Usage

This is a format converter for [pfd-parallel](https://github.com/singular-gpispace/pfd-parallel).

**pfd-parallel** is a package to simplify rational functions by partial fraction decomposition. It is based on the [Singular/GPI-Space framework](https://www.mathematik.uni-kl.de/~boehm/singulargpispace/). Thus, the input rational functions of **pfd-parallel** should be prepared in **Singular** readable format, which are *.ssi* or listnumden (*.txt*). See [here](https://github.com/singular-gpispace/pfd-parallel#configuration-options-for-pfd_parallel) for more details.

This package provides a parallel conversion from **Mathematica** readable files to **Singular** readable listnumden (*.txt*) files. For example, the expression $x+\frac{x+yz}{z^2}$ will be converted to `list(list(x,1),list(x+y*z,z^2))` in listnumden txt files.


