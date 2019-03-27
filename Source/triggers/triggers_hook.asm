format ELF

extrn '__imp__WriteProcessMemory@20' as WriteProcessMemory:dword
extrn '__imp__GetCurrentProcess@0' as GetCurrentProcess:dword
extrn '_stringParser' as stringParser:dword
extrn '_randomPicker' as randomPicker:dword

;==================================================
; Includes
;==================================================

include 'win32a.inc'

;# made by Tomasz Grysztar
struc db [data]
{
    common . db data 
    sizeof.#. = $ - .
}

;==================================================
section '.text' executable
;==================================================

public __Z4InitP11HINSTANCE__@4

proc __Z4InitP11HINSTANCE__@4 hinstDLL
    push esi edi
    call [GetCurrentProcess]
    mov esi,eax
    mov edi,1
    
    mov eax,dword[hinstDLL]
    mov dword[_langHandle],eax
    
    stdcall PatchAddress,esi,sub_stringParser,stringParser,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_stringParser_1,stringParser,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_stringParser_2,stringParser,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_stringParser_3,stringParser,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_randomPicker,randomPicker,1
    and edi,eax
    
    ;------------------------------- TRIGGERS -------------------------------

    ;--- CONDITION/EFFECT STRINGS FIX ---
    stdcall PatchData,esi,0x004E1F07,TrigStrings0,sizeof.TrigStrings0
    and edi,eax
    
    stdcall PatchData,esi,0x004E1F0A,TrigStrings0a,sizeof.TrigStrings0a
    and edi,eax
    ;--- END CONDITION/EFFECT STRINGS FIX ---
    
    ;--- PATCH TO ENABLE BETA FIELDS IN EDITOR --- 
    stdcall PatchData,esi,0x005EB276,TrigBetaFields0,sizeof.TrigBetaFields0
    and edi,eax
    
    stdcall PatchData,esi,0x004ED089,TrigBetaFields0a,sizeof.TrigBetaFields0a
    and edi,eax
    
    stdcall PatchData,esi,0x004ED09F,TrigBetaFields0b,sizeof.TrigBetaFields0b
    and edi,eax
    
    stdcall PatchData,esi,0x004EA602,TrigBetaFields0c,sizeof.TrigBetaFields0c
    and edi,eax
    
    stdcall PatchData,esi,0x004EB05D,TrigBetaFields0d,sizeof.TrigBetaFields0d
    and edi,eax
    
    stdcall PatchData,esi,0x004ED099,TrigBetaFields0e,sizeof.TrigBetaFields0e
    and edi,eax
    
    stdcall PatchData,esi,0x004E331F,TrigBetaFields0f,sizeof.TrigBetaFields0f
    and edi,eax
    
    stdcall PatchData,esi,0x004E3388,TrigBetaFields0g,sizeof.TrigBetaFields0g
    and edi,eax
    ;--- END PATCH TO ENABLE BETA FIELDS IN EDITOR --- 
    
    ;--- NEW CONDITIONS/EFFECTS ---
    stdcall PatchAddress,esi,0x007DD2E5,EffectAlloc,1
    and edi,eax
    
    stdcall PatchData,esi,0x007DD20C,NewTriggers0a,sizeof.NewTriggers0a ;Total memory to be allocated to effect panels (including 'None')
    and edi,eax
    
    stdcall PatchData,esi,0x004375F7,NewTriggers0b,sizeof.NewTriggers0b ;Maximum effect ID
    and edi,eax
    
    stdcall PatchData,esi,0x004E1F07,NewTriggers0d,sizeof.NewTriggers0d ;Effect string amount
    and edi,eax
    
    stdcall PatchData,esi,0x007DD275,NewTriggers0e,sizeof.NewTriggers0e ;Total memory to be allocated to effect panels (including 'None')
    and edi,eax
    
    stdcall PatchData,esi,0x004EADF9,NewTriggers0f,sizeof.NewTriggers0f ;Max chars in the 'Number' box
    and edi,eax
    
    stdcall PatchData,esi,0x004E1EF9,NewTriggers0g,sizeof.NewTriggers0g ;Effect string start?
    and edi,eax
    
    stdcall PatchAddress,esi,0x00437601,EffectJmpTable,0
    and edi,eax
    
    stdcall PatchAddress,esi,loc_007D8DC0,0x007D8DC0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00529950,0x00529950,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400_1,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400_2,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400_3,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400_4,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400_5,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004D1EB0,0x004D1EB0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400_6,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004C6400_7,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004399F5,0x004399F5,1
    and edi,eax
    stdcall PatchAddress,esi,sub_007B2820_1,0x007B2820,1
    and edi,eax
    stdcall PatchAddress,esi,loc_437029,0x00437029,1
    and edi,eax
    stdcall PatchAddress,esi,loc_437029_1,0x00437029,1
    and edi,eax
    stdcall PatchAddress,esi,loc_00436C9F_1,0x00436C9F,1
    and edi,eax
    stdcall PatchAddress,esi,loc_00436C9F_2,0x00436C9F,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139A1,0x006139A1,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00613896,0x00613896,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00614BAD,0x00614BAD,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00614BAD_1,0x00614BAD,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00614BAD_2,0x00614BAD,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_5,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_7,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006138F0,0x006138F0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006138F0_1,0x006138F0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005EAE80,0x005EAE80,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005EAE80_1,0x005EAE80,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_1,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139A1,0x006139A1,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139A1_1,0x006139A1,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006148E1,0x006148E1,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006148E1_1,0x006148E1,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006148E1_2,0x006148E1,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00613896_1,0x00613896,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00613896_2,0x00613896,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00613896_3,0x00613896,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_2,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E2780,0x005E2780,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_3,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E2780_1,0x005E2780,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_4,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E2780_2,0x005E2780,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E2780_3,0x005E2780,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_6,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005EAE90_2,0x005EAE90,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004459E0,0x004459E0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00445A00,0x00445A00,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00445A60,0x00445A60,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005EAE90,0x005EAE90,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004454C0,0x004454C0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00445840,0x00445840,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00445840_1,0x00445840,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00445840_2,0x00445840,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00445850,0x00445850,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00445850_1,0x00445850,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005EB420,0x005EB420,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004459F0,0x004459F0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005C9A30,0x005C9A30,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005C9AE0,0x005C9AE0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005C9C70,0x005C9C70,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0040231B,0x0040231B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139E4_A1,0x006139E4,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139E4_A2,0x006139E4,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139E4_A3,0x006139E4,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139E4_A4,0x006139E4,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_007C85A0,0x007C85A0,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_005E7560_3,0x005E7560,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E2780_4,0x005E2780,1
    and edi,eax
    stdcall PatchAddress,esi,loc_0043768D,0x0043768D,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_004C6400,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004C6400_1,0x004C6400,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0061567C,0x0061567C,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00568590,0x00568590,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_007B2820_2,0x007B2820,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_006139E4_3,0x006139E4,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004399F0,CondAlloc,5
    and edi,eax
    
    stdcall PatchData,esi,0x007DD205,NewTriggers1a,sizeof.NewTriggers1a
    and edi,eax
    
    stdcall PatchData,esi,0x00436B37,NewTriggers1b,sizeof.NewTriggers1b
    and edi,eax
    
    stdcall PatchAddress,esi,0x00436B41,CondJmpTable,0
    and edi,eax
    
    stdcall PatchData,esi,0x004E1F47,NewTriggers1d,sizeof.NewTriggers1d
    and edi,eax
    
    stdcall PatchData,esi,0x007DD248,NewTriggers1e,sizeof.NewTriggers1e
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x00436B11,SaveScenSec,5
    and edi,eax
    
    stdcall PatchData,esi,0x004E1F39,NewTriggers1k,sizeof.NewTriggers1k
    and edi,eax
    
    stdcall PatchData,esi,0x004E1F4A,NewTriggers1f,sizeof.NewTriggers1f
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E3FEA,TriggerCondLoadFix,5
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E257C,TriggerCondSaveFix,5
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004E3FEF,0x004E3FEF,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_00550920,0x00550920,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_005509E0,0x005509E0,1
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004E41EF,0x004E41EF,1
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004E2581,0x004E2581,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_004E1B80,0x004E1B80,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_00550740,0x00550740,1
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004E29E2,0x004E29E2,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005509E0_4,0x005509E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E41EF_2,0x004E41EF,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550920_4,0x00550920,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E29E2_2,0x004E29E2,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E25B9,0x004E25B9,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_00550920_5,0x00550920,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005509E0_5,0x005509E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004380B0_3,0x004380B0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E47E4_5,0x004E47E4,1
    and edi,eax
    
    ;--- END NEW CONDITIONS/EFFECTS ---
    
    ;--- VARIABLE SAVING/RESETTING ---
    stdcall PatchCodeCave,esi,0x004A5CCB,ResetVars1,5
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004A5CD0,0x004A5CD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004A5F3A,0x004A5F3A,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_006139E4_1,0x006139E4,1
    and edi,eax
    stdcall PatchAddress,esi,sub_006139E4_2,0x006139E4,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0043A000,0x0043A000,1
    and edi,eax
    stdcall PatchAddress,esi,loc_00436B16,0x00436B16,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004A6016,SaveVars,6
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004A5DE4,LoadVars,5
    and edi,eax
    
    stdcall PatchAddress,esi,sub_00542AA0,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004A601C,0x004A601C,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_00542850,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_1,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004A5DE9,0x004A5DEC,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00616D80,0x00616D80,1
    and edi,eax
    
    ;--- END VARIABLE SAVING/RESETTING ---
    
    ;--- SAVEGAME FILE EXTENSION PATCH ---
    stdcall PatchData,esi,0x0066B174,SaveGameExtPatch0,sizeof.SaveGameExtPatch0
    and edi,eax
    stdcall PatchData,esi,0x0066FA3E,SaveGameExtPatch0,sizeof.SaveGameExtPatch0
    and edi,eax
    stdcall PatchData,esi,0x0066FDD0,SaveGameExtPatch0,sizeof.SaveGameExtPatch0
    and edi,eax
    stdcall PatchData,esi,0x00678C2F,SaveGameExtPatch0,sizeof.SaveGameExtPatch0
    and edi,eax
    stdcall PatchData,esi,0x00678C40,SaveGameExtPatch0,sizeof.SaveGameExtPatch0
    and edi,eax
    
    stdcall PatchData,esi,0x00678e85,SaveGameExtPatch1,sizeof.SaveGameExtPatch1
    and edi,eax
    stdcall PatchData,esi,0x00678e9a,SaveGameExtPatch1,sizeof.SaveGameExtPatch1
    and edi,eax
    stdcall PatchData,esi,0x00678ea4,SaveGameExtPatch1,sizeof.SaveGameExtPatch1
    and edi,eax
    stdcall PatchData,esi,0x0067d3a2,SaveGameExtPatch1,sizeof.SaveGameExtPatch1
    and edi,eax
    stdcall PatchData,esi,0x0067d3b4,SaveGameExtPatch1,sizeof.SaveGameExtPatch1
    and edi,eax
    stdcall PatchData,esi,0x0067e23c,SaveGameExtPatch1,sizeof.SaveGameExtPatch1
    and edi,eax
    ;--- END SAVEGAME FILE EXTENSION PATCH ---
    
    ;--- CUSTOM CONTROLS ---
    
    stdcall PatchCodeCave,esi,0x004EB250,AllocateNewControls,5
    and edi,eax
    
    stdcall PatchAddress,esi,sub_004EDDD0,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDED0,0x004EDED0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_1,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A1,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB255,0x004EB255,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDED0_1,0x004EDED0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_2,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A2,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_1,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_3,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_2,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_4,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDED0_2,0x004EDED0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_5,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A3,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_3,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_6,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDED0_3,0x004EDED0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_7,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A4,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_4,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_5,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_6,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_7,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_8,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_8,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDE70,0x004EDE70,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A5,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_9,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDE70_1,0x004EDE70,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A6,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDED0_5,0x004EDED0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_0C,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A8,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_0A,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_0D,0x004EB3A6,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_004EDED0_4,0x004EDED0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_0A,0x004EB3A6,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00562D10_A7,0x00562D10,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004EDDD0_9,0x004EDDD0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EB3A6_0B,0x004EB3A6,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004ECF1C,InitializeNewControls,6
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004ECF22,0x004ECF22,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E21BB,HideNewControls,6
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004E21C1,0x004E21C1,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004EF752,DeallocateNewControls,6
    and edi,eax
    
    stdcall PatchAddress,esi,sub_005E7310_A1,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A2,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EF758,0x004EF758,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A3,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A4,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A5,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A6,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A7,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A8,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A9,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A10,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A11,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A12,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A13,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A14,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A15,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A16,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A17,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A18,0x005E7310,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005E7310_A19,0x005E7310,1
    and edi,eax
    
    stdcall PatchAddress,esi,0x004E3720,SaveTimer,0
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DCC0,0x0054DCC0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00620886,0x00620886,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DCC0_1,0x0054DCC0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89,0x004E2F89,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00620886_1,0x00620886,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DCC0_2,0x0054DCC0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89_1,0x004E2F89,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005507E0,0x005507E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89_2,0x004E2F89,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_0054DCC0_3,0x0054DCC0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DCC0_4,0x0054DCC0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89_5,0x004E2F89,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00620886_3,0x00620886,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_005507E0_3,0x005507E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89_9,0x004E2F89,1
    and edi,eax
    
    stdcall PatchAddress,esi,0x004E4838,LoadTimer,0
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DE40,0x0054DE40,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00614F6B,0x00614F6B,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004380B0,0x004380B0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550920_1,0x00550920,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E47E4,0x004E47E4,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E47E4_3,0x004E47E4,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005509E0_1,0x005509E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004380B0_1,0x004380B0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E47E4_1,0x004E47E4,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DE40_3,0x0054DE40,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DE40_2,0x0054DE40,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00614F6B_1,0x00614F6B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004380B0,0x004380B0,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_00550920_6,0x00550920,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005509E0_6,0x005509E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004380B0_4,0x004380B0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E47E4_6,0x004E47E4,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004EE0D2,DropDownBoxWidth,6
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004EE0E3,0x004EE0E3,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EE0D8,0x004EE0D8,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EE0EA,0x004EE0EA,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EE0E3_1,0x004EE0E3,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EE0EA_1,0x004EE0EA,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EE0E3_2,0x004EE0E3,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EE0E3_3,0x004EE0E3,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004EEB2B,DropDownBoxInit,6
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_1,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_2,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EEB80,0x004EEB80,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EEB31,0x004EEB31,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_3,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_4,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_5,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_6,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_7,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_8,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_9,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_A,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EEB80_1,0x004EEB80,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EEB80_2,0x004EEB80,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_B,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_C,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_D,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_E,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_F,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_10,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_11,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_12,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_13,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_14,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_15,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_16,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_17,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_18,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_19,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_1A,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_1B,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_1C,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EEB80_3,0x004EEB80,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_1D,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_1E,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_1F,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EEB80_4,0x004EEB80,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_20,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_21,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550870_22,0x00550870,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004EEB80_5,0x004EEB80,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E2C91,SaveNumber,6
    and edi,eax
    stdcall PatchAddress,esi,sub_005507E0_1,0x005507E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89_3,0x004E2F89,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2C97,0x004E2C97,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_005507E0_2,0x005507E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89_8,0x004E2F89,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E43AF,LoadNumber,6
    and edi,eax
    stdcall PatchAddress,esi,sub_00550920_2,0x00550920,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005509E0_2,0x005509E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004380B0_2,0x004380B0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E47E4_2,0x004E47E4,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E43B5,0x004E43B5,1
    and edi,eax
    
    stdcall PatchAddress,esi,loc_004E29E2_1,0x004E29E2,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E27E2,0x004E27E2,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00550920_3,0x00550920,1
    and edi,eax
    stdcall PatchAddress,esi,sub_005509E0_3,0x005509E0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E41EF_1,0x004E41EF,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E4101,0x004E4101,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E27E2_1,0x004E27E2,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E27DC,SaveCondTimer,6
    and edi,eax
    stdcall PatchCodeCave,esi,0x004E40FB,LoadCondTimer,6
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E2B6E,SaveQuantity,6
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2B74,0x004E2B74,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2B74_1,0x004E2B74,1
    and edi,eax
    
    stdcall PatchAddress,esi,sub_0054DCC0_5,0x0054DCC0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DCC0_6,0x0054DCC0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E2F89_7,0x004E2F89,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00620886_4,0x00620886,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x004E42E0,LoadQuantity,6
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DE40_5,0x0054DE40,1
    and edi,eax
    stdcall PatchAddress,esi,sub_0054DE40_4,0x0054DE40,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00614F6B_2,0x00614F6B,1
    and edi,eax
    stdcall PatchAddress,esi,sub_004380B0_1,0x004380B0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E47E4_4,0x004E47E4,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E42E6,0x004E42E6,1
    and edi,eax
    
    ;--- END CUSTOM CONTROLS ---
    
    ;--- FIX UP 1.5 EFFECT NAMES ---
    
    stdcall PatchCodeCave,esi,0x007D892D,FixEffectName,5
    and edi,eax
    stdcall PatchAddress,esi,sub_0061442B_8,0x0061442B,1
    and edi,eax
    stdcall PatchAddress,esi,loc_004E3A90,0x004E3A90,1
    and edi,eax
    
    ;--- END FIX UP 1.5 EFFECT NAMES ---
    

    ;----------------------------- END TRIGGERS -----------------------------
    
    
    ;--- STRING LOADING ---
    
    stdcall PatchCodeCave,esi,0x0043CF4C,load_str,5
    and edi,eax
    
    stdcall PatchAddress,esi,loc_005E4750,0x005E4750,1
    and edi,eax
    
    stdcall PatchAddress,esi,loc_0058E820,0x0058E820,1
    and edi,eax
    
    stdcall PatchAddress,esi,loc_0043CF51,0x0043CF51,1
    and edi,eax
    
    ;--- END STRING LOADING ---
    
    ;--- SAVING EXTRA ATTRIBUTES TO SAVEGAMES ---
    
    stdcall PatchCodeCave,esi,0x007DA9AA,SaveType10Attr,5
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_1,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_2,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_3,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_4,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_007DA9AF,0x007DA9AF,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x007DA9FC,LoadType10Attr,5
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_2,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_3,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_4,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,loc_007DAA01,0x007DAA01,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x007DA8AE,SaveType70Attr,5
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_5,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_6,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_7,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_8,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_007DA8B3,0x007DA8B3,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x007DA92E,LoadType70Attr,5
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_5,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_6,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_7,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,loc_007DA933,0x007DA933,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x007DA80C,SaveType80Attr,5
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_9,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,sub_00542AA0_A,0x00542AA0,1
    and edi,eax
    stdcall PatchAddress,esi,loc_007DA811,0x007DA811,1
    and edi,eax
    
    stdcall PatchCodeCave,esi,0x007DA863,LoadType80Attr,5
    and edi,eax
    stdcall PatchAddress,esi,sub_00542850_8,0x00542850,1
    and edi,eax
    stdcall PatchAddress,esi,loc_007DA868,0x007DA868,1
    and edi,eax
    
    ;--- END SAVING EXTRA ATTRIBUTES TO SAVEGAMES ---
    
    ;--- ALLOWING TECHS TO CHANGE EXTRA ATTRIBUTES ---

    stdcall PatchAddress,esi,0x007DAA66,EyeCandyAttrJmp,0
    and edi,eax
    
    stdcall PatchData,esi,0x007DAA51,TechAttr0,sizeof.TechAttr0
    and edi,eax
    
    ;--- END ALLOWING TECHS TO CHANGE EXTRA ATTRIBUTES ---
    
    mov    eax,edi
    pop    edi esi
    
    .end:
    ret
