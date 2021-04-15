#include "TextPrint.h"
#include "IDT.h"
#include "Keyboard.h"
#include "MemoryMap.h"
#include "Heap.h"

extern "C" void _start() {      //0x8b86
    SetCursorPosition(PositionFromCoords(0, 0)); //PositionFromCoords 0x893a SetCursorPosition 0x88c0
    InitializeIDT();                             //InitializeIDT 0x8a5a
    MainKeyboardHandler = KeyboardHandler;

    MemoryMapEntry** usableRegionMaps = GetUsableMemoryRegions();

    InitializeHeap(0x100000, 0x100000);

    uint_64* TestAddress = (uint_64*)aligned_alloc(0x4000, 0x10);
    PrintString(HexToString((uint_64)TestAddress));
    PrintString("\n\r");
    //free(TestAddress);

    uint_64* TestAddress2 = (uint_64*)malloc(0x4000);
    PrintString(HexToString((uint_64)TestAddress2));
    PrintString("\n\r");

    return;
}
