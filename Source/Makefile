CPPFLAGS = -shared
CPPLIBS = -static-libgcc -static-libstdc++
CFLAGS = -std=c99

DLL_PATH = .\triggers
PATCHER_PATH = .\patcher
OUTPUT_PATH = .\bin

all : dll exe

dll : $(DLL_PATH)\triggers.cpp $(DLL_PATH)\triggers.h $(DLL_PATH)\strsafe.h $(DLL_PATH)\_triggers.rc $(DLL_PATH)\triggers_hook.asm
	if not exist $(OUTPUT_PATH) mkdir $(OUTPUT_PATH)
	fasm $(DLL_PATH)\triggers_hook.asm
	windres $(DLL_PATH)\_triggers.rc $(DLL_PATH)\_triggers.o
	g++ -c $(DLL_PATH)\triggers.cpp -o $(DLL_PATH)\triggers.o
	g++ $(CPPFLAGS) $(CPPLIBS) -o $(OUTPUT_PATH)\triggers.dll $(DLL_PATH)\triggers_hook.o $(DLL_PATH)\triggers.o $(DLL_PATH)\_triggers.o

exe : $(PATCHER_PATH)\patcher.c $(PATCHER_PATH)\functions.h $(PATCHER_PATH)\functions.c $(PATCHER_PATH)\_patcher.rc $(PATCHER_PATH)\icon.ico $(OUTPUT_PATH)\triggers.dll
	copy $(OUTPUT_PATH)\triggers.dll $(PATCHER_PATH)
	windres $(PATCHER_PATH)\_patcher.rc $(PATCHER_PATH)\_patcher.o
	gcc -c $(PATCHER_PATH)\functions.c $(CFLAGS) -o $(PATCHER_PATH)\functions.o
	gcc -c $(PATCHER_PATH)\patcher.c -lm $(CFLAGS) -o $(PATCHER_PATH)\patcher.o
	gcc -o $(OUTPUT_PATH)\patcher.exe $(PATCHER_PATH)\patcher.o $(PATCHER_PATH)\functions.o $(PATCHER_PATH)\_patcher.o $(CFLAGS)

clean :
	del $(DLL_PATH)\*.o
	del $(PATCHER_PATH)\*.o
	del $(PATCHER_PATH)\*.dll