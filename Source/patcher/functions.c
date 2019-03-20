#include "functions.h"

char const defName[] = "age2_x1";
char const exeExtension[] = ".exe";
char const backupExtension[] = ".tbak";

char const trigDllPath[] = "age2_x1\\triggers.dll";

__int32 const patchOffsets[PATCH_AMOUNT] = { 0x002B06F3, 0x00228895, 0x002B082F, 0x00228880, 0x00280FFE };
__int32 const patchSizes[PATCH_AMOUNT] = { 0x35, 0x22, 0x05, 0x15, 0x01 };
char const patchData[PATCH_AMOUNT][54] = { { 0xE8, 0x78, 0x02, 0x00, 0x00, 0x90, 0x68, 0x80, 0x88, 0x62,
                                           0x00, 0xFF, 0x15, 0xE0, 0x51, 0x63, 0x00, 0x83, 0xF8, 0x00, 
                                           0x0F, 0x85, 0x27, 0x01, 0x00, 0x00, 0x6A, 0x10, 0x68, 0x95, 
                                           0x88, 0x62, 0x00, 0x68, 0x9B, 0x88, 0x62, 0x00, 0x6A, 0x00, 
                                           0xFF, 0x15, 0x34, 0x53, 0x63, 0x00, 0xFF, 0x15, 0x78, 0x52, 
                                           0x63, 0x00, 0x90 },
                                         { 0x45, 0x72, 0x72, 0x6F, 0x72, 0x00, 0x46, 0x61, 0x69, 0x6C, 
                                           0x65, 0x64, 0x20, 0x74, 0x6F, 0x20, 0x6C, 0x6F, 0x61, 0x64, 
                                           0x20, 0x74, 0x72, 0x69, 0x67, 0x67, 0x65, 0x72, 0x73, 0x2E, 
                                           0x64, 0x6C, 0x6C, 0x00 },
                                         { 0xE9, 0xBF, 0xFE, 0xFF, 0xFF },
                                         { 0x61, 0x67, 0x65, 0x32, 0x5F, 0x78, 0x31, 0x5C, 0x74, 0x72, 
                                           0x69, 0x67, 0x67, 0x65, 0x72, 0x73, 0x2E, 0x64, 0x6C, 0x6C, 
                                           0x00 },
                                         { 0x36 }
                                       };

