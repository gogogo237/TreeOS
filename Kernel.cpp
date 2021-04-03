#include "TextPrint.cpp"
extern "C" void _start() {
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString("Hello World!\n\rThis is a new line\n\r", BACKGROUND_BLINKINGRED | FOREGROUND_CYAN);
    PrintString(HexToString(0x1234abcd));
    PrintString("\n\r");
    PrintString(HexToString("HI"));
    ClearScreen(BACKGROUND_BLUE | FOREGROUND_WHITE);
    PrintString(HexToString(test));
    return;
}