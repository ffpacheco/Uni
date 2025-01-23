#include <stdio.h>
#include <stdlib.h>


#define BUFFER_SIZE 1024
int main(int argc, char* argv[]) {
	for (int i =0; i<argc;i++){
	FILE* file = fopen(argv[1+i], "r");
	if ( file == NULL ) {
		exit(EXIT_FAILURE);
	}	

	char buffer[BUFFER_SIZE];
	int nchars = fread(buffer, sizeof(char), BUFFER_SIZE, file);
	while (nchars > 0) {
		fwrite(buffer, sizeof(char), nchars, stdout);
		nchars = fread(buffer, sizeof(char), BUFFER_SIZE, file);
	}
	fclose(file);
	}
	exit(EXIT_SUCCESS);
	
}