endp

EffectAlloc:
    
    .ChangeRoF:
    mov edx,[esi+0Ch]
    mov edx,[edx+88h]
    mov [edx+01h],al
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    
    .DisableButtons:
    mov edx,[esi+0Ch]
    mov edx,[edx+8Ch]
    
    .ArmorClass:
    mov edx,[esi+0Ch]
    mov edx,[edx+90h]
    mov [edx+01h],al
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    mov [edx+16h],cl
    
    .AttackClass:
    mov edx,[esi+0Ch]
    mov edx,[edx+94h]
    mov [edx+01h],al
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    mov [edx+16h],cl
    
    .DefaultArmor:
    mov edx,[esi+0Ch]
    mov edx,[edx+98h]
    mov [edx+01h],al
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    
    .ChangeResource:
    mov edx,[esi+0Ch]
    mov edx,[edx+9Ch]
    mov [edx+01h],cl
    mov [edx+07h],cl
    mov [edx+16h],cl
    mov [edx+0Ch],al
    
    .ResourceStorage:
    mov edx,[esi+0Ch]
    mov edx,[edx+0A0h]
    mov [edx+01h],al
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    mov [edx+16h],cl
    mov [edx+0Ch],al
    
    .ChangeLoS:
    mov edx,[esi+0Ch]
    mov edx,[edx+0A4h]
    mov [edx+01h],al
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    
    .ChangeWRate:
    mov edx,[esi+0Ch]
    mov edx,[edx+0A8h]
    mov [edx+01h],al
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    
    .ChangeHero:
    mov edx,[esi+0Ch]
    mov edx,[edx+0ACh]
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    mov [edx+16h],al
    
    .ChangeIconID:
    mov edx,[esi+0Ch]
    mov edx,[edx+0B0h]
    mov [edx+04h],al
    mov [edx+06h],ax
    mov [edx+10h],eax
    mov [edx+14h],ax
    mov [edx+16h],al
    
    .AISignalGoalOff:
    mov edx,[esi+0Ch]
    mov edx,[edx+0B4h]
    mov [edx],cl
    mov [edx+07h],cl
    
    .ChangeVariable:
    mov edx,[esi+0Ch]
    mov edx,[edx+0B8h]
    mov [edx+01h],cl
    mov [edx+0Ch],cl
    mov [edx+16h],cl
    
    .ResetAllVariables:
    mov edx,[esi+0Ch]
    mov edx,[edx+0BCh]
    mov [edx+16h],cl
    
    .ChangeResourceByVariable:
    mov edx,[esi+0Ch]
    mov edx,[edx+0C0h]
    mov [edx+01h],cl
    mov [edx+02h],cl
    mov [edx+07h],cl
    mov [edx+16h],cl
    
    .SaveVariablesToFile:
    mov edx,[esi+0Ch]
    mov edx,[edx+0C4h]
    mov [edx+0Ah],cl
    
    .ReadVariablesFromFile:
    mov edx,[esi+0Ch]
    mov edx,[edx+0C8h]
    mov [edx+0Ah],cl
    
    .Guard:
    mov edx,[esi+0Ch]
    mov edx,[edx+0CCh]
    mov [edx+04],al
    mov [edx+05],cl
    mov [edx+06],al
    mov [edx+07],al
    mov [edx+0Eh],al
    mov [edx+0Fh],al
    mov [edx+10h],eax
    mov [edx+14h],ax
    
    .Follow:
    mov edx,[esi+0Ch]
    mov edx,[edx+0D0h]
    mov [edx+04],al
    mov [edx+05],cl
    mov [edx+06],al
    mov [edx+07],al
    mov [edx+0Eh],al
    mov [edx+0Fh],al
    mov [edx+10h],eax
    mov [edx+14h],ax
    
    .Scout:
    mov edx,[esi+0Ch]
    mov edx,[edx+0D4h]
    mov [edx+04],al
    mov [edx+06],al
    mov [edx+07],al
    mov [edx+0Eh],cl
    mov [edx+0Fh],cl
    mov [edx+10h],eax
    mov [edx+14h],ax
    
    .DisplayParsedInstructions:
    mov edx,[esi+0Ch]
    mov edx,[edx+0D8h]
    mov [edx+0Ah],al
    mov [edx+0Bh],al
    mov [edx+0Ch],al
    mov [edx+16h],al
    
    .SendParsedChat:
    mov edx,[esi+0Ch]
    mov edx,[edx+0DCh]
    mov [edx+07h],cl
    mov [edx+0Ah],al
    mov [edx+0Bh],al
    
    .ChangeAndParseName:
    mov edx,[esi+0Ch]
    mov edx,[edx+0E0h]
    mov [edx+04h],al
    mov [edx+0Ah],cl
    mov [edx+16h],al
    mov [edx+06h],al
    mov [edx+07h],al
    mov [edx+10h],al
    mov [edx+11h],al
    mov [edx+12h],al
    mov [edx+13h],al
    mov [edx+10h],al
    
    .RandomizeVariable:
    mov edx,[esi+0Ch]
    mov edx,[edx+0E4h]
    mov [edx+01h],cl
    mov [edx+0Ch],cl
    mov [edx+16h],cl
    
    .PickRandomValue:
    mov edx,[esi+0Ch]
    mov edx,[edx+0E8h]
    mov [edx+0Ah],cl
    mov [edx+16h],cl
    
    .SaveValueToVariable:
    mov edx,[esi+0Ch]
    mov edx,[edx+0ECh]
    mov [edx+0Eh],al
    mov [edx+0Fh],al
    mov [edx+16h],cl
    mov [edx+01h],cl
    
    .back:
    jmp near $
    loc_007D8DC0 = $-4

EffectJmpTable:

    dd 0x00437605
    dd 0x007D8B50
    dd 0x0043764F
    dd 0x0043771C
    dd 0x004377C0
    dd 0x004377F0 
    dd 0x0043782B
    dd 0x00437867
    dd 0x0043786F
    dd 0x00437895
    dd 0x007D8BB0
    dd 0x0043795D
    dd 0x007D8CE0
    dd 0x004379CF
    dd 0x00437A06
    dd 0x007D8B10
    dd 0x00437A63
    dd 0x007D8C50
    dd 0x007E2170
    dd 0x00437BFB
    dd 0x00437C51
    dd 0x007D8BF0
    dd 0x00437CF1
    dd 0x00437D28
    dd 0x00437D93
    dd 0x00437E3B
    dd 0x007D89B0
    dd 0x007D8A80
    dd 0x007D8D10
    dd 0x007DD430
    dd 0x007DD4C0
    dd 0x007DD570
    dd 0x007DD610
    dd ChangeRoF
    dd DisableButtons
    dd ArmorClass
    dd AttackClass
    dd DefaultArmor
    dd ChangeResource
    dd ResourceStorage
    dd ChangeLoS
    dd ChangeWRate
    dd ChangeHero
    dd ChangeIconID
    dd AISignalGoalOff
    dd ChangeVariable
    dd ResetAllVariables
    dd ChangeResourceByVariable
    dd SaveVariablesToFile
    dd ReadVariablesFromFile
    dd Guard
    dd Follow
    dd Scout
    dd DisplayParsedInstructions
    dd SendParsedChat
    dd ChangeAndParseName
    dd RandomizeVariable
    dd PickRandomValue
    dd SaveValueToVariable

ChangeRoF:

    mov eax,[esp+10h]
    xor ebp,ebp
    cmp eax,ebx
    jle .back    
    lea ebx,[esp+94h]
    fild word[edi+10h]
    fdiv dword[006355D8h]
    
    .loop:
    mov esi,[ebx]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .loop_next
    mov ecx, esi
    call near $
    loc_004C6400 = $-4
    mov ecx,[esi+8]
    fld dword[ecx+144h]
    fadd st,st1
    fstp dword[ecx+144h]
    
    .loop_next: ;loc_7DD497
    mov eax,[esp+10h]
    inc ebp
    add ebx,4
    cmp ebp, eax
    jl .loop
    fstp st
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
DisableButtons:

    mov ecx,[007912A0h] ; jumptable 004375FE case 22
    mov dword[ecx+2024h],0
    mov ecx,[ecx+1820h] ; this
    cmp ecx,ebx
    jz ChangeRoF.back             ; jumptable 004375FE default case
    call near $
    sub_00529950 = $-4
    jmp ChangeRoF.back 
    retn 4
    
