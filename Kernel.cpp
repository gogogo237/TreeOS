#include "TextPrint.h"
#include "IDT.h"
#include "Keyboard.h"
#include "MemoryMap.h"

extern "C" void _start() {      //0x8b86
    SetCursorPosition(PositionFromCoords(0, 0)); //PositionFromCoords 0x893a SetCursorPosition 0x88c0
    InitializeIDT();                             //InitializeIDT 0x8a5a
    MainKeyboardHandler = KeyboardHandler;

    MemoryMapEntry** usableRegionMaps = GetUsableMemoryRegions();

    for (uint_8 i = 0; i < UsableMemoryRegionCount; i++) {
        MemoryMapEntry* memMap = usableRegionMaps[i];
        PrintMemoryMap(memMap, CursorPosition);
    }

    return;
}
