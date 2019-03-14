# Extended Triggers Patch

Summary
-------

The Extended Triggers Patch improves the Scenario Designing experience in the UserPatch by adding new trigger effects and conditions.

Besides of that, this patch also introduces a variable system, which allows the use of 256 variables, which can be manipulated by special conditions and effects

The Extended Triggers Patch requires the latest version of UserPatch 1.5 in order to be installed properly. Attempting to apply it on executables in non-UP executables can cause severe damage to them.  

More information about the patch, including full changelog and the full list of new conditions and effects can be found at the documents in the `Documentation` directory.


Compiling and Installing
------------------------

In order to compile and install the Extended Triggers patch, just follow the following steps:
1. Compile `triggers.dll` from the triggers.asm source file using the [flat assembler](https://flatassembler.net)
2. Compile `triggers_aux.dll` from the source files in the `triggers_aux` directory by using MinGW and running the following commands:
```
g++ -c triggers_aux.cpp
g++ -shared -o triggers_aux.dll triggers_aux.o
```
3. Compile the patcher with MinGW by moving the compiled output of steps 1 and 2 to the `patcher` directory and running the following commands, if you want to install the Extended Triggers Patch through the patcher:
```
windres ExtendedTriggersPatch\_patcher.rc _patcher.o
gcc -c ExtendedTriggersPatch\functions.c -std=c99
gcc -c ExtendedTriggersPatch\patcher.c -lm -std=c99
gcc -o ExtendedTriggersPatch\patcher.exe patcher.o functions.o _patcher.o -std=c99
```
4. Move the compiled output from steps 1 and 2 into the folder where the AoE2TC with UserPatch 1.5 executable is located and inject the `triggers.dll` into it (which will, in turn, load the `triggers_aux.dll` file)
5. OR place the compiled patcher into the directory where AoE2TC is installed, run it and follow the instructions onscreen