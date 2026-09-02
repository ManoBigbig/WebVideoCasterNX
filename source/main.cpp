#include <switch.h>
#include <cstdio>
#include <cstring>

static void drawLine(const char* text, int y)
{
    printf("\x1b[%d;2H%s", y, text);
}

int main(int argc, char* argv[])
{
    consoleInit(NULL);

    Result rc = nifmInitialize(NifmServiceType_User);
    bool networkReady = R_SUCCEEDED(rc);

    drawLine("WebVideoCasterNX v0.1", 2);
    drawLine("-----------------------", 3);
    drawLine("Native Web Video Caster receiver", 5);
    drawLine("", 6);
    drawLine(networkReady ? "Network service: OK" : "Network service: ERROR", 8);
    drawLine("", 9);
    drawLine("Status: WAITING FOR WVC", 11);
    drawLine("", 12);
    drawLine("This build is only the receiver/network test.", 14);
    drawLine("Protocol discovery and media playback come next.", 15);
    drawLine("", 17);
    drawLine("Press + to exit.", 19);

    while (appletMainLoop())
    {
        hidScanInput();
        u64 kDown = hidKeysDown(CONTROLLER_P1_AUTO);

        if (kDown & KEY_PLUS)
            break;

        consoleUpdate(NULL);
    }

    if (networkReady)
        nifmExit();

    consoleExit(NULL);
    return 0;
}
