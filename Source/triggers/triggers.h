#ifndef TRIGGERS_AUX_H
#define TRIGGERS_AUX_H

#include <windows.h>
#include "strsafe.h"

typedef enum VARIABLE_TYPE {
	NONE,
	PLAYER_NAME,
	RESOURCE,
	FLOAT_RESOURCE,
	VARIABLE,
	GAME_TIME,
	CIVILIZATION,
	STRING_ID,
	GAME_TIME_YEARS,
	GAME_TIME_HMS
} VARIABLE_TYPE;

void __stdcall Init(HINSTANCE hinstDLL);

extern "C" __declspec(dllexport)
void __cdecl stringParser(const char* src, char* dest, void* masterPointer, DWORD* varPointer);

#endif