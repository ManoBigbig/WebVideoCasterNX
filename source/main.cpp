#include <switch.h>

int main(int argc, char* argv[])
{
    consoleInit(NULL);

    printf("WebVideoCasterNX\n");
    printf("================\n\n");
    printf("Receiver iniciado.\n");
    printf("Aguardando conexao...\n\n");
    printf("Pressione + para sair.\n");

    while (appletMainLoop())
    {
        consoleUpdate(NULL);

        if (hidKeysDown(CONTROLLER_P1_AUTO) & KEY_PLUS)
            break;
    }

    consoleExit(NULL);
    return 0;
}