bool patchExe(char *inputName, char *outputName) {
    FILE *input, *output, *backup;
    char *inputFileName, *backupFileName, *outputFileName, c;
    bool stop = false, backupExists = false;
    
    inputFileName = (char*) calloc(strlen(defName) + strlen(exeExtension) + strlen(inputName) + 2, sizeof(char));
    sprintf(inputFileName, "%s\\%s%s", defName, inputName, exeExtension);
    
    input = fopen(inputFileName, "r+b");
    
    if (input != NULL) {
        if (outputName != NULL && (strcmp(inputName, outputName) != 0)) {
            outputFileName = (char*) calloc(strlen(defName) + strlen(exeExtension) + strlen(outputName) + 2, sizeof(char));
            sprintf(outputFileName, "%s\\%s%s", defName, outputName, exeExtension);
            
            if (CopyFile(inputFileName, outputFileName, false)) {
                output = fopen(outputFileName, "r+b");
                
                if (output != NULL) {
                    fclose(input);
                    input = output;
                }
                else {
                    printf("An error ocurred while attemping to open the output file\n");
                
                    free(inputFileName);
                    free(outputFileName);
                
                    return false;
                }
            }
            else {
                printf("An error ocurred while creating the output file\n");
                
                free(inputFileName);
                free(outputFileName);
                
                return false;
            }
        }
        else {
            backupFileName = (char*) calloc(strlen(defName) + strlen(backupExtension) + strlen(inputName) + 2, sizeof(char));
            sprintf(backupFileName, "%s\\%s%s", defName, inputName, backupExtension);
            
            backup = fopen(backupFileName, "r");
            
            if (backup != NULL) {
                fclose(backup);
                backupExists = true;
            }
            else if (!CopyFile(inputFileName, backupFileName, false)) {
                printf("An error ocurred while attempting to create the backup file\n");
                printf("Do you want to proceed with the patching, anyway? (Y/N): ");
                
                do {
                    c = fgetc(stdin);
                    switch (c) {
                        case 'N':
                        case 'n':
                            free(inputFileName);
                            free(backupFileName);
                            return false;
                            break;
                    }
                } while (c != 'N' && c != 'n' && c != 'Y' && c != 'y');
            }
            else {
                backupExists = true;
            }
        }
            
        for (int i = 0; i < PATCH_AMOUNT && !stop; i++)
            if (!applyPatch(input, patchOffsets[i], patchSizes[i], patchData[i]))
                stop = true;
                
        if (!stop) {
            fclose(input);
            printf("The patch has been sucessfully applied into the selected .exe!\n");
            
            FILE *trigDll = fopen(trigDllPath, "w+b");
            
            if (!trigDll) {
                printf("\nNote: triggers.dll could not be extracted\n");
                printf("You might need to download and place it in the age2_x1 folder manually\n");
            }
            else {
                saveResourceToFile(trigDll, 201);
                fclose(trigDll);
            }
            
        }
        else {
            printf("An error ocurred while attempting to patch the selected .exe.\n");
            if (outputName == NULL) {
                if (backupExists) {
                    if(CopyFile(backupFileName, inputFileName, false)) {
                        printf("The backup has been restored sucessfully\n");
                        remove(backupFileName);
                    }
                    else {
                        printf("Failed to restore backup\n"); 
                    }
                }
                else {
                    printf("Previous file could not be restored, since a backup has not been made\n");
                }
                
                free(inputFileName);
                free(backupFileName);
                    
                return false;
            }
            else {
                remove(outputFileName);
                
                free(inputFileName);
                free(outputFileName);
                    
                return false;
            }
        }
        
        free(inputFileName);
        
        if (outputName != NULL)
            free(outputFileName);
        else if (backupFileName != NULL)
            free(backupFileName);
        
        return true;
    }
    else {
        printf("An error ocurred while trying to open the input .exe file\n");
        return false;
    }
}

void restoreBackup(char *inputName) {
    FILE *input;
    char *inputFileName;
    
    inputFileName = (char*) calloc(strlen(defName) + strlen(inputName) + strlen(backupExtension) + 2, sizeof(char));
    sprintf(inputFileName, "%s\\%s%s", defName, inputName, backupExtension);
    
    input = fopen(inputFileName, "r");
    
    if (input) {
        char *outputFileName = (char*) calloc(strlen(defName) + strlen(inputName) + strlen(exeExtension) + 2, sizeof(char));
        sprintf(outputFileName, "%s\\%s%s", defName, inputName, exeExtension);
        
        if (CopyFile(inputFileName, outputFileName, false)) {
            printf("The backup has been successfully restored!\n");
            fclose(input);
            remove(inputFileName);
            free(outputFileName);
            free(inputFileName);
            return;
        }
        else
            free(outputFileName);
    }
    
    printf("Failed to restore the given backup file\n");
    fclose(input);
    free(inputFileName);
}

