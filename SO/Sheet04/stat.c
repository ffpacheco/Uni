#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(int argc, char* argv[]) {
        struct stat info;
        if (argc < 2) {
                fprintf(stderr, "usage: %s file\n", argv[0]);
                exit(EXIT_FAILURE);
        }
        int x = 1;
        while (x < argc){
                int retv = stat(argv[x], &info);
                if (retv == -1) {
                        fprintf(stderr, "fsize: Can’t stat %s\n", argv[x]);
                        exit(EXIT_FAILURE);
                }
                printf("%s size: %d bytes, disk_blocks: %d\n, user_id %d\n, latest_alteration %s\n " ,argv[x], (int)info.st_size, (int)info.st_blocks,(int)info.st_uid, ctime(&info.st_mtime));

                x++;
        }

        exit(EXIT_SUCCESS);
}
