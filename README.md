# Extended Triggers Patch

Summary
-------

The Extended Triggers Patch improves the Scenario Designing experience in the UserPatch by adding new trigger effects and conditions.

Besides of that, this patch also introduces a variable system, which allows the use of 256 variables, which can be manipulated by special conditions and effects

The Extended Triggers Patch requires the latest version of UserPatch 1.5 in order to be installed properly. Attempting to apply it on executables in non-UP executables can cause severe damage to them.  

More information about the patch, including full changelog and the full list of new conditions and effects can be found at the documents in the `Documentation` directory.


Compiling and Installing
------------------------

In case the system enviroment variables are properly set for the usage of MinGW, [flat assembler](https://flatassembler.net) and Make, both the main DLL and the patcher executable of the Extended Triggers Patch can be compiled through the usage of the Makefile. Otherwise, in order to compile and install the Extended Triggers patch, the following steps will need to be followed:
1. Compile `triggers.dll` from the source files in the `triggers` directory by using MinGW and the [flat assembler](https://flatassembler.net) and running the following commands:
```
fasm triggers_hook.asm
windres _triggers.rc _triggers.o
g++ -c triggers.cpp
g++ -shared -o triggers.dll triggers_hook.o triggers.o _triggers.o -static-libgcc -static-libstdc++
```
2. Compile the patcher with MinGW by moving the compiled output of step 1 the `patcher` directory and running the following commands, if you want to install the Extended Triggers Patch through the patcher:
```
windres _patcher.rc _patcher.o
gcc -c functions.c -std=c99
gcc -c patcher.c -lm -std=c99
gcc -o patcher.exe patcher.o functions.o _patcher.o -std=c99
```
3. Move the compiled output from step 1 into the folder where the AoE2TC with UserPatch 1.5 executable is located and inject the `triggers.dll` into it (which will, in turn, load the `triggers_aux.dll` file)
4. OR place the compiled patcher into the directory where AoE2TC is installed, run it and follow the instructions onscreen