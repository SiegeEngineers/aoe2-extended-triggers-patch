#include "functions.h"

int main(int argc, char** argv) {
    bool silentInstall = false, separateOutputExe = false, backup = false, outputExe = false;
    int strLenght, outputCmdID;
    
    forceWorkingPath();
    
    if (argc >= 2) {
        for (int i = 1; i < argc; i++) {
            if (i != 1) {
                strLenght = strlen(argv[i]);
                
                if (strLenght >= 2 && argv[i][0] == '-') {
                    switch (argv[i][1]) {
                        case 'b':
                            backup = true;
                            break;
                        case 'i':
                            silentInstall = true;
                            break;
                        case 'o':
                            if (strLenght > 3) {
                                outputExe = true;
                                outputCmdID = i;
                            }
                    }
                }
            }
        }
        
        if (silentInstall) {
            if (backup)
                restoreBackupSilent(argv[1]);
            else if (outputExe) {
                patchExeSilent(argv[1], &(argv[outputCmdID][3]));
            }
            else
                patchExeSilent(argv[1], NULL);
        }
        else {
            printHeader();
            
            if (backup)
                restoreBackup(argv[1]);
            else if (outputExe)
                patchExe(argv[1], &(argv[outputCmdID][3]));
            else
                patchExe(argv[1], NULL);
            
            printf("Press any key to exit...\n");
            fgetc(stdin);
        }
    }
    else {
        int opt = 0;
        char inputFilename[21], outputFilename[21];
        printHeader();
        
        do {
            printf("1 - Apply Patch\n");
            printf("2 - Restore Backup\n");
            printf("3 - About\n");
            printf("4 - Quit\n\n");
            
            opt = fgetc(stdin);
            discardExtraInputChars();
            
            switch (opt) {
                case '1':
                    printf("\nType the name of the .exe file you want to patch (without extension)\n");
                    printf("The patcher will look for this file in the age2_x1\\ folder\n");
                    getStrFromInput(inputFilename, 20);
                    
                    printf("\nType the name of the  output .exe file you want to patch\n");
                    printf("Press 'Enter' to save all of the changes in the input .exe\n");
                    
                    if (getStrFromInput(outputFilename, 20))
                        patchExe(inputFilename, outputFilename);
                    else
                        patchExe(inputFilename, NULL);
                    break;
                case '2':
                    printf("\nType the name of the .exe file you want to restore (without extension)\n");
                    printf("The patcher will look for this backup file in the age2_x1\\ folder\n");
                    getStrFromInput(inputFilename, 20);
                    
                    restoreBackup(inputFilename);
                    break;
                case '4':
                case EOF:
                case '\n':
                    break;
                case '3':
                    printf("\nExtended Triggers Patch\n");
                    printf("Version 1.7 (2019.03.29)\n\n");
                    break;
                default:
                    printf("\nInvalid option\n");
            }
            
            printf("\n----------------------------------\n\n");
                    
        } while ((char) opt != '4' && opt != EOF);
    }
    
    return 0;
}