ArmorClass:

    sub esp,4
    mov ecx,[edi+10h]  ; jumptable 004375FE case 32
    mov eax,[esp+14h]
    mov ebx,[edi+64h]
    movsx edi,cx
    mov dword[esp],0
    test eax,eax
    jle .back ; jumptable 004375FE default case
    lea ebp,[esp+98h]
    
    .start:         ; loc_7DD62B
    mov esi,[ebp+0]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .end
    mov ecx,esi
    call near $
    loc_004C6400_1 = $-4
    mov esi,[esi+8]
    xor edx,edx
    cmp [esi+126h],dx
    mov eax,[esi+128h]
    jle .end
    
    .check_armor:         ; loc_7DD652
    cmp byte[eax],bl
    jnz .next
    movsx ecx,word[eax+2]
    add ecx,edi
    and edi,edi
    jle .apply2
    cmp ecx,7FFFh
    jle .apply
    mov cx,7FFFh
    jmp .apply
     
    
    .apply2:         ; loc_7DD66F
    cmp ecx,0FFFF8000h
    jge .apply
    mov cx,8000h
    
    .apply:         ; loc_7DD67B
    mov [eax+2],cx
    jmp .end
     
    
    .next:         ;loc_7DD681
    movsx ecx,word[esi+126h]
    inc edx
    add eax,4
    cmp edx,ecx
    jl .check_armor
    
    .end:         ; loc_7DD690
    mov eax,[esp+14h]
    add dword[esp],1
    add ebp,4
    cmp dword[esp],eax
    jl .start
    
    .back:
    add esp,4
    pop edi
    pop esi
    pop ebp
    mov al,1
    pop ebx
    add esp,2034h
    retn 4

AttackClass:

    sub esp,4
    mov ecx,[edi+10h]  ; jumptable 004375FE case 32
    mov eax,[esp+14h]
    mov ebx,[edi+64h]
    movsx edi,cx
    mov dword[esp],0
    test eax,eax
    jle .back  ; jumptable 004375FE default case
    lea ebp,[esp+98h]
    
    .start:         ; loc_7DD62B
    mov esi,[ebp+0]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .end
    mov ecx,esi
    call near $
    loc_004C6400_2 = $-4
    mov esi,[esi+8]
    xor edx,edx
    cmp [esi+12Ch],dx
    mov eax,[esi+130h]
    jle .end
    
    .check_armor:         ; loc_7DD652
    cmp byte[eax],bl
    jnz .next
    movsx ecx,word[eax+2]
    add ecx,edi
    and edi,edi
    jle .apply2
    cmp ecx,7FFFh
    jle .apply
    mov cx,7FFFh
    jmp .apply
     
    
    .apply2:         ; loc_7DD66F
    cmp ecx,0FFFF8000h
    jge .apply
    mov cx,8000h
    
    .apply:         ; loc_7DD67B
    mov [eax+2],cx
    jmp .end
     
    
    .next:         ;loc_7DD681
    movsx ecx,word[esi+12Ch]
    inc edx
    add eax,4
    cmp edx,ecx
    jl .check_armor
    
    .end:         ; loc_7DD690
    mov eax,[esp+14h]
    add dword[esp],1
    add ebp,4
    cmp dword[esp],eax
    jl .start
    
    .back:
    add esp,4
    pop edi
    pop esi
    pop ebp
    mov al,1
    pop ebx
    add esp,2034h
    retn 4

DefaultArmor:

    mov eax,[esp+10h]
    xor ebp,ebp
    cmp eax,ebx
    jle .back    
    lea ebx,[esp+94h]
    mov edi,[edi+10h]
    
    .start:   ;loc_7DD45A
    mov esi,[ebx]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .end
    mov ecx,esi
    call near $
    loc_004C6400_3 = $-4
    mov ecx,[esi+8]
    add dword[ecx+124h],edi
    
    .end: ;loc_7DD497
    mov eax,[esp+10h]
    inc ebp
    add ebx,4
    cmp ebp, eax
    jl .start
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4

ChangeResource:

    mov eax,[esp+18h]
    mov ebx,[eax+0A4h]
    dec ebx
    mov ecx,[edi+64h]
    cmp ecx,ebx
    ja .back
    
    mov ebx,[edi+3Ch]
    cmp ebx,0
    jle .add
    cmp ebx,1
    je .set
    cmp ebx,2
    jne .back
    
    .mul:
    mov eax,[eax+0A8h]
    fild dword[edi+10h]
    fld dword[eax+ecx*4]
    fmul st,st1
    fstp dword[eax+ecx*4]
    fstp st
    jmp .back
    
    .add:
    mov eax,[eax+0A8h]
    fild dword[edi+10h]
    fld dword[eax+ecx*4]
    fadd st,st1
    fstp dword[eax+ecx*4]
    fstp st
    jmp .back
    
    .set:
    mov eax,[eax+0A8h]
    fild dword[edi+10h]
    fstp dword[eax+ecx*4]
    
    .back:
    jmp ChangeRoF.back
    ;db 'test',0
    
ResourceStorage:

    mov eax,[esp+10h]
    mov ebx,[edi+64h]
    dec ebx
    xor edx,edx
    test eax,eax
    jle .end  ; jumptable 004375FE default case
    lea ebp,[esp+94h]
    
    .start:         ; loc_7DD62B
    mov esi,[ebp+0]
    mov eax,[esi+8]
    cmp byte[eax+4],0Ah
    jb .next

    lea eax,[esi+44h]
    
    .apply:
    fild dword[edi+10h]
    mov ecx,[edi+3Ch]
    cmp ecx,0
    jle .add
    cmp ecx,1
    je .set
    cmp ecx,2
    je .mul
    
    .add:
    fld dword[eax]
    fadd st,st1
    fstp dword[eax]
    fstp st
    jmp .res
    
    .set:
    fstp dword[eax]
    jmp .res
    
    .mul:
    fld dword[eax]
    fmul st,st1
    fstp dword[eax]
    fstp st
    
    .res:
    cmp bx,0
    jl .next
    lea ecx,[esi+4Ch]
    mov word[ecx],bx
    
    .next:         ; loc_7DD690
    mov eax,[esp+10h]
    inc edx
    add ebp,4
    cmp edx,eax
    jl .start
    
    .end:
    pop edi
    pop esi
    pop ebp
    mov al,1
    pop ebx
    add esp,2034h
    retn 4 

ChangeLoS:

    mov eax,[esp+10h]
    xor ebp,ebp
    cmp eax,ebx
    jle .back    
    lea ebx,[esp+94h]
    
    .start:   ;loc_7DD45A
    mov esi,[ebx]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .end
    mov ecx,esi
    call near $
    loc_004C6400_4 = $-4
    
    .apply: ;loc_7DD491
    fild dword[edi+10h]
    push 1
    push eax
    fstp dword[esp]
    mov ecx,esi
    call near $
    sub_004D1EB0 = $-4
    mov ecx,[esi+08h]
    fild dword[edi+10h]
    fld dword[ecx+2Ch]
    fadd st,st1
    fstp dword[ecx+2Ch]
    fstp st
    
    .end: ;loc_7DD497
    mov eax,[esp+10h]
    inc ebp
    add ebx,4
    cmp ebp, eax
    jl .start
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4    
    
ChangeWRate:

    mov eax,[esp+10h]
    xor ebp,ebp
    cmp eax,ebx
    jle .back    
    lea ebx,[esp+94h]
    fild word[edi+10h]
    fdiv dword[006355D8h]
    
    .start:   ;loc_7DD45A
    mov esi,[ebx]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .end
    mov ecx,esi
    call near $
    loc_004C6400_5 = $-4
    mov ecx,[esi+8]
    fld dword[ecx+108h]
    fadd st,st1
    
    .apply: ;loc_7DD491
    fstp dword[ecx+108h]
    
    .end: ;loc_7DD497
    mov eax,[esp+10h]
    inc ebp
    add ebx,4
    cmp ebp, eax
    jl .start
    fstp st
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4        

ChangeHero:

    mov eax,[esp+10h]
    xor ebp,ebp
    cmp eax,ebx
    jle .back    
    lea ebx,[esp+94h]
    
    .start:   ;loc_7DD45A
    mov esi,[ebx]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .end
    mov ecx,esi
    call near $
    loc_004C6400_6 = $-4
    xor edx,edx
    mov edx,[edi+64h]
    mov ecx,[esi+8]
    mov byte[ecx+1B5h],dl
    
    .end: ;loc_7DD497
    mov eax,[esp+10h]
    inc ebp
    add ebx,4
    cmp ebp, eax
    jl .start
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
ChangeIconID:

    mov eax,[esp+10h]
    xor ebp,ebp
    cmp eax,ebx
    jle .back    
    lea ebx,[esp+94h]
    
    .start:   ;loc_7DD45A
    mov esi,[ebx]
    mov eax,[esi+8]
    cmp byte[eax+4],46h
    jb .end
    mov ecx,esi
    call near $
    loc_004C6400_7 = $-4
    xor edx,edx
    mov edx,[edi+64h]
    mov ecx,[esi+8]
    mov word[ecx+54h],dx
    
    .end: ;loc_7DD497
    mov eax,[esp+10h]
    inc ebp
    add ebx,4
    cmp ebp, eax
    jl .start
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4

AISignalGoalOff:

    mov ecx,[esp+18h]
    mov edx,[edi+0Ch]
    push edx
    mov eax,[ecx]
    call AIScriptGoalOff
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4

AIScriptGoalOff:
    mov eax,[esp+04h]
    push eax
    call UnsetAIScriptGoal
    pop ecx
    retn 4

UnsetAIScriptGoal:
    mov eax,[esp+04h]
    mov dword[eax*4+006B39A0h],0
    retn

ChangeVariable:
    mov eax,[edi+10h]
    mov ecx,[edi+64h]
    cmp ecx,255
    ja .back
    mov edx,Vars
    mov ebx,[edi+3Ch]
    cmp ebx,3
    ja .back
    
    jmp dword[.JmpTable+ebx*4]
    
    .JmpTable:
    dd .set, .add, .mul, .mul
    
    .set:
    mov [edx+ecx*4],eax
    jmp .back
    
    .add:
    add [edx+ecx*4],eax
    jmp .back
    
    .mul:
    mov ebx,[edx+ecx*4]
    imul ebx,eax
    mov [edx+ecx*4],ebx
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4

ResetAllVariables:
    mov ebx,Vars
    mov ecx,[edi+64h]
    dec ecx
    cmp ecx,0
    jl .all
    mov dword[ebx+ecx*4],0
    jmp .back
    
    .all:
    xor edx,edx
    mov eax,edx
    
    .loop:
    mov [ebx+eax*4],edx
    inc eax
    cmp eax,255
    jle .loop
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
ChangeResourceByVariable:

    mov eax,[esp+18h]
    mov ebx,[eax+0A4h]
    dec ebx
    mov ecx,[edi+14h]
    cmp ecx,ebx
    ja .back
    
    mov ebx,[edi+10h]
    cmp ebx,255
    ja .back
    
    mov ebx,[edi+64h]
    cmp ebx,7
    ja .back
    mov eax,[eax+0A8h]
    mov edx,Vars
    
    jmp dword[.JmpTable+ebx*4]
    
    .JmpTable:
    dd .set_resource, .add_resource, .sub_resource, .mul_resource,\
       .set_variable, .add_variable, .sub_variable, .mul_variable
    
    .set_resource:
    mov ebx,[edi+10h]
    fild dword[edx+ebx*4]
    fstp dword[eax+ecx*4]
    jmp .back
    
    .add_resource:
    mov ebx,[edi+10h]
    fild dword[edx+ebx*4]
    fld dword[eax+ecx*4]
    fadd st,st1
    fstp dword[eax+ecx*4]
    fstp st
    jmp .back
    
    .sub_resource:
    mov ebx,[edi+10h]
    fild dword[edx+ebx*4]
    fld dword[eax+ecx*4]
    fsub st,st1
    fstp dword[eax+ecx*4]
    fstp st
    jmp .back
    
    .mul_resource:
    mov ebx,[edi+10h]
    fild dword[edx+ebx*4]
    fld dword[eax+ecx*4]
    fmul st,st1
    fstp dword[eax+ecx*4]
    fstp st
    jmp .back
    
    .set_variable:
    fld dword[eax+ecx*4]
    stdcall near $
    sub_006139E4_A1 = $-4
    mov ebx,[edi+10h]
    mov edx,Vars
    mov [edx+ebx*4],eax
    jmp .back
    
    .add_variable:
    fld dword[eax+ecx*4]
    stdcall near $
    sub_006139E4_A2 = $-4
    mov ebx,[edi+10h]
    mov edx,Vars
    add [edx+ebx*4],eax
    jmp .back
    
    .sub_variable:
    fld dword[eax+ecx*4]
    stdcall near $
    sub_006139E4_A3 = $-4
    mov ebx,[edi+10h]
    mov edx,Vars
    sub [edx+ebx*4],eax
    jmp .back
    
    .mul_variable:
    fld dword[eax+ecx*4]
    stdcall near $
    sub_006139E4_A4 = $-4
    mov ebx,[edi+10h]
    mov edx,Vars
    mov ecx,[edx+ebx*4]
    imul ecx,eax
    mov [edx+ebx*4],ecx
    
    .back:
    jmp ChangeRoF.back
    ;db 'test',0
    
