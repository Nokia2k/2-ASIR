#include <unistd.h>
#include <stdio.h>

int main (int argc, const char* argv[]) {
    setuid(0);
    char* arg_tupu[] = {"systemctl", "stop", argv[1], NULL };
    execv("/usr/bin/systemctl", arg_tupu);
    
    return 0;
}
