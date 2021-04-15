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
    void* TestMemoryAddress = malloc(0x10);
    void* TestMemoryAddress2 = malloc(0x10);
    void* TestMemoryAddress3 = malloc(0x10);

    PrintString(HexToString((uint_64)TestMemoryAddress));
    PrintString("\n\r");
    PrintString(HexToString((uint_64)TestMemoryAddress2));
    PrintString("\n\r");
    PrintString(HexToString((uint_64)TestMemoryAddress3));

    return;
}