SaveVariablesToFile:

    sub esp,260
    mov ecx,[007912A0h]
    call near $
    sub_005EAE80 = $-4
    test eax,eax
    je .back
    mov eax,[007A5068h]
    push eax
    stdcall near $
    sub_006138F0 = $-4
    add esp,4
    test eax,eax
    je .def_path
    mov ecx,[007A5068h]
    mov eax,[edi+6Ch]
    lea edx,[esp]
    push eax
    push ecx
    push str_format2
    push edx
    stdcall near $
    sub_0061442B_5 = $-4
    add esp,10h
    jmp .write
    
    .def_path:
    mov eax,[edi+6Ch]
    lea edx,[esp]
    push eax
    push str_format3
    push edx
    stdcall near $
    sub_0061442B = $-4
    add esp,0Ch
    
    .write:
    lea eax,[esp]
    push mode_write
    push eax
    stdcall near $
    sub_006139A1 = $-4
    add esp,8
    mov ebx,eax
    test ebx,ebx
    je .file_fail
    mov edx,VarFileVer
    push ebx
    push 1
    push 4
    push edx
    call near $
    sub_00614BAD_1 = $-4
    add esp,10h
    mov edx,VarNumber
    push ebx
    push 1
    push 2
    push edx
    call near $
    sub_00614BAD = $-4
    add esp,10h
    mov edx,Vars
    push ebx
    push 256
    push 4
    push edx
    call near $
    sub_00614BAD_2 = $-4
    add esp,10h
    push ebx
    stdcall near $
    sub_00613896 = $-4
    add esp,4
    
    .back:
    add esp,260
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
    .file_fail:
    mov ecx,[007912A0h]
    push 2020
    mov edx,[ecx]
    call dword[edx+24h]
    mov ebx,[edi+6Ch]
    lea edx,[esp]
    push ebx
    push eax
    push edx
    stdcall near $
    sub_0061442B_2 = $-4
    add esp,0Ch
    xor ebx,ebx
    lea edx,[esp]
    push ebx
    push ebx
    push -1
    mov ecx,[007911F8h]
    push edx
    push ebx
    stdcall near $
    sub_005E2780 = $-4
    jmp .back

ReadVariablesFromFile:

    sub esp,264
    mov ecx,[007912A0h]
    call near $
    sub_005EAE80_1 = $-4
    test eax,eax
    je .back
    mov eax,[007A5068h]
    push eax
    stdcall near $
    sub_006138F0_1 = $-4
    add esp,4
    test eax,eax
    je .def_path
    mov ecx,[007A5068h]
    mov eax,[edi+6Ch]
    lea edx,[esp+04]
    push eax
    push ecx
    push str_format2
    push edx
    stdcall near $
    sub_0061442B_7 = $-4
    add esp,10h
    jmp .read
    
    .def_path:
    mov eax,[edi+6Ch]
    lea edx,[esp+04]
    push eax
    push str_format3
    push edx
    stdcall near $
    sub_0061442B_1 = $-4
    add esp,0Ch
    
    .read:
    lea eax,[esp+04]
    push mode_read
    push eax
    stdcall near $
    sub_006139A1_1 = $-4
    add esp,8
    mov ebx,eax
    test ebx,ebx
    je .file_fail
    xor ecx,ecx
    lea ecx,[esp]
    push ebx
    push 1
    push 4
    push ecx
    call near $
    sub_006148E1_2 = $-4
    add esp,10h
    lea ecx,[esp]
    mov ecx,[ecx]
    cmp ecx,dword[VarFileVer]
    jne .uncompatible_version
    xor ecx,ecx
    lea ecx,[esp]
    push ebx
    push 1
    push 2
    push ecx
    call near $
    sub_006148E1 = $-4
    add esp,10h
    lea ecx,[esp]
    mov cx,[ecx]
    cmp cx,word[VarNumber]
    jg .more_vars_in_file
    mov edx,Vars
    push ebx
    push ecx
    push 4
    push edx
    call near $
    sub_006148E1_1 = $-4
    add esp,10h
    push ebx
    stdcall near $
    sub_00613896_1 = $-4
    add esp,4
    
    .back:
    add esp,264
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
    .file_fail:
    mov ecx,[007912A0h]
    push 2020
    mov edx,[ecx]
    call dword[edx+24h]
    mov ebx,[edi+6Ch]
    lea edx,[esp+04]
    push ebx
    push eax
    push edx
    stdcall near $
    sub_0061442B_3 = $-4
    add esp,0Ch
    xor ebx,ebx
    lea edx,[esp+04]
    push ebx
    push ebx
    push -1
    mov ecx,[007911F8h]
    push edx
    push ebx
    stdcall near $
    sub_005E2780_1 = $-4
    jmp .back
    
    .more_vars_in_file:
    mov ecx,[007912A0h]
    push 2021
    mov edx,[ecx]
    call dword[edx+24h]
    mov edi,[edi+6Ch]
    lea edx,[esp+04]
    push edi
    push eax
    push edx
    stdcall near $
    sub_0061442B_4 = $-4
    add esp,0Ch
    xor edi,edi
    lea edx,[esp+04]
    push edi
    push edi
    push -1
    mov ecx,[007911F8h]
    push edx
    push edi
    stdcall near $
    sub_005E2780_2 = $-4
    push ebx
    stdcall near $
    sub_00613896_2 = $-4
    add esp,4
    jmp .back
    
    .uncompatible_version:
    mov ecx,[007912A0h]
    push 2022
    mov edx,[ecx]
    call dword[edx+24h]
    mov edi,[edi+6Ch]
    lea edx,[esp+04]
    push edi
    push eax
    push edx
    stdcall near $
    sub_0061442B_6 = $-4
    add esp,0Ch
    xor edi,edi
    lea edx,[esp+04]
    push edi
    push edi
    push -1
    mov ecx,[007911F8h]
    push edx
    push edi
    stdcall near $
    sub_005E2780_3 = $-4
    push ebx
    stdcall near $
    sub_00613896_3 = $-4
    add esp,4
    jmp .back
    
Guard:
    mov ecx,[esp+24h]
    push ecx
    mov edx,[esp+14h]
    cmp edx,28h
    jle .send_cmd
    mov edx,28h
    
    .send_cmd:
    push edx
    mov ecx,[007912A0h]
    mov edx,[ecx+424h]
    lea eax,[esp+9Ch]
    push eax
    mov ecx,[edx+68h]
    call near $
    sub_005C9A30 = $-4
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
Follow:
    mov ecx,[esp+24h]
    push ecx
    mov edx,[esp+14h]
    cmp edx,28h
    jle .send_cmd
    mov edx,28h
    
    .send_cmd:
    push edx
    mov ecx,[007912A0h]
    mov edx,[ecx+424h]
    lea eax,[esp+9Ch]
    push eax
    mov ecx,[edx+68h]
    call near $
    sub_005C9AE0 = $-4
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
Scout:

    mov edx,[esp+10h]
    fild dword[edi+44h]
    cmp edx,28h
    jle .send_cmd
    mov edx,28h
    
    .send_cmd:
    ;lea eax,[esp+2Ch]
    ;lea ecx,[esp+28h]
    ;push eax
    fstp dword[esp+2Ch]
    fild dword[edi+48h]
    fstp dword[esp+28h]
    mov eax,[esp+2Ch]
    mov ecx,[esp+28h]
    push ecx
    push eax
    mov ecx,[007912A0h]
    push edx
    mov edx,[ecx+424h]
    lea eax,[esp+0A0h]
    push eax
    mov ecx,[edx+68h]
    call near $
    sub_005C9C70 = $-4
    pop edi
    pop esi
    pop ebp
    mov al,1
    pop ebx
    add esp,2034h
    retn 4
    
DisplayParsedInstructions:
    mov ecx,[007912A0h] ; jumptable 004375FE case 19
    mov esi,[ecx+1820h]
    cmp esi,ebx
    jz .end            ; jumptable 004375FE default case
    mov eax,[edi+34h]
    cmp eax, ebx
    jl .read_txtbox
    mov edx,[ecx]
    push eax
    call dword[edx+24h]
    jmp .parse
    
    .read_txtbox:
    mov eax,[edi+6Ch]
    
    .parse:
    sub esp,260
    push Vars
    mov ecx,[007912A0h]
    push ecx
    lea edx,[esp+8]
    push edx
    push eax
    call near $
    sub_stringParser = $-4
    add esp,16
    mov eax,esp

    .check:
    mov ecx,[edi+64h]
    xor edx,edx
    cmp ecx,ebx
    jl .show_text
    cmp ecx,2
    jg .show_text
    mov edx,ecx

    .show_text:
    mov ecx,[edi+3Ch]
    push edx             ; Panel
    mov edx,[edi+70h]
    push ecx             ; Timer
    push edx             ; Sound
    push eax             ; Text
    mov ecx,esi        ; this
    call near $
    sub_007C85A0 = $-4
    
    .end:
    add esp,260
    pop edi
    pop esi
    pop ebp
    mov al,1
    pop ebx
    add esp,2034h
    retn 4
    
SendParsedChat:
    mov ecx,[007912A0h]
    call near $
    sub_005E7560_3 = $-4
    cmp [esp+18h], eax
    jnz .end
    mov eax, [edi+34h]
    cmp eax, ebx
    jl .read_text
    mov ecx,[007912A0h]
    push eax
    mov edx,[ecx]
    call dword[edx+24h]
    jmp .parse
    
    .read_text:
    mov eax,[edi+6Ch]
    
    .parse:
    sub esp,260
    push Vars
    mov ecx,[007912A0h]
    push ecx
    lea edx,[esp+8]
    push edx
    push eax
    call near $
    sub_stringParser_1 = $-4
    add esp,16
    mov eax,esp
    
    .send_chat:
    push ebx
    push ebx
    push -1
    mov ecx,[007911F8h]
    push eax
    push ebx
    call near $
    sub_005E2780_4 = $-4
    add esp,260
    jmp near $
    loc_0043768D = $-4
    
    .end:
    pop edi
    pop esi
    pop ebp
    mov al,1
    pop ebx
    add esp,2034h
    retn 4
    
ChangeAndParseName:
    mov eax,[esp+10h]
    xor ebp,ebp
    cmp eax,ebx
    jng .end
    sub esp,260
    push Vars
    mov ecx,[007912A0h]
    push ecx
    lea edx,[esp+8]
    push edx
    mov eax,[edi+6Ch]
    push eax
    call near $
    sub_stringParser_2 = $-4
    add esp,16
    lea ebx,[esp+198h]
    mov eax,[edi+64h]
    test eax,eax
    jng .change_name_loop
    
    .attribute:
    sub esp,14h
    lea ebp,[esp+14h]

    .loop1:
    lea edx,[esp+0Ch]
    lea ecx,[esp+08]
    lea eax,[esp+04]
    push edx
    lea edx,[esp+04]
    push ecx
    push eax
    push edx
    push 007C8F10h
    push ebp
    call near $
    sub_0061567C = $-4
    add esp,18h
    cmp eax,04
    jne .end_attr ;end1
    mov eax,[esp+04]
    mov ebp,[ecx]
    mov edx,[esp]
    cmp eax,01
    je .loop1 ;loop1
    cmp eax,66h
    je .loop1 ;loop1
    cmp edx,02
    ja .loop1 ;loop1
    mov [esp+10h],ebp
    xor ebp,ebp
    lea ebx,[esp+1ACh]
    
    .apply_loop:
    mov esi,[ebx]
    mov eax,[esi+08]
    mov al,[eax+04]
    cmp al,46h
    je .apply_valid
    cmp al,50h
    jne .apply_next
    
    .apply_valid:
    mov ecx,esi
    call near $
    sub_004C6400_1 = $-4
    mov eax,[esp+04]
    mov ecx,[esp+08]
    mov edx,[esp+0Ch]
    push eax
    push ecx
    fild dword[esp]
    cmp edx,02
    jne .dont_divide ;divide
    fmul qword[006374D8h]
    .dont_divide:
    fstp dword[esp]
    mov ecx,[esi+08]
    mov edx,[ecx]
    mov eax,[esp+08]
    call dword[edx+eax*4+08]
    
    .apply_next:
    mov eax,[esp+128h]
    inc ebp
    add ebx,04
    cmp ebp,eax
    jl .apply_loop
    
    mov ebp,[esp+10h]
    jmp .loop1

    .end_attr:
    add esp,14h
    jmp ._end
    
    .change_name_loop:
    mov esi,[ebx]
    mov eax,[esi+08]
    mov al,[eax+04]
    cmp al,46h
    je .change_name_valid
    cmp al,50h
    jne .change_name_next

    .change_name_valid:
    mov ecx,esi
    call near $
    sub_004C6400 = $-4
    
    .change_name:
    mov esi,[esi+08]
    mov cx,[edi+34h]
    mov [esi+0Ch],cx
    lea edx,[esp]
    add esi,08
    push edx
    push esi
    call near $
    sub_00568590 = $-4
    add esp,08

    .change_name_next:
    mov eax,[esp+114h]
    inc ebp
    add ebx,04
    cmp ebp,eax
    jl .change_name_loop ;loop

    ._end:
    add esp,260
    .end:
    pop edi
    pop esi
    pop ebp
    mov al,01
    pop ebx
    add esp,2034h
    retn 4
    
RandomizeVariable:
    mov ecx,[edi+64h]
    cmp ecx,255
    ja .back
    mov esi,[edi+3Ch]
    mov ebx,[edi+10h]
    cmp ebx,esi
    jle .back
    sub ebx,esi
    stdcall near $
    sub_007B2820_2 = $-4
    cdq
    mov ecx,ebx
    idiv ecx
    add edx,esi
    mov ecx,[edi+64h]
    mov eax,Vars
    mov [eax+ecx*4],edx
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
PickRandomValue:
    mov esi,[edi+64h]
    cmp esi,255
    ja .back
    mov eax,[edi+34h]
    cmp eax, ebx
    jl .read_txtbox
    mov edx,[ecx]
    push eax
    call dword[edx+24h]
    jmp .parse
    
    .read_txtbox:
    mov eax,[edi+6Ch]
    
    .parse:
    sub esp,260
    push Vars
    mov ecx,[007912A0h]
    push ecx
    lea edx,[esp+8]
    push edx
    push eax
    call near $
    sub_stringParser_3 = $-4
    add esp,16
    mov eax,esp
    
    .pick:
    push eax
    call near $
    sub_randomPicker = $-4
    add esp,4
    add esp,260
    mov ecx,Vars
    mov [ecx+esi*4],eax
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4
    
