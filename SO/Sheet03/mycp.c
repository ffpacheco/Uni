#include <stdlib.h>
#include <stdio.h>

#define BUFFER_SIZE 1024

int main(int argc, char* argv[]) {
	FILE* fileOriginal = fopen(argv[1], "r");
	FILE* fileCopy= fopen(argv[2], "w");
	char buffer[BUFFER_SIZE];
	int nchars = fread(buffer, sizeof(char), BUFFER_SIZE, fileOriginal);
	while (nchars > 0) {
		fwrite(buffer, sizeof(char), nchars, fileCopy);
		nchars = fread(buffer, sizeof(char), BUFFER_SIZE, fileOriginal);
	}

	fclose(fileOriginal);
	fclose(fileCopy);
	exit(EXIT_SUCCESS);
}

