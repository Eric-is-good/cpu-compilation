# cpu-compilation


电子科技大学的计算机组成原理实验课，并在此基础上实现了汇编编译器



## fpga_for_cpu



fpga_for_cpu 文件用 verilog 实现了 32 位 cpu ，架构如下



![架构](https://github.com/Eric-is-good/cpu-compilation/blob/main/pic/%E6%9E%B6%E6%9E%84.jpg)



实现了以下指令



![指令](https://github.com/Eric-is-good/cpu-compilation/blob/main/pic/%E6%8C%87%E4%BB%A4.jpg)







## python_for_compilation


一个利用 python 的正则匹配写的编译器，实现汇编到机器码的编译，最多支持 32 条语句。

instruction.txt 用来写汇编语句，**支持  //  的注释方式，在写完后必须加一行回车**，否则最后一条指令读不到。

运行 python 后即可在 instruction_out.txt  中得到汇编的 Verilog 代码。

将 Verilog 代码 替换至  INST_ROM.v 即可运行。


![verilog](https://github.com/Eric-is-good/cpu-compilation/blob/main/pic/verilog.jpg)