SaveValueToVariable:
    mov ebx,[edi+64h]
    cmp ebx,255
    jg .back
    mov esi,[edi+10h]
    cmp esi,2
    jg .back
    jl .game_time
    
    .tile_coord:
    mov eax,[edi+44h]
    mov ecx,[edi+48h]
    imul ecx,256
    add ecx,eax
    mov edx,Vars
    mov [edx+ebx*4],ecx
    jmp .back
    
    .game_time:
    mov ecx,[007912A0h]
    mov ecx,[ecx+424h]
    fild dword[ecx+10h]
    fdiv dword[constFloat1000]
    dec esi
    sete al
    jne .seconds
    fdiv dword[constFloat5]
    .seconds:
    call near $
    sub_006139E4_3 = $-4
    mov edx,Vars
    mov [edx+ebx*4],eax
    
    .back:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp,2034h
    retn 4   
    
CondAlloc:

    mov edx,[edx+4Ch]
    mov [edx],cl
    
    .OwnFewerFoundations:
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+04h],al
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+0Dh],al
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+0Eh],al
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx],cl
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+05h],cl
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+09h],al
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+0Ah],al
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+0Bh],al
    mov edx,[esi+08h]
    mov edx,[edx+58h]
    mov [edx+0Ch],al
    
    .OwnFewerDestroyedBldgs:
    mov edx,[esi+08h]
    mov edx,[edx+5Ch]
    mov [edx+04h],al
    mov [edx+0Dh],al
    mov [edx+0Eh],al
    mov [edx],cl
    mov [edx+05h],cl
    mov [edx+09h],al
    mov [edx+0Ah],al
    mov [edx+0Bh],al
    mov [edx+0Ch],al
    
    .RoomSetting:
    mov edx,[esi+08h]
    mov edx,[edx+60h]
    mov [edx],cl
    mov edx,[esi+08h]
    mov edx,[edx+60h]
    mov [edx+07h],cl
    
    .TriggerStatus:
    mov edx,[esi+08h]
    mov edx,[edx+64h]
    mov [edx],cl
    
    .Version:
    mov edx,[esi+08h]
    mov edx,[edx+68h]
    mov [edx+05h],cl
    
    .VariableValue:
    mov edx,[esi+08h]
    mov edx,[edx+6Ch]
    mov [edx],cl
    mov [edx+07h],cl
    
    .VariableValueLowerThan:
    mov edx,[esi+08h]
    mov edx,[edx+70h]
    mov [edx],cl
    mov [edx+07h],cl
    
    .TechnologyState:
    mov edx,[esi+08h]
    mov edx,[edx+74h]
    mov [edx],cl
    mov [edx+05h],cl
    mov [edx+06h],cl
    
    jmp near $
    loc_004399F5 = $-4


CondJmpTable:
    
    dd 0x00436B45
    dd 0x00436B92
    dd 0x00436BFF
    dd 0x007E2230
    dd 0x00436CBF
    dd 0x00436D08
    dd 0x00436D27
    dd 0x00436D4D
    dd 0x00436D7E
    dd 0x00436DAF
    dd 0x00436DBB
    dd 0x00436E00
    dd 0x00436E3A
    dd 0x00436E5E
    dd 0x00436EFC
    dd 0x00436F61
    dd 0x00436FC2
    dd 0x00436FEF
    dd 0x00436FFF
    dd 0x007E2650
    dd 0x007E2680
    dd OwnFewerFoundations
    dd OwnFewerDestroyedBldgs
    dd RoomSetting
    dd TriggerStatus
    dd Version
    dd VariableValue
    dd VariableValueLowerThan
    dd TechnologyState

Civilization:

    mov edx,[esp+24h]
    mov cl,[edx+15Dh]
    mov al,[esi+0Ch]
    cmp al,cl
    jne near $
    loc_437029 = $-4
    pop edi
    mov byte[esp+0Fh],1
    
    .back:
    mov al,[esp+0Fh]
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8

Chance:

    mov ebx,[esi+0Ch]
    cmp ebx,100
    jbe .valid
    mov ebx,100
    
    .valid:
    stdcall near $
    sub_007B2820_1 = $-4
    cdq
    mov ecx,100
    idiv ecx
    cmp edx,ebx
    jg near $
    loc_437029_1 = $-4
    pop edi
    mov byte[esp+0Fh],1
    
    .back:
    mov al,[esp+0Fh]
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8

OwnFewerFoundations:

    mov ecx,[esi+44h]  ; jumptable 00436B3E case 3
    mov edx,[esi+3Ch]
    mov eax,[esi+38h]
    push 0
    push ecx
    mov ecx,[esi+34h]
    push edx
    mov edx,[esi+30h]
    push eax
    mov eax,[esi+40h]
    push ecx
    mov ecx,[esi+1Ch]
    push edx
    mov edx,[esp+3Ch]
    push 0
    push eax
    push ecx
    mov ecx,[edx+78h]
    call CountObjectsOld
    mov ecx,[esi+3Ch]
    mov edx,[esi+38h]
    mov edi,eax
    mov eax,[esi+44h]
    push 0
    push eax
    mov eax,[esi+34h]
    push ecx
    mov ecx,[esi+30h]
    push edx
    push eax
    push ecx
    mov edx,[esi+40h]
    mov ecx,[esp+3Ch]
    mov eax,[esi+1Ch]
    push 0
    mov ecx,[ecx+7Ch]
    push edx
    push eax
    call CountObjectsOld
    jmp near $
    loc_00436C9F_1 = $-4
    
OwnFewerDestroyedBldgs:

    mov ecx,[esi+44h]  ; jumptable 00436B3E case 3
    mov edx,[esi+3Ch]
    mov eax,[esi+38h]
    push 0
    push ecx
    mov ecx,[esi+34h]
    push edx
    mov edx,[esi+30h]
    push eax
    mov eax,[esi+40h]
    push ecx
    mov ecx,[esi+1Ch]
    push edx
    mov edx,[esp+3Ch]
    push 3
    push eax
    push ecx
    mov ecx,[edx+78h]
    call CountObjectsOld
    mov ecx,[esi+3Ch]
    mov edx,[esi+38h]
    mov edi,eax
    mov eax,[esi+44h]
    push 0
    push eax
    mov eax,[esi+34h]
    push ecx
    mov ecx,[esi+30h]
    push edx
    push eax
    push ecx
    mov edx,[esi+40h]
    mov ecx,[esp+3Ch]
    mov eax,[esi+1Ch]
    push 3
    mov ecx,[ecx+7Ch]
    push edx
    push eax
    call CountObjectsOld
    jmp near $
    loc_00436C9F_2 = $-4
    
CountObjectsOld:

    sub esp,8
    push ebx
    push ebp
    mov ebp,ecx
    xor eax,eax
    xor ebx,ebx
    mov [esp+0Ch],eax
    mov ecx,[ebp+8]
    test ecx, ecx
    jle .end
    mov eax,[esp+34h]
    push esi
    push edi
    mov [esp+10h], eax

    .start:  ; loc_5681E4
    mov ecx,[ebp+4]
    mov eax,[esp+24h]
    test eax, eax
    mov esi,[ecx+ebx*4]
    jl .jmp_
    xor edx, edx
    mov dl,[esi+48h]
    cmp edx, eax
    jnz .loop_end

    .jmp_:  ;loc_5681FF
    mov ecx,[esp+1Ch]
    test ecx, ecx
    jl .jmp_3
    mov eax,[esi+8]
    movsx edx,word[eax+10h]
    cmp edx, ecx
    jnz .loop_end
    jmp .count
 
    .jmp_3:  ;loc_568218
    mov eax,[esp+20h]
    test eax, eax
    jl .jmp_2
    mov edx,[esi+8]
    movsx edx,word[edx+16h]
    cmp edx, eax
    jnz .loop_end

    .jmp_2:  ;loc_56822B
    test ecx, ecx
    jge .count
    test eax, eax
    jge .count
    mov eax,[esp+38h]
    test eax,eax
    jl .count
    mov ecx,[esi+8]
    xor edx, edx
    mov dl,[ecx+94h]
    cmp edx, eax
    jnz .loop_end

    .count:  ;loc_56824A
    mov eax,[esp+28h]
    test eax, eax
    jl .jmp_4
    fld dword[esi+38h]
    call near $
    sub_006139E4_1 = $-4
    mov edi,eax
    mov eax,[esp+28h]
    cmp edi,eax
    jl .loop_end
    fld dword[esi+3Ch]
    call near $
    sub_006139E4_2 = $-4
    cmp eax,[esp+2Ch]
    jl .loop_end
    cmp edi,[esp+30h]
    jg .loop_end
    cmp eax,[esp+34h]
    jg .loop_end

    .jmp_4:  ;loc_56827E
    mov eax,[esp+3Ch]
    test eax, eax
    jz .jmp_5
    mov eax,[esp+10h]
    mov [eax], esi

    .jmp_5:  ; loc_56828C
    mov ecx,[esp+14h]
    mov eax,[esp+10h]
    inc ecx
    add eax,4
    mov [esp+14h], ecx
    mov [esp+10h], eax

    .loop_end:  ;loc_5682A0
    mov eax,[ebp+8]
    inc ebx
    cmp ebx,eax
    jl .start
    mov eax,[esp+14h]
    pop edi
    pop esi

    .end:  ;loc_5682B2
    pop ebp
    pop ebx
    add esp,8
    retn 24h
    
TriggerStatus:
    
    mov eax,[esi+0Ch]
    mov edx,ebx
    push eax
    mov ecx,[edx+2A0h]
    call near $
    sub_0043A000 = $-4
    test eax,eax
    je .back
    
    .read_trigger:
    mov eax,dword[eax]
    cmp eax,1
    sete al
    and eax,1
    
    .back:
    mov [esp+13h],al
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8    
    
SaveScenSec:

    push eax
    mov eax,[esp+28h]
    mov ebx,[esp+28h]
    jmp near $
    loc_00436B16 = $-4
    
Version:
    mov ecx,[esp+24h]
    mov eax,[ecx+12DCh]
    test eax,eax
    setnz al
    and eax,1
    
    .back:
    mov [esp+13h],al
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8

VariableValue:
    xor eax,eax
    mov ecx,[esi+28h]
    cmp ecx,255
    ja .back
    mov edx,Vars
    mov ebx,[edx+ecx*4]
    mov edx,[esi+0Ch]
    cmp edx,ebx
    sete al
    
    .back:
    mov [esp+13h],al
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8 

VariableValueLowerThan:
    xor eax,eax
    mov ecx,[esi+28h]
    cmp ecx,255
    ja .back
    mov edx,Vars
    mov ebx,[edx+ecx*4]
    mov edx,[esi+0Ch]
    cmp edx,ebx
    jge .back
    mov al,1
    
    .back:
    mov [esp+13h],al
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8

RoomSetting:
    xor eax,eax
    mov edx,[esi+28h]
    cmp edx,12
    ja .back
    jmp dword[.JmpTable+edx*4]
    
    .JmpTable:
    dd .MultiPlayer, .TeamsTogether, .LockTeams, .LockSpeed, .AllowCheats,\
       .Resources, .Population, .GameSpeed, .RevealMap, .Victory,\
       .VictoryTimeLimit, .VictoryScore, .AllTechs
    
    .MultiPlayer:
    mov ecx,[007912A0h]
    call near $
    sub_005EAE90_2 = $-4
    mov ebx,eax
    xor eax,eax
    cmp ebx,1
    sete al
    and eax,1
    jmp .back
    
    
    .TeamsTogether:
    mov ecx,[007912A0h]
    call near $
    sub_004459E0 = $-4
    test eax,eax
    setz al
    jmp .back
    
    .LockTeams:
    mov ecx,[007912A0h]
    mov al,[ecx+9D2h]
    jmp .back
    
    .LockSpeed:
    mov ecx,[007912A0h]
    call near $
    sub_005EB420 = $-4
    test eax,eax
    setnz al
    and eax,1
    jmp .back
    
    .AllowCheats:
    mov ecx,[007912A0h]
    mov al,[ecx+9B6h]
    jmp .back
    
    .Resources:
    mov edx,[esi+0Ch]
    mov ecx,[007912A0h]
    stdcall near $
    sub_00445A00 = $-4
    cmp eax,edx
    sete al
    and eax,1
    jmp .back
    
    .Population:
    mov edx,[esi+0Ch]
    mov ecx,[007912A0h]
    call near $
    sub_00445A60 = $-4
    imul eax,25
    cmp edx,eax
    sete al
    and eax,1
    jmp .back
    
    .GameSpeed:
    fild dword[esi+0Ch]
    fdiv dword[SpeedDivider]
    mov ecx,[007912A0h]
    call near $
    sub_005EAE90 = $-4
    test eax,eax
    je .SpeedSingle
    fld dword[ecx+9D4h]
    fcomi st,st1
    sete al
    and eax,1
    fstp st
    fstp st
    jmp .back
    
    .SpeedSingle:
    fld dword[ecx+1094h]
    fcomi st,st1
    sete al
    and eax,1
    fstp st
    fstp st
    jmp .back
    
    .RevealMap:
    mov edx,[esi+0Ch]
    mov ecx,[007912A0h]
    call near $
    sub_004454C0 = $-4
    cmp edx,eax
    sete al
    and eax,1
    jmp .back
    
    .Victory:
    mov edx,[esi+0Ch]
    mov ecx,[007912A0h]
    call near $
    sub_00445840 = $-4
    mov ebx,eax
    xor eax,eax
    cmp edx,2
    je .Relics
    cmp edx,3
    je .LastMan
    cmp ebx,edx
    sete al
    and eax,1
    jmp .back
    
    .Relics:
    cmp ebx,4
    sete al
    and eax,1
    jmp .back
    
    .LastMan:
    cmp ebx,0Bh
    sete al
    and eax,1
    jmp .back
    
    .VictoryTimeLimit:
    mov ecx,[007912A0h]
    call near $
    sub_00445840_1 = $-4
    mov ebx,eax
    xor eax,eax
    cmp ebx,7
    jne .back
    call near $
    sub_00445850 = $-4
    cdq
    mov ecx,10
    idiv ecx
    mov ebx,[esi+0Ch]
    cmp ebx,eax
    sete al
    and eax,1
    jmp .back
    
    .VictoryScore:
    mov ecx,[007912A0h]
    call near $
    sub_00445840_2 = $-4
    mov ebx,eax
    xor eax,eax
    cmp ebx,8
    jne .back
    call near $
    sub_00445850_1 = $-4
    mov ebx,[esi+0Ch]
    cmp ebx,eax
    sete al
    and eax,1
    jmp .back
    
    .AllTechs:
    mov ecx,[007912A0h]
    call near $
    sub_004459F0 = $-4
    test eax,eax
    setnz al
    and eax,1
    jmp .back
    
    .back:
    mov [esp+13h],al
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8
    
