#include "TextPrint.cpp"
#include "IDT.cpp"
#include "Keyboard.cpp"
#include "MemoryMap.cpp"

extern "C" void _start() {      //0x8b86
    SetCursorPosition(PositionFromCoords(0, 0)); //PositionFromCoords 0x893a SetCursorPosition 0x88c0
    InitializeIDT();                             //InitializeIDT 0x8a5a
    
    MainKeyboardHandler = KeyboardHandler;

    PrintString(IntegerToString(-500));

    float testFloat = -678.669f;

    SetCursorPosition(PositionFromCoords(0, 1));
    PrintString(FloatToString(testFloat, 10));

    SetCursorPosition(PositionFromCoords(0, 3));
    PrintString(IntegerToString(MemoryRegionCount));

    return;
}
