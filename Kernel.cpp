#include "TextPrint.cpp"
extern "C" void _start() {
    int* ptr = (int*)0xb8000;
    *ptr = 0x50505050;
    SetCursorPosition(PositionFromCoords(12, 18));
    return;
}