ResetVars1:

    xor ecx,ecx
    
    push 1024
    push eax
    push Vars
    stdcall near $
    sub_00616D80 = $-4
    add esp,0Ch
    
    xor eax,eax
    
    mov ecx,200h
    jmp near $
    loc_004A5CD0 = $-4
    
ResetVars2:

    xor ecx,ecx
    mov edi,Vars
    
    .loop:
    mov [edi],eax
    add edi,4
    inc ecx
    cmp ecx,20
    jle .loop
    
    mov ecx,200h
    jmp near $
    loc_004A5F3A = $-4
    
TechnologyState:

    mov cx,[esi+24h]
    mov edx,[esp+24h]
    push ecx
    mov ecx,[edx+12A0h]
    call near $
    sub_0040231B = $-4
    mov bx,[esi+0Ch]
    xor ecx,ecx
    mov cx,ax
    inc ecx
    cmp cx,bx
    sete al
    and eax,1
    
    .back:
    mov [esp+13h],al
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp,0Ch
    retn 8
    
FixEffectName:
    add esp,08
    push eax
    push effect_format
    lea eax,[edx+01]
    push eax
    call near $
    sub_0061442B_8 = $-4
    add esp,0Ch
    jmp near $
    loc_004E3A90 = $-4
    
    
AllocateNewControls:
    mov eax,[esi+918h]
    mov edx,VarModeTxtPtr
    push 10787
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0 = $-4
    test eax,eax
    je near $
    loc_004EB3A6 = $-4
    mov ecx,[esi+918h]
    mov edi,VarModeDdbPtr
    push edi
    push ecx
    mov ecx,esi
    call near $
    sub_004EDED0 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_1 = $-4
    mov ecx,[edi]
    push -1
    push 10791
    call near $
    sub_00562D10_A1 = $-4
    mov ecx,[esi+918h]
    mov edi,VarResModeDdbPtr
    push edi
    push ecx
    mov ecx,esi
    call near $
    sub_004EDED0_1 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_2 = $-4
    mov ecx,[edi]
    push -1
    push 10791
    call near $
    sub_00562D10_A2 = $-4
    mov eax,[esi+918h]
    mov edx,VarResModeTxtPtr
    push 10787
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_1 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_3 = $-4
    mov eax,[esi+918h]
    mov edx,RoomSettingTxtPtr
    push 54408
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_2 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_4 = $-4
    mov ecx,[esi+918h]
    mov edi,RoomSettingDdbPtr
    push edi
    push ecx
    mov ecx,esi
    call near $
    sub_004EDED0_2 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_5 = $-4
    mov ecx,[edi]
    push -1
    push 3126
    call near $
    sub_00562D10_A3 = $-4
    mov eax,[esi+918h]
    mov edx,TechStateTxtPtr
    push 54413
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_3 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_6 = $-4
    mov ecx,[esi+918h]
    mov edi,TechStateDdbPtr
    push edi
    push ecx
    mov ecx,esi
    call near $
    sub_004EDED0_3 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_7 = $-4
    mov ecx,[edi]
    push -1
    push 3132
    call near $
    sub_00562D10_A4 = $-4
    mov eax,[esi+918h]
    mov edx,VarIDTxt
    push 3133
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_4 = $-4
    mov eax,[esi+918h]
    mov edx,VarIDTxt2
    push 3133
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_5 = $-4
    mov eax,[esi+918h]
    mov edx,CivIDTxt
    push 3134
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_6 = $-4
    mov eax,[esi+918h]
    mov edx,MinValLblPtr
    push 3147
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_7 = $-4
    mov eax,[esi+918h]
    mov edx,MaxValLblPtr
    push 3146
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_8 = $-4
    mov eax,[esi+918h]
    push 0 
    push 0 
    push 3 
    mov edi,MinValTxtPtr
    push 0Ah 
    push 0x00683CE8
    push edi 
    push eax 
    mov ecx, esi 
    call near $
    sub_004EDE70 = $-4
    test eax,eax
    jz near $
    loc_004EB3A6_8 = $-4
    mov ecx,[edi]
    push -1
    push 781Ch
    call near $
    sub_00562D10_A5 = $-4
    mov eax,[esi+918h]
    push 0 
    push 0 
    push 3 
    mov edi,MaxValTxtPtr
    push 0Ah 
    push 0x00683CE8
    push edi 
    push eax 
    mov ecx, esi 
    call near $
    sub_004EDE70_1 = $-4
    test eax,eax
    jz near $
    loc_004EB3A6_9 = $-4
    mov ecx,[edi]
    push -1
    push 781Ch
    call near $
    sub_00562D10_A6 = $-4
    mov ecx,[esi+918h]
    mov edi,ValModeDdbPtr
    push edi
    push ecx
    mov ecx,esi
    call near $
    sub_004EDED0_4 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_0A = $-4
    mov ecx,[edi]
    push -1
    push 3151
    call near $
    sub_00562D10_A7 = $-4
    mov eax,[esi+918h]
    mov edx,ValModeLblPtr
    push 10787
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_9 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_0B = $-4
    mov ecx,[esi+918h]
    mov edi,ResModeDdbPtr
    push edi
    push ecx
    mov ecx,esi
    call near $
    sub_004EDED0_5 = $-4
    test eax,eax
    je near $
    loc_004EB3A6_0C = $-4
    mov ecx,[edi]
    push -1
    push 3151
    call near $
    sub_00562D10_A8 = $-4
    mov eax,[esi+918h]
    mov edx,ResModeLblPtr
    push 10787
    push edx
    push eax
    mov ecx,esi
    call near $
    sub_004EDDD0_0A = $-4
    test eax,eax
    je near $
    loc_004EB3A6_0D = $-4
    
    .back:
    mov ecx,[ebp]
    push 1
    jmp near $
    loc_004EB255 = $-4
    
InitializeNewControls:
    mov ecx,[VarModeTxtPtr]
    push 14h
    push 96h
    push 2
    push 0E6h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[VarIDTxt]
    push 14h
    push 96h
    push 2
    push 0E6h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[VarModeDdbPtr]
    push 14h
    push 55h
    push 16h
    push 0E6h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[VarResModeDdbPtr]
    push 14h
    push 0C8h
    push 7Bh
    push 4
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[VarResModeTxtPtr]
    push 14h
    push 0C8h
    push 67h
    push 4
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[RoomSettingTxtPtr]
    push 14h
    push 96h
    push 2
    push 0E6h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[RoomSettingDdbPtr]
    push 14h
    push 96h
    push 16h
    push 0E6h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[TechStateDdbPtr]
    push 14h
    push 0C8h
    push 7Bh
    push 4
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[TechStateTxtPtr]
    push 14h
    push 0C8h
    push 67h
    push 4
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[VarIDTxt2]
    push 14h
    push 96h
    push 67h
    push 181h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[CivIDTxt]
    push 14h
    push 0C6h
    push 67h
    push 181h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[MinValLblPtr]
    push 14h
    push 96h
    push 3Ch
    push 4h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[MaxValLblPtr]
    push 14h
    push 96h
    push 67h
    push 4h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[MinValTxtPtr]
    push 14h
    push 96h
    push 50h
    push 4h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[MaxValTxtPtr]
    push 14h
    push 96h
    push 7Bh
    push 4h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[ValModeLblPtr]
    push 14h
    push 96h
    push 2
    push 0E6h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[ValModeDdbPtr]
    push 14h
    push 96h
    push 16h
    push 0E6h
    mov edx,[ecx]
    call dword[edx+1Ch]
    mov ecx,[ResModeLblPtr]
    push 14h
    push 96h
    push 66h
    mov edx,[ecx]
    push 518
    call dword[edx+1Ch]
    mov ecx,[ResModeDdbPtr]
    push 14h
    push 5Ah
    push 7Ah
    mov edx, [ecx]
    push 518
    call dword[edx+1Ch]
    
    .back:
    mov ecx,[esi+0E50h]
    jmp near $
    loc_004ECF22 = $-4
    
