#include "TextPrint.cpp"
#include "IDT.cpp"

extern "C" void _start() {      //0x8b86
    SetCursorPosition(PositionFromCoords(0, 0)); //PositionFromCoords 0x893a SetCursorPosition 0x88c0
    InitializeIDT();                             //InitializeIDT 0x8a5a
    return;
}
