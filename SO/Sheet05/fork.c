#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
int main(int argc, char* argv[]) {
fork();
fork();
fork();
printf("%d\n", getpid());
exit(EXIT_SUCCESS);
}