HideNewControls:
    mov ecx,[VarModeTxtPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[VarModeDdbPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[VarResModeDdbPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[VarResModeTxtPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[RoomSettingTxtPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[RoomSettingDdbPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[TechStateDdbPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[TechStateTxtPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[VarIDTxt]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[VarIDTxt2]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[CivIDTxt]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[MinValLblPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[MaxValLblPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[MinValTxtPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[MaxValTxtPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[ValModeLblPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[ValModeDdbPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[ResModeLblPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[ResModeDdbPtr]
    push 0
    mov eax,[ecx]
    call dword[eax+14h]
    
    .back:
    mov ecx,[esi+0E64h]
    jmp near $
    loc_004E21C1 = $-4
    
DeallocateNewControls:
    mov eax,VarModeTxtPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A1 = $-4
    mov eax,VarModeDdbPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A2 = $-4
    mov eax,VarResModeDdbPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A3 = $-4
    mov eax,VarResModeTxtPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A4 = $-4
    mov eax,RoomSettingTxtPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A5 = $-4
    mov eax,RoomSettingDdbPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A6 = $-4
    mov eax,TechStateDdbPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A7 = $-4
    mov eax,TechStateTxtPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A8 = $-4
    mov eax,VarIDTxt
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A9 = $-4
    mov eax,VarIDTxt2
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A10 = $-4
    mov eax,CivIDTxt
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A11 = $-4
    mov eax,MinValLblPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A12 = $-4
    mov eax,MaxValLblPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A14 = $-4
    mov eax,MinValTxtPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A13 = $-4
    mov eax,MaxValTxtPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A15 = $-4
    mov eax,ValModeLblPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A16 = $-4
    mov eax,ValModeDdbPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A17 = $-4
    mov eax,ResModeDdbPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A18 = $-4
    mov eax,ResModeLblPtr
    push eax
    mov ecx,esi
    call near $
    sub_005E7310_A19 = $-4
    
    .back:
    lea eax,[esi+0E64h]
    jmp near $
    loc_004EF758 = $-4
    
SaveTimer:
    cmp dword[esp+14h],46
    je .drop_down_box
    cmp dword[esp+14h],57
    je .min_val
    cmp dword[esp+14h],39
    je .res_mode
    cmp dword[esp+14h],40
    je .res_mode
    mov ecx, [esi+0DF8h] ; jumptable 004E2B2C case 12
    push 1
    mov eax, [ecx]
    call dword[eax+14h]
    mov ecx, [esi+0DFCh]
    push 1
    mov edx, [ecx]
    call dword[edx+14h]
    mov ecx, [esi+0DFCh]
    push 1
    mov eax, [ecx]
    call dword[eax+0D0h]
    mov ecx, [esi+0DFCh]
    push 00683CE8h    ; Source
    call near $
    sub_0054DCC0 = $-4
    mov eax, [esp+10h]
    cmp eax, ebp
    jge .store_string
    lea ecx, [esp+4Ch]
    push 0Ah             ; Radix
    push ecx             ; Dest
    push 0Ah             ; Value
    call near $
    sub_00620886 = $-4
    mov ecx, [esi+0DFCh]
    add esp, 0Ch
    lea edx, [esp+4Ch]
    push edx             ; Source
    call near $
    sub_0054DCC0_1 = $-4
    jmp near $
    loc_004E2F89 = $-4
    
    .store_string:
    lea ecx, [esp+4Ch]
    push 0Ah             ; Radix
    push ecx             ; Dest
    push eax             ; Value
    call near $
    sub_00620886_1 = $-4
    mov ecx, [esi+0DFCh]
    add esp, 0Ch
    lea edx, [esp+4Ch]
    push edx             ; Source
    call near $
    sub_0054DCC0_2 = $-4
    jmp near $
    loc_004E2F89_1 = $-4
    
    .res_mode:
    mov ecx,[ResModeLblPtr]
    push 1
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[ResModeDdbPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+14h]
    mov eax,[esp+10h]
    cmp eax,ebp
    jge .set_ddb
    
    .fix_value:
    mov eax,0
    
    .set_ddb:
    mov ecx,[ResModeDdbPtr]
    push eax
    call near $
    sub_005507E0_3 = $-4
    jmp near $
    loc_004E2F89_9 = $-4
    
    .min_val:
    mov ecx,[MinValLblPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+14h]
    mov ecx,[MinValTxtPtr]
    push 1
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[MinValTxtPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+0D0h]
    mov ecx,[MinValTxtPtr]
    push 00683CE8h
    call near $
    sub_0054DCC0_3 = $-4
    mov eax,[esp+10h]
    lea ecx,[esp+4Ch]
    push 0Ah
    push ecx
    push eax
    call near $
    sub_00620886_3 = $-4
    mov ecx,[MinValTxtPtr]
    add esp, 0Ch
    lea edx,[esp+4Ch]
    push edx
    call near $
    sub_0054DCC0_4 = $-4
    jmp near $
    loc_004E2F89_5 = $-4
    
    .drop_down_box:
    mov ecx,[VarModeTxtPtr]
    push 1
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[VarModeDdbPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+14h]
    mov eax,[esp+10h]
    cmp eax,ebp
    jge .set_ddb2
    
    .fix_value2:
    mov eax,0
    
    .set_ddb2:
    mov ecx,[VarModeDdbPtr]
    push eax
    call near $
    sub_005507E0 = $-4
    jmp near $
    loc_004E2F89_2 = $-4
    
LoadTimer:
    cmp dword[esp+18h],46
    je .drop_down_box
    cmp dword[esp+18h],57
    je .min_val
    cmp dword[esp+18h],39
    je .res_mode
    cmp dword[esp+18h],40
    je .res_mode
    mov ecx, [ebp+0DFCh] ; jumptable 004E42B3 case 12
    mov byte[esp+20h], 0
    call near $
    sub_0054DE40 = $-4
    push eax             ; Str
    call near $
    sub_00614F6B = $-4
    add esp, 4
    mov ecx, ebx
    push eax
    push 0Ch
    call near $
    loc_004380B0_2 = $-4
    jmp near $
    loc_004E47E4 = $-4
    
    .res_mode:
    mov ecx,[ResModeDdbPtr]
    call near $
    sub_00550920_6 = $-4
    mov ecx,[ResModeDdbPtr]
    push eax
    call near $
    sub_005509E0_6 = $-4
    mov ecx,ebx
    push eax
    push 0Ch
    call near $
    loc_004380B0_4 = $-4
    jmp near $
    loc_004E47E4_6 = $-4
    
    .drop_down_box:
    mov ecx,[VarModeDdbPtr]
    call near $
    sub_00550920_1 = $-4
    mov ecx,[VarModeDdbPtr]
    push eax
    call near $
    sub_005509E0_1 = $-4
    mov ecx,ebx
    push eax
    push 0Ch
    call near $
    loc_004380B0_1 = $-4
    jmp near $
    loc_004E47E4_1 = $-4
    
    .min_val:
    mov ecx,[MinValTxtPtr]
    mov byte[esp+20h],0
    call near $
    sub_0054DE40_3 = $-4
    mov edi, eax
    or ecx, -1
    xor eax, eax
    lea edx, [esp+20h]
    repne scasb
    not ecx
    sub edi, ecx
    mov eax, ecx
    mov esi, edi
    mov edi, edx
    shr ecx, 2
    rep movsd
    mov ecx, eax
    and ecx, 3
    rep movsb
    mov ecx,[MinValTxtPtr]
    call near $
    sub_0054DE40_2 = $-4
    push eax
    call near $
    sub_00614F6B_1 = $-4
    add esp, 4
    mov ecx, ebx
    push eax
    push 0Ch
    call near $
    sub_004380B0 = $-4
    jmp near $
    loc_004E47E4_3 = $-4
    
DropDownBoxWidth:
    mov ecx,VarModeDdbPtr
    cmp esi,ecx
    je near $
    loc_004EE0E3 = $-4
    mov ecx,RoomSettingDdbPtr
    cmp esi,ecx
    je near $
    loc_004EE0E3_1 = $-4
    mov ecx,ValModeDdbPtr
    cmp esi,ecx
    je near $
    loc_004EE0E3_2 = $-4
    mov ecx,ResModeDdbPtr
    cmp esi,ecx
    je near $
    loc_004EE0E3_3 = $-4
    mov ecx,VarResModeDdbPtr
    cmp esi,ecx
    je near $
    loc_004EE0EA = $-4
    mov ecx,TechStateDdbPtr
    cmp esi,ecx
    je near $
    loc_004EE0EA_1 = $-4
    lea ecx,[esi+0EC0h]
    jmp near $
    loc_004EE0D8 = $-4
    
DropDownBoxInit:
    mov ebp,VarModeDdbPtr
    cmp esi,ebp
    jne .next
    mov ecx,[ebp]
    push 0
    push 10788
    call near $
    sub_00550870_2 = $-4
    mov ecx,[ebp]
    push 1
    push 10789
    call near $
    sub_00550870_1 = $-4
    mov ecx,[ebp]
    push 2
    push 10790
    call near $
    sub_00550870 = $-4
    jmp near $
    loc_004EEB80 = $-4
    
    .next:
    mov ebp,VarResModeDdbPtr
    cmp esi,ebp
    jne .next1
    mov ecx,[ebp]
    push 0
    push 10792
    call near $
    sub_00550870_3 = $-4
    mov ecx,[ebp]
    push 1
    push 10793
    call near $
    sub_00550870_4 = $-4
    mov ecx,[ebp]
    push 2
    push 10794
    call near $
    sub_00550870_5 = $-4
    mov ecx,[ebp]
    push 3
    push 10795
    call near $
    sub_00550870_6 = $-4
    mov ecx,[ebp]
    push 4
    push 10796
    call near $
    sub_00550870_7 = $-4
    mov ecx,[ebp]
    push 5
    push 10797
    call near $
    sub_00550870_8 = $-4
    mov ecx,[ebp]
    push 6
    push 10798
    call near $
    sub_00550870_9 = $-4
    mov ecx,[ebp]
    push 7
    push 10799
    call near $
    sub_00550870_A = $-4
    jmp near $
    loc_004EEB80_1 = $-4
    
    .next1:
    mov ebp,RoomSettingDdbPtr
    cmp esi,ebp
    jne .next2
    mov ecx,[ebp]
    push 0
    push 9678
    call near $
    sub_00550870_B = $-4
    mov ecx,[ebp]
    push 1
    push 13521
    call near $
    sub_00550870_C = $-4
    mov ecx,[ebp]
    push 2
    push 13523
    call near $
    sub_00550870_D = $-4
    mov ecx,[ebp]
    push 3
    push 13525
    call near $
    sub_00550870_E = $-4
    mov ecx,[ebp]
    push 4
    push 13526
    call near $
    sub_00550870_F = $-4
    mov ecx,[ebp]
    push 5
    push 3125
    call near $
    sub_00550870_10 = $-4
    mov ecx,[ebp]
    push 6
    push 9747
    call near $
    sub_00550870_11 = $-4
    mov ecx,[ebp]
    push 7
    push 13517
    call near $
    sub_00550870_12 = $-4
    mov ecx,[ebp]
    push 8
    push 13522
    call near $
    sub_00550870_13 = $-4
    mov ecx,[ebp]
    push 9
    push 10353
    call near $
    sub_00550870_14 = $-4
    mov ecx,[ebp]
    push 10
    push 3123
    call near $
    sub_00550870_15 = $-4
    mov ecx,[ebp]
    push 11
    push 3124
    call near $
    sub_00550870_16 = $-4
    mov ecx,[ebp]
    push 12
    push 13524
    call near $
    sub_00550870_17 = $-4
    jmp near $
    loc_004EEB80_2 = $-4
    
    .next2:
    mov ebp,TechStateDdbPtr
    cmp esi,ebp
    jne .next3
    mov ecx,[ebp]
    push 0
    push 3127
    call near $
    sub_00550870_18 = $-4
    mov ecx,[ebp]
    push 1
    push 3128
    call near $
    sub_00550870_19 = $-4
    mov ecx,[ebp]
    push 2
    push 3129
    call near $
    sub_00550870_1A = $-4
    mov ecx,[ebp]
    push 3
    push 3130
    call near $
    sub_00550870_1B = $-4
    mov ecx,[ebp]
    push 4
    push 3131
    call near $
    sub_00550870_1C = $-4
    jmp near $
    loc_004EEB80_3 = $-4
    
    .next3:
    mov ebp,ValModeDdbPtr
    cmp esi,ebp
    jne .next4
    mov ecx,[ebp]
    push 0
    push 3148
    call near $
    sub_00550870_1D = $-4
    mov ecx,[ebp]
    push 1
    push 3149
    call near $
    sub_00550870_1E = $-4
    mov ecx,[ebp]
    push 2
    push 3150
    call near $
    sub_00550870_1F = $-4
    jmp near $
    loc_004EEB80_4 = $-4
    
    .next4:
    mov ebp,ResModeDdbPtr
    cmp esi,ebp
    jne .back
    mov ecx,[ebp]
    push 0
    push 10789
    call near $
    sub_00550870_20 = $-4
    mov ecx,[ebp]
    push 1
    push 10788
    call near $
    sub_00550870_21 = $-4
    mov ecx,[ebp]
    push 2
    push 10790
    call near $
    sub_00550870_22 = $-4
    jmp near $
    loc_004EEB80_5 = $-4
    
    .back:
    lea ebp,[edi+0EC0h]
    jmp near $
    loc_004EEB31 = $-4
    
SaveNumber:
    cmp dword[esp+14h],48
    jne .back
    
    .res_mode:
    mov ecx,[VarResModeTxtPtr]
    push 1
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[VarResModeDdbPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+14h]
    mov eax,[esp+10h]
    mov ecx,[VarResModeDdbPtr]
    push eax
    call near $
    sub_005507E0_1 = $-4
    jmp near $
    loc_004E2F89_3 = $-4
    
    .back:
    mov ecx,[esi+0E40h]
    jmp near $
    loc_004E2C97 = $-4
    
LoadNumber:
    cmp dword[esp+18h],48
    jne .back
    
    .res_mode:
    mov ecx,[VarResModeDdbPtr]
    call near $
    sub_00550920_2 = $-4
    mov ecx,[VarResModeDdbPtr]
    push eax
    call near $
    sub_005509E0_2 = $-4
    mov ecx,ebx
    push eax
    push 16h
    call near $
    loc_004380B0 = $-4
    jmp near $
    loc_004E47E4_2 = $-4
    
    .back:
    mov ecx,[ebp+0E44h]
    jmp near $
    loc_004E43B5 = $-4
    
SaveCondTimer:
    cmp dword[esp+24h],27
    je .var_id
    cmp dword[esp+24h],28
    je .var_id
    cmp dword[esp+24h],24
    jne .back
    
    .room_setting:
    mov ecx,[RoomSettingTxtPtr]
    push edi
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[RoomSettingDdbPtr]
    push edi
    mov edx,[ecx]
    call dword[edx+14h]
    mov eax,[esp+10h]
    mov ecx,[RoomSettingDdbPtr]
    push eax
    jmp near $
    loc_004E29E2_1 = $-4
    
    .var_id:
    mov ecx,[VarIDTxt]
    jmp near $
    loc_004E27E2_1 = $-4
    
    .back:
    mov ecx,[esi+0DF8h]
    jmp near $
    loc_004E27E2 = $-4
    
LoadCondTimer:
    cmp dword[esp+14h],24
    jne .back
    
    .room_setting:
    mov ecx,[RoomSettingDdbPtr]
    call near $
    sub_00550920_3 = $-4
    mov ecx,[RoomSettingDdbPtr]
    push eax
    call near $
    sub_005509E0_3 = $-4
    push eax
    push 7
    jmp near $
    loc_004E41EF_1 = $-4
    
    .back:
    mov ecx,[ebp+0DFCh]
    jmp near $
    loc_004E4101 = $-4
    
SaveQuantity:
    cmp dword[esp+14h],48
    je .variable_id
    cmp dword[esp+14h],57
    je .max_val
    cmp dword[esp+14h],59
    jne .back
    
    .val_mode:
    mov ecx,[ValModeLblPtr]
    push 1
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[ValModeDdbPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+14h]
    mov eax,[esp+10h]
    mov ecx,[ValModeDdbPtr]
    push eax
    call near $
    sub_005507E0_2 = $-4
    jmp near $
    loc_004E2F89_8 = $-4
    
    .max_val:
    mov ecx,[MaxValLblPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+14h]
    mov ecx,[MaxValTxtPtr]
    push 1
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[MaxValTxtPtr]
    push 1
    mov edx,[ecx]
    call dword[edx+0D0h]
    mov ecx,[MaxValTxtPtr]
    push 00683CE8h
    call near $
    sub_0054DCC0_5 = $-4
    mov eax,[esp+10h]
    lea ecx,[esp+4Ch]
    push 0Ah
    push ecx
    push eax
    call near $
    sub_00620886_4 = $-4
    mov ecx,[MaxValTxtPtr]
    add esp, 0Ch
    lea edx,[esp+4Ch]
    push edx
    call near $
    sub_0054DCC0_6 = $-4
    jmp near $
    loc_004E2F89_7 = $-4
    
    .variable_id:
    mov ecx,[VarIDTxt2]
    jmp near $
    loc_004E2B74 = $-4
    
    .back:
    mov ecx,[esi+0E38h]
    jmp near $
    loc_004E2B74_1 = $-4
    
LoadQuantity: ;004E2B6E
    cmp dword[esp+18h],57
    je .max_val
    cmp dword[esp+18h],59
    jne .back
    
    .val_mode:
    mov ecx,[ValModeDdbPtr]
    call near $
    sub_00550920_5 = $-4
    mov ecx,[ValModeDdbPtr]
    push eax
    call near $
    sub_005509E0_5 = $-4
    mov ecx,ebx
    push eax
    push 1
    call near $
    loc_004380B0_3 = $-4
    jmp near $
    loc_004E47E4_5 = $-4
    
    .max_val:
    mov ecx,[MaxValTxtPtr]
    mov byte[esp+20h],0
    call near $
    sub_0054DE40_5 = $-4
    mov edi, eax
    or ecx, -1
    xor eax, eax
    lea edx, [esp+20h]
    repne scasb
    not ecx
    sub edi, ecx
    mov eax, ecx
    mov esi, edi
    mov edi, edx
    shr ecx, 2
    rep movsd
    mov ecx, eax
    and ecx, 3
    rep movsb
    mov ecx,[MaxValTxtPtr]
    call near $
    sub_0054DE40_4 = $-4
    push eax
    call near $
    sub_00614F6B_2 = $-4
    add esp, 4
    mov ecx, ebx
    push eax
    push 1
    call near $
    sub_004380B0_1 = $-4
    jmp near $
    loc_004E47E4_4 = $-4
    
    .back:
    mov ecx,[ebp+0E3Ch]
    jmp near $
    loc_004E42E6 = $-4
    
SaveVars:

    push 1024
    push Vars
    push esi
    stdcall near $
    sub_00542AA0 = $-4
    add esp,12
    mov ecx,[006B3518h]
    jmp near $
    loc_004A601C = $-4
    
LoadVars:

    stdcall near $
    sub_00542850 = $-4
    ;add esp,12
    push 1024
    push Vars
    push ebx
    stdcall near $
    sub_00542850_1 = $-4
    add esp,36
    jmp near $
    loc_004A5DE9 = $-4
    
TriggerCondLoadFix:
    cmp dword[esp+14h],19h
    je .trigger_field
    cmp dword[esp+14h],29
    je .tech_state
    cmp dword[esp+14h],13h
    jmp near $
    loc_004E3FEF = $-4
    
    .trigger_field:
    mov ecx,[ebp+0E6Ch]
    call near $
    sub_00550920 = $-4
    mov ecx,[ebp+0E6Ch]
    push eax
    call near $
    sub_005509E0 = $-4
    push eax
    push 0
    jmp near $
    loc_004E41EF = $-4
    
    .tech_state:
    mov ecx,[TechStateDdbPtr]
    call near $
    sub_00550920_4 = $-4
    mov ecx,[TechStateDdbPtr]
    push eax
    call near $
    sub_005509E0_4 = $-4
    push eax
    push 0
    jmp near $
    loc_004E41EF_2 = $-4
    
TriggerCondSaveFix:
    cmp dword[esp+24h],19h
    je .trigger_field
    cmp dword[esp+24h],29
    je .tech_state
    cmp dword[esp+24h],20
    je .civilization
    cmp dword[esp+24h],13h
    jmp near $
    loc_004E2581 = $-4
    
    .civilization:
    mov ecx,[CivIDTxt]
    jmp near $
    loc_004E25B9 = $-4
    
    .trigger_field:
    push -1
    mov ecx,esi
    call near $
    sub_004E1B80 = $-4
    mov ecx,[esi+0E6Ch]
    push 0
    call near $
    sub_00550740 = $-4
    mov ecx,[esi+0E68h]
    push edi
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[esi+0E6Ch]
    push edi
    mov edx,[ecx]
    call dword[edx+14h]
    mov eax,[esp+10h]
    mov ecx,[esi+0E6Ch]
    push eax
    jmp near $
    loc_004E29E2 = $-4
    
    .tech_state:
    mov ecx,[TechStateTxtPtr]
    push edi
    mov eax,[ecx]
    call dword[eax+14h]
    mov ecx,[TechStateDdbPtr]
    push edi
    mov edx,[ecx]
    call dword[edx+14h]
    mov eax,[esp+10h]
    mov ecx,[TechStateDdbPtr]
    push eax
    jmp near $
    loc_004E29E2_2 = $-4
    
SaveType10Attr: ;007DA9AA
    call near $
    sub_00542AA0_1 = $-4
    lea ecx,[esi+54h]
    push 2
    push ecx
    push edi
    call near $
    sub_00542AA0_2 = $-4
    add esp,0Ch
    lea ecx,[esi+0ACh]
    push 4
    push ecx
    push edi
    call near $
    sub_00542AA0_3 = $-4
    add esp,0Ch
    lea ecx,[esi+90h]
    push 3
    push ecx
    push edi
    call near $
    sub_00542AA0_4 = $-4
    add esp,0Ch
    jmp near $
    loc_007DA9AF = $-4

LoadType10Attr: ;007DA9FC
    lea ecx,[esi+54h]
    push 2
    push ecx
    push ebp
    call near $
    sub_00542850_2 = $-4
    add esp,0Ch
    lea ecx,[esi+0ACh]
    push 4
    push ecx
    push ebp
    call near $
    sub_00542850_3 = $-4
    add esp,0Ch
    lea ecx,[esi+90h]
    push 3
    push ecx
    push ebp
    call near $
    sub_00542850_4 = $-4
    add esp,0Ch
    lea ecx,[esi+50h]
    push 2
    jmp near $
    loc_007DAA01 = $-4
    
SaveType70Attr: ;007DA8AE
    call near $
    sub_00542AA0_5 = $-4
    lea ecx,[ebx+1B0h]
    push 5
    push ecx
    push edi
    call near $
    sub_00542AA0_6 = $-4
    add esp,0Ch
    lea ecx,[ebx+10Ch]
    push 4
    push ecx
    push edi
    call near $
    sub_00542AA0_7 = $-4
    add esp,0Ch
    lea ecx,[ebx+110h]
    push 1
    push ecx
    push edi
    call near $
    sub_00542AA0_8 = $-4
    add esp,0Ch
    jmp near $
    loc_007DA8B3 = $-4
    
LoadType70Attr: ;007DA92E
    lea ecx,[esi+1B0h]
    push 5
    push ecx
    push ebx
    call near $
    sub_00542850_5 = $-4
    add esp,0Ch
    lea ecx,[esi+10Ch]
    push 4
    push ecx
    push ebx
    call near $
    sub_00542850_6 = $-4
    add esp,0Ch
    lea ecx,[esi+110h]
    push 1
    push ecx
    push ebx
    call near $
    sub_00542850_7 = $-4
    add esp,0Ch

    .back:
    lea ecx,[edi+6]
    push 2
    jmp near $
    loc_007DA933 = $-4
    
SaveType80Attr: ;007DA80C
    call near $
    sub_00542AA0_9 = $-4
    push ebx
    mov ebx,esi
    sub ebx,1CAh
    lea ecx,[ebx+1D4h]
    push 2
    push ecx
    push ebx
    call near $
    sub_00542AA0_A = $-4
    add esp,0Ch
    pop ebx
    jmp near $
    loc_007DA811 = $-4
    
LoadType80Attr: ;007DA863
    push ebx
    mov ebx,esi
    sub ebx,1CAh
    lea ecx,[ebx+1D4h]
    push 2
    push ecx
    push ebx
    call near $
    sub_00542850_8 = $-4
    add esp,0Ch
    pop ebx
    .back:
    add esi,3Eh
    push 1
    jmp near $
    loc_007DA868 = $-4
    
load_str:
    
    call near $
    loc_005E4750 = $-4
    cmp    byte[eax],0
    jne    .jmpback
    push edi
    push esi
    push ebx
    push dword[_langHandle]
    stdcall near $
    loc_0058E820 = $-4
    
    .jmpback:
    jmp near $
    loc_0043CF51 = $-4
    
EyeCandyAttrJmp: ;007DAA63+3 ;007DAA4F+2
    dd 0x007DAA6A
    dd 0x007DAA70
    dd 0x007DAA76
    dd 0x007DAA7E
    dd 0x007DAA84
    dd 0x007DAA8C
    dd 0x007DAA94
    dd 0x007DAA9D
    dd SetAttribute.Icon
    dd SetAttribute.ResMode
    dd SetAttribute.LangHotkey
    
SetAttribute: 
    .Icon:
    mov  [esi+54h],ax
    pop esi
    retn 8
    
    .ResMode:
    push edi
    mov edx,eax
    shr edx,6
    and eax,3Fh
    lea edi,[esi+72h]
    xor ecx,ecx
    
    .loop:
    cmp word[edi],dx
    je .apply
    add edi,2
    inc ecx
    cmp ecx,3
    jl .loop
    jmp .back
    
    .apply:
    lea edi,[esi+ecx+90h]
    mov byte[edi],al
    
    .back:
    pop edi
    pop esi
    retn 8
    
    .LangHotkey:
    mov  [esi+0ACh],eax
    pop esi
    retn 8
    
;--------------------------------------------------

proc memcpy c destination,source,num

    mov    ecx,dword[num]
    jecxz    .end
    push    esi edi
    mov    esi,dword[source] 
    mov    edi,dword[destination]
    mov    edx,ecx
    shr    ecx,2
    rep    movsd
    mov    ecx,edx
    and ecx,3
    rep    movsb
    pop    edi esi
    .end:
    mov    eax,dword[destination]
    ret
endp

proc strrchr c str,character

    push    edi
    mov    edi,dword[str]
    or    ecx,-1
    xor    eax,eax
    repne    scasb
    not    ecx
    dec    edi
    xor    edx,edx
    mov    al,byte[character]
    std
    repne    scasb
    cld
    sete    dl
    neg    edx
    lea    eax,[edi+1]
    and eax,edx
    pop    edi
    ret
endp

;--------------------------------------------------

proc PatchCodeCave hProcess,lpBaseAddress,lpDestProc,nSize

    push    ebx esi edi
    mov    ebx,dword[nSize]
    xor    eax,eax
    cmp    ebx,5
    jb    .end
    mov    esi,dword[lpBaseAddress]
    mov    edi,dword[hProcess]
    lea    eax,[nSize]
    mov    byte[eax],0xE9
    stdcall PatchData,edi,esi,eax,1
    test    eax,eax
    jz    .end
    inc    esi
    stdcall PatchAddress,edi,esi,dword[lpDestProc],1
    test    eax,eax
    jz    .end
    sub    ebx,5
    jz    .end
    add    esi,4
    mov    byte[nSize],0x90
    .loop:
    lea    eax,[nSize]
    stdcall PatchData,edi,esi,eax,1
    test    eax,eax
    jz    .end
    inc    esi
    dec    ebx
    jnz    .loop
    .end:
    pop    edi esi ebx
    ret
endp

proc PatchAddress hProcess,lpBaseAddress,lpDestAddress,bRelAddr

    push    ebx
    mov    eax,dword[lpBaseAddress]
    lea    ecx,[eax+4]
    lea    edx,[lpDestAddress]
    neg    dword[bRelAddr]
    sbb    ebx,ebx
    and ecx,ebx
    sub    dword[edx],ecx
    stdcall PatchData,dword[hProcess],eax,edx,4
    pop    ebx
    ret
endp

proc PatchData hProcess,lpBaseAddress,lpBuffer,nSize

    stdcall [WriteProcessMemory],dword[hProcess],dword[lpBaseAddress],dword[lpBuffer],dword[nSize],0
    test    eax,eax
    setnz    cl
    movzx    eax,cl
    ret
endp

;==================================================
section '.data'
;==================================================

_cap                                db 'Error',0
_msg2                                db 'Failed to load required library "triggers_aux.dll".',0ah,'Make sure you have installed the Extended Triggers Patch correctly.',0

;REAL STRINGS FOR UP TRIGGERS
TrigStrings0                            db 0x22
TrigStrings0a                        db 0x8B,0x8F,0xF4,0x0D,0x00,0x00

;ENABLE BETA FIELDS IN EDITOR
TrigBetaFields0                            db 0x01
TrigBetaFields0a                        db 0x38,0x02,0x00,0x00
TrigBetaFields0b                        db 0x38,0x02,0x00,0x00
TrigBetaFields0c                        db 0x0A
TrigBetaFields0d                        db 0x0A
TrigBetaFields0e                        db 0x5A
TrigBetaFields0f                        db 0xEB
TrigBetaFields0g                        db 0xEB

NewTriggers0                         db 0x00,0x00,0x00,0x00
NewTriggers0a                        db 0xF0 ; Allocated Memory for Effect Panels
NewTriggers0b                        db 0x3B ; Max Effect ID
NewTriggers0c                        db 0x00,0x00,0x00,0x00
NewTriggers0d                        db 0x3C ; Effect String Amount
NewTriggers0e                        db 0xF0 ; Allocated Memory for Effect Panels
NewTriggers0f                        db 0x05
NewTriggers0g                        db 0xF0,0xE0

NewTriggers1a                        db 0x78
NewTriggers1b                        db 0x1C
NewTriggers1c                        db 0x00,0x00,0x00,0x00
NewTriggers1d                        db 0x1E
NewTriggers1e                        db 0x78
NewTriggers1k                        db 0x70,0xD4
NewTriggers1f                        db 0x8B,0x8F,0xEC,0x0D,0x00,0x00

TechAttr0                            db 0x3C

SaveGameExtPatch0                         db '.gpz',0
SaveGameExtPatch1                         db '.mpz',0

Vars                                db 256*4 dup 0x00

VarNumber                           dd 100h

mode_read                           db 'r+b',0
mode_write                          db 'wb',0

effect_format                       db ' : %d',0

str_format                          db 'Games\\Age of Chivalry\\Scenario\\%s.bpvar',0
str_format2                         db '%sScenario\\%s.bpvar',0
str_format3                         db 'Scenario\\%s.bpvar',0

_trigDll db '\triggers_aux.dll',0

_funcname1 db 'stringParser',0

_trigDir rb MAX_PATH
_langHandle dd 0

VarModeTxtPtr                       dd 0
VarModeDdbPtr                       dd 0
VarResModeDdbPtr                    dd 0
VarResModeTxtPtr                    dd 0
RoomSettingDdbPtr                   dd 0
RoomSettingTxtPtr                   dd 0
TechStateDdbPtr                     dd 0
TechStateTxtPtr                     dd 0
VarIDTxt                            dd 0
VarIDTxt2                           dd 0
CivIDTxt                            dd 0
MinValLblPtr                        dd 0
MinValTxtPtr                        dd 0
MaxValLblPtr                        dd 0
MaxValTxtPtr                        dd 0
ValModeDdbPtr                       dd 0
ValModeLblPtr                       dd 0
ResModeLblPtr                       dd 0
ResModeDdbPtr                       dd 0

FileVarNumber rb 2
FileVer rb 4

VarFileVer dd 1.10

SpeedDivider dd 10.00

constFloat1000 dd 1000.00
constFloat5 dd 5.00