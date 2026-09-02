#include <switch.h>
#include <cstdio>

int main(int argc, char* argv[])
{
    consoleInit(NULL);

    printf("WebVideoCasterNX\n");
    printf("================\n\n");
    printf("Receiver iniciado!\n");
    printf("Build 0.1 - teste inicial\n\n");
    printf("O homebrew esta funcionando.\n");

    while (appletMainLoop())
    {
        consoleUpdate(NULL);
    }

    consoleExit(NULL);
    return 0;
}
