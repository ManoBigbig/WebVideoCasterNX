#include <switch.h>

int main(int argc, char* argv[])
{
    while (appletMainLoop())
    {
        svcSleepThread(1000000000LL);
    }

    return 0;
}