void patchExeSilent(char *inputName, char *outputName) {
    FILE *input, *output, *backup;
    char *inputFileName, *backupFileName, *outputFileName, c;
    bool stop = false, backupExists = false;
    
    inputFileName = (char*) calloc(strlen(defName) + strlen(exeExtension) + strlen(inputName) + 2, sizeof(char));
    sprintf(inputFileName, "%s\\%s%s", defName, inputName, exeExtension);
    
    input = fopen(inputFileName, "r+b");
    
    if (input != NULL) {
        if (outputName != NULL && (strcmp(inputName, outputName) != 0)) {
            outputFileName = (char*) calloc(strlen(defName) + strlen(exeExtension) + strlen(outputName) + 2, sizeof(char));
            sprintf(outputFileName, "%s\\%s%s", defName, outputName, exeExtension);
            
            if (CopyFile(inputFileName, outputFileName, false)) {
                output = fopen(outputFileName, "r+b");
                
                if (output != NULL) {
                    fclose(input);
                    input = output;
                }
                else {
                    free(inputFileName);
                    free(outputFileName);
                
                    return;
                }
            }
            else {            
                free(inputFileName);
                free(outputFileName);
                
                return;
            }
        }
        else {
            backupFileName = (char*) calloc(strlen(defName) + strlen(backupExtension) + strlen(inputName) + 2, sizeof(char));
            sprintf(backupFileName, "%s\\%s%s", defName, inputName, backupExtension);
            
            backup = fopen(backupFileName, "r");
            
            if (backup != NULL) {
                fclose(backup);
                backupExists = true;
            }
            else if (CopyFile(inputFileName, backupFileName, false)) {
                backupExists = true;
            }
        }
            
        for (int i = 0; i < PATCH_AMOUNT && !stop; i++)
            if (!applyPatch(input, patchOffsets[i], patchSizes[i], patchData[i]))
                stop = true;
                
        if (stop) {
            if (outputName == NULL) {
                if (backupExists) {
                    if(CopyFile(backupFileName, inputFileName, false)) {
                        remove(backupFileName);
                    }
                }
                
                free(inputFileName);
                free(backupFileName);
                    
                return;
            }
            else {
                remove(outputFileName);
                
                free(inputFileName);
                free(outputFileName);
                    
                return;
            }
        }
        else {
            fclose(input);
            FILE *trigDll = fopen(trigDllPath, "w+b");
            
            if (trigDll) {
                saveResourceToFile(trigDll, 201);
                fclose(trigDll);
            }
        }
        
        free(inputFileName);
        
        if (outputName != NULL)
            free(outputFileName);
        else if (backupFileName != NULL)
            free(backupFileName);
    }
}

void restoreBackupSilent(char *inputName) {
    FILE *input;
    char *inputFileName;
    
    inputFileName = (char*) calloc(strlen(defName) + strlen(inputName) + strlen(backupExtension) + 2, sizeof(char));
    sprintf(inputFileName, "%s\\%s%s", defName, inputName, backupExtension);
    
    input = fopen(inputFileName, "r");
    
    if (input) {
        char *outputFileName = (char*) calloc(strlen(defName) + strlen(inputName) + strlen(exeExtension) + 2, sizeof(char));
        sprintf(outputFileName, "%s\\%s%s", defName, inputName, exeExtension);
        
        if (CopyFile(inputFileName, outputFileName, false)) {
            fclose(input);
            remove(inputFileName);
            free(outputFileName);
            free(inputFileName);
            return;
        }
        else
            free(outputFileName);
    }
    
    fclose(input);
    free(inputFileName);
}

bool applyPatch(FILE *ptr, __int32 offset, __int32 size, const char *patch) {
    if (!fseek(ptr, offset, SEEK_SET))
        if (fwrite(patch, size, 1, ptr) == 1)
            return true;
    
    return false;
}

bool getStrFromInput(char *str, int length) {
    int i = 0, c;
    
    do {
        c = fgetc(stdin);
        
        if (c != EOF && (char) c != '\n' && i < length)
            str[i++] = (char) c;
    } while (c != EOF && (char) c != '\n' && i < length);
    
    str[i] = '\0';
    
    if (!i)
        return false;
    else if (i == length)
        discardExtraInputChars();
    
    return true;
}

void printHeader() {
    printf("----------------------------------\n");
    printf("    Extended Triggers Patch\n");
    printf("    Version 1.6\n");
    printf("----------------------------------\n\n");
}

void discardExtraInputChars() {
    int c = fgetc(stdin);
    
    while (c != EOF && (char) c != '\n')
        c = fgetc(stdin);
}

void saveResourceToFile(FILE *ptr, int resID) {
    void *resHandle = FindResource(NULL, MAKEINTRESOURCE(resID), "BIN");
    void *resData = LoadResource(NULL, resHandle);
    __int32 resSize = SizeofResource(NULL, resHandle);
    fwrite(resData, resSize, 1, ptr);
}

void forceWorkingPath() {
   char pathBuffer[MAX_PATH+1];
   
   if (GetModuleFileName(NULL, pathBuffer, MAX_PATH+1)) {
       char* ptr = strrchr(pathBuffer, '\\');
       
       if (ptr) {
           *ptr = '\0';
           SetCurrentDirectory(pathBuffer);
       }
       
   }
       
}