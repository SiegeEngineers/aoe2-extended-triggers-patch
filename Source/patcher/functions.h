#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <windows.h>

#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#define PATCH_AMOUNT 5

bool patchExe(char *inputName, char *outputName);
void restoreBackup(char *inputName);

void patchExeSilent(char *inputName, char *outputName);
void restoreBackupSilent(char *inputName);

void printHeader();
bool applyPatch(FILE *ptr, __int32 offset, __int32 size, const char *patch);
bool getStrFromInput(char *str, int length);
void saveResourceToFile(FILE *ptr, int resID);
void discardExtraInputChars();
void forceWorkingPath();

#endif