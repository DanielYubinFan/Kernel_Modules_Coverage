## To calculate the code coverage of a linux kernel module by GCOV & LCOV

Let me take e1000 network driver module as an example. The path of its code in linux source package is /linux-x.x.x/drivers/net/ethernet/intel/e1000. 

### Re-compile the kernel with GCOV functionality enabled.
I recommand you to use "make menuconfig" to configure the GCOV functionatity. Follow [here](https://medium.freecodecamp.org/building-and-installing-the-latest-linux-kernel-from-source-6d8df5345980) to recompile a linux kernel and install it. When you enter:
```
sudo make menuconfig
```
you'll come into a config GUI. Follow [these](https://github.com/DanielYubinFan/Kernel_Modules_Coverage/issues/1) images to enable GCOV utilities. 

### Instrument the code with GOCV flags
Add GCOV compliation flags into e1000's Makefile. 
```
GCOV_PROFILE := y
CCFLAGS = -ftest-coverage -fprofile-arcs
export CCFLAGS
```
Then re-make and re-install the whole kernel and re-boot the machine. The compliation results are under /sys/kernel/debug/gcov/$pwd. Each of the source code file has its own .gcda and .gcno files.

![](https://github.com/DanielYubinFan/Kernel_Modules_Coverage/blob/master/Screenshot%20from%202017-08-02%2014:16:07.png)
![](https://github.com/DanielYubinFan/Kernel_Modules_Coverage/blob/master/Screenshot%20from%202017-08-02%2014:17:18.png)

(there are also a e1000.mod.gcno in the source code folder)

### Run workload by the new module
Remove the old e1000 module and install youe new e1000.ko. When the new module is initialized and run, the .gcda and .gcno files are updated. Then you need to run some commands to invoke the driver functions. [Here](https://github.com/DanielYubinFan/Kernel_Modules_Coverage/blob/master/workload.sh) is my workload file, it's composed by some ethernet commmands. You can also build your onw workload. 

## Generate coverage data
After running the new module, you can generate coverage data by using lcov commands (geninfo && genhtml) which take .gcda and .gcno as sources (install lcov before). Or you can use my [kcov.sh](https://github.com/DanielYubinFan/Kernel_Modules_Coverage/blob/master/kcov.sh) directly under the e1000 source code path.
Coverage information is displayed in the .html files which are in the lcov_data folder.
![](https://github.com/DanielYubinFan/Kernel_Modules_Coverage/blob/master/Screenshot%20from%202017-08-02%2014:44:05.png)















