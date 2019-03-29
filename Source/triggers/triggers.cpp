#include "triggers.h"

int readBuffer(char* buffer, DWORD* varPointer) {
    if (buffer[0] == 'v')
        return varPointer[atoi(&buffer[1])];
    else
        return atoi(buffer);
}

extern "C" __declspec(dllexport)
void __cdecl stringParser(const char* src, char* dest, void* masterPointer, DWORD* varPointer) {
    int srcPos = 0, destPos = 0;
    VARIABLE_TYPE currentType = NONE;
    char tmpBuffer[7];
    int bufferPos = 0;
    bool varDetected = false;
    bool startReading = false;
    bool playerIDReadStarted = false;
    bool yearCtdwnStartReadStarted = false;
    int resPlayerID = -1;
    int yearCtdwnStart = -1;

    while (src[srcPos] && destPos < 256) {
        switch (src[srcPos]) {
            case '{':
                if (varDetected) {
                    dest[destPos] = '\0';
                    return;
                }
                else {
                    varDetected = true;
                }
                break;
            case 'P':
                if (varDetected && currentType == NONE) {
                    currentType = PLAYER_NAME;
                    tmpBuffer[0] = '\0';
                    bufferPos = 0;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'S':
                if (varDetected && currentType == NONE) {
                    currentType = STRING_ID;
                    tmpBuffer[0] = '\0';
                    bufferPos = 0;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'R':
                if (varDetected && currentType == NONE) {
                    currentType = RESOURCE;
                    tmpBuffer[0] = '\0';
                    bufferPos = 0;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'C':
                if (varDetected && currentType == NONE) {
                    currentType = CIVILIZATION;
                    tmpBuffer[0] = '\0';
                    bufferPos = 0;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'V':
                if (varDetected && currentType == NONE) {
                    currentType = VARIABLE;
                    tmpBuffer[0] = '\0';
                    bufferPos = 0;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'T':
                if (varDetected && currentType == NONE) {
                    currentType = GAME_TIME;
                    tmpBuffer[0] = '\0';
                    bufferPos = 0;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'f':
                if (varDetected && !startReading && currentType == RESOURCE) {
                    currentType = FLOAT_RESOURCE;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'h':
                if (varDetected && !startReading && currentType == GAME_TIME) {
                    currentType = GAME_TIME_HMS;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case 'y':
                if (varDetected && !startReading && currentType == GAME_TIME) {
                    currentType = GAME_TIME_YEARS;
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case ':':
                if (varDetected) {
                    startReading = true;

                    if (currentType == RESOURCE || currentType == FLOAT_RESOURCE) {
                        if (!playerIDReadStarted) {
                            playerIDReadStarted = true;
                        }
                        else {
                            tmpBuffer[bufferPos] = '\0';
                            resPlayerID = readBuffer(tmpBuffer, varPointer);
                            tmpBuffer[0] = '\0';
                            bufferPos = 0;
                            playerIDReadStarted = false;
                        }
                    }
                    else if (currentType == GAME_TIME_YEARS) {
                        if (!yearCtdwnStartReadStarted) {
                            yearCtdwnStartReadStarted = true;
                        }
                        else {
                            tmpBuffer[bufferPos] = '\0';
                            yearCtdwnStart = readBuffer(tmpBuffer, varPointer);
                            tmpBuffer[0] = '\0';
                            bufferPos = 0;
                            yearCtdwnStartReadStarted = false;
                        }
                    }
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
            case '}':
                varDetected = false;
                startReading = false;
                tmpBuffer[bufferPos] = '\0';

                switch (currentType) {
                    case PLAYER_NAME: {
                        int playerID = readBuffer(tmpBuffer, varPointer);
                        void* playerInfoPtr = (void*)*(DWORD*)((DWORD)masterPointer + 0x424);
                        WORD playerAmount = *((WORD*)((DWORD)playerInfoPtr + 0x48));

                        if (playerID > 0 && playerID <= (int)playerAmount) {
                            BYTE** playerPtrArray = *(BYTE***)((DWORD)playerInfoPtr + 0x4C);
                            char* playerName = *(char**)(playerPtrArray[playerID] + 0x98);

                            int i = 0;

                            while (playerName[i] && destPos < 256)
                                dest[destPos++] = playerName[i++];
                        }

                        break;
                    }
                    case STRING_ID: {
                        DWORD stringID = (DWORD)readBuffer(tmpBuffer, varPointer);
                        char*(__thiscall* getStringFromID)(void* masterPointer, DWORD stringID) = reinterpret_cast<char*(__thiscall*)(void*, DWORD)>(*(DWORD*)(*(DWORD*)masterPointer + 0x24));
                        char* langString = getStringFromID(masterPointer, stringID);
                        
                        int i = 0;

                        if (langString != NULL) {
                            while (langString[i] && destPos < 256)
                                dest[destPos++] = langString[i++];
                        }

                        break;
                    }
                    case RESOURCE: {
                        DWORD resourceID = (DWORD)readBuffer(tmpBuffer, varPointer);

                        void* playerInfoPtr = (void*)*(DWORD*)((DWORD)masterPointer + 0x424);
                        WORD playerAmount = *((WORD*)((DWORD)playerInfoPtr + 0x48));

                        if (resPlayerID > 0 && resPlayerID <= (int)playerAmount) {
                            BYTE** playerPtrArray = *(BYTE***)((DWORD)playerInfoPtr + 0x4C);
                            float* playerResources = *(float**)(playerPtrArray[resPlayerID] + 0x0A8);

                            StringCchPrintfA(&dest[destPos], 256 - destPos, "%d", (int) playerResources[resourceID]);

                            while (dest[destPos] && destPos < 256)
                                destPos++;

                        }

                        break;
                    }
                    case FLOAT_RESOURCE: {
                        DWORD resourceID = (DWORD)readBuffer(tmpBuffer, varPointer);

                        void* playerInfoPtr = (void*)*(DWORD*)((DWORD)masterPointer + 0x424);
                        WORD playerAmount = *((WORD*)((DWORD)playerInfoPtr + 0x48));

                        if (resPlayerID > 0 && resPlayerID <= (int)playerAmount) {
                            BYTE** playerPtrArray = *(BYTE***)((DWORD)playerInfoPtr + 0x4C);
                            float* playerResources = *(float**)(playerPtrArray[resPlayerID] + 0x0A8);

                            StringCchPrintfA(&dest[destPos], 256 - destPos, "%.2f", playerResources[resourceID]);

                            while (dest[destPos] && destPos < 256)
                                destPos++;

                        }

                        break;
                    }
                    case CIVILIZATION: {
                        int playerID = readBuffer(tmpBuffer, varPointer);
                        void* playerInfoPtr = (void*)*(DWORD*)((DWORD)masterPointer + 0x424);
                        WORD playerAmount = *((WORD*)((DWORD)playerInfoPtr + 0x48));

                        if (playerID > 0 && playerID <= (int)playerAmount) {
                            BYTE** playerPtrArray = *(BYTE***)((DWORD)playerInfoPtr + 0x4C);
                            BYTE civID = *(playerPtrArray[playerID] + 0x15D);

                            char*(__thiscall* getStringIDFromAction)(void* masterPointer, DWORD actionID, DWORD subActionID, DWORD resourceID, char* destBuffer, DWORD destBufferSize) = reinterpret_cast<char*(__thiscall*)(void*, DWORD, DWORD, DWORD, char*, DWORD)>(0x0043CF60);
                            getStringIDFromAction(masterPointer, 0x69, (DWORD)civID, 0, &dest[destPos], 256 - destPos);

                            while (dest[destPos] && destPos < 256)
                                destPos++;
                        }

                        break;
                    }
                    case VARIABLE: {
                        DWORD variableID = (DWORD)readBuffer(tmpBuffer, varPointer);

                        StringCchPrintfA(&dest[destPos], 256 - destPos, "%d", (int) varPointer[variableID]);

                        while (dest[destPos] && destPos < 256)
                            destPos++;

                        break;
                    }
                    case GAME_TIME: {
                        BYTE* gameInfoPtr = (BYTE*)*(DWORD*)((DWORD)masterPointer + 0x424);
                        float gameTime = ((float)*(DWORD*)(gameInfoPtr + 0x10))/1000;

                        StringCchPrintfA(&dest[destPos], 256 - destPos, "%.2d:%.2d:%.2d", (int)(gameTime / (60*60)), (int) (gameTime/60) % 60, (int) gameTime % 60);

                        while (dest[destPos] && destPos < 256)
                            destPos++;

                        break;
                    }
                    case GAME_TIME_HMS: {
                        BYTE* gameInfoPtr = (BYTE*)*(DWORD*)((DWORD)masterPointer + 0x424);
                        float gameTime = ((float)*(DWORD*)(gameInfoPtr + 0x10)) / 1000;
                        int gameSeconds = (int)gameTime % 60;
                        int gameMinutes = (int)(gameTime / 60) % 60;
                        int gameHours = (int)(gameTime / (60*60));

                        if (gameHours > 0)
                            StringCchPrintfA(&dest[destPos], 256 - destPos, "%.2dh%.2dm%.2ds", gameHours, gameMinutes, gameSeconds);
                        else if (gameMinutes > 0)
                            StringCchPrintfA(&dest[destPos], 256 - destPos, "%.2dm%.2ds", gameMinutes, gameSeconds);
                        else
                            StringCchPrintfA(&dest[destPos], 256 - destPos, "%.2ds", gameSeconds);

                        while (dest[destPos] && destPos < 256)
                            destPos++;

                        break;
                    }
                    case GAME_TIME_YEARS: {
                        BYTE* gameInfoPtr = (BYTE*)*(DWORD*)((DWORD)masterPointer + 0x424);
                        float gameTime = ((float)*(DWORD*)(gameInfoPtr + 0x10)) / 1000;

                        int yearCtdwnEnd = readBuffer(tmpBuffer, varPointer);

                        int displayedTime = (yearCtdwnEnd > 0)?(yearCtdwnEnd - ((int)(gameTime / 5) - yearCtdwnStart)):((int)(gameTime / 5) - yearCtdwnStart);
                        
                        StringCchPrintfA(&dest[destPos], 256 - destPos, "%d", displayedTime);

                        while (dest[destPos] && destPos < 256)
                            destPos++;

                        break;
                    }
                }

                currentType = NONE;
                break;
            default:
                if (startReading) {
                    if (bufferPos < 7) {
                        tmpBuffer[bufferPos++] = src[srcPos];
                    }
                }
                else {
                    dest[destPos++] = src[srcPos];
                }
                break;
        }
        srcPos++;
    }

    dest[destPos] = '\0';

}

extern "C" __declspec(dllexport)
__int32 __cdecl randomPicker(char* src) {
    __int32 values[64];
    int count = 0;
    char* token;
    const char delim[2] = " ";
    __int32(__cdecl* up_rand)(void) = reinterpret_cast<__int32(__cdecl*)(void)>(0x007B2820);
    
    token = strtok(src, delim);
    
    while (token && count < 64) {
        values[count++] = (__int32) atoi(token);
        token = strtok(NULL, delim);
    }
    
    if (count < 1)
        return 0;
    
    __int32 chosen_id = up_rand() % count;
    
    return values[chosen_id];
    
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved) {
    switch (fdwReason) {
        case DLL_PROCESS_ATTACH:
            Init(hinstDLL);
            break;
    }

  return TRUE;
}
