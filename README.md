# pfd-parallel-listnumden-converter

## Important Notice
This repo. has stopped maintaining since the end of 2023. All its main code is integrated in the pfd-parallel Mathematica interface: [PfdParallelM](https://github.com/Wu-Zihao/PfdParallelM).



## Usage

pfd-parallel-listnumden-converter is a format converter for [pfd-parallel](https://github.com/singular-gpispace/pfd-parallel).

**pfd-parallel** is a package to simplify rational functions by partial fraction decomposition. It is based on the [Singular/GPI-Space framework](https://www.mathematik.uni-kl.de/~boehm/singulargpispace/). Thus, the input rational functions of **pfd-parallel** should be prepared in **Singular** readable format, which are *.ssi* or listnumden (*.txt*). See [here](https://github.com/singular-gpispace/pfd-parallel#configuration-options-for-pfd_parallel) for more details. 

This package provides a parallel conversion from **Mathematica** readable files to **Singular** readable listnumden (*.txt*) files, so that they can be used as inputs for **pfd-parallel**. For example, the expression $x+\frac{x+yz}{z^2}$ will be converted to `list(list(x,1),list(x+y*z,z^2))` in listnumden txt files.

## How to use
1. Prepare your rational functions in separated Mathematica readable files (which means you can read it in Mathematica by `somename=Get["some path"]`). The files should be put in the same folder, and the folder should contain no other file or sub directory. Let the folder be labled as \[inputFolder\].
2. Run
```
math -script listnumden-converter.wl [inputFolder] [outputFolder]
```
3. The converted rational functions in form of listnumden will be exported to \[outputFolder\].

## More about
1. You can use the converter in Mathematica notebook. If so, remember to set `commandLineMode=False` and type in the \[inputFolder\] and \[outputFolder\] by hand.
2. It is recommended to use absolute paths for \[inputFolder\] and \[outputFolder\].
3. If \[outputFolder\] dose not exit, it will be created. If it exists, the files inside may be overwritten with no warning message.
4. The conversion is in parallel using Mathmatica's ParallelTable.
