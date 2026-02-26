/* Importations: */
#include <stdio.h>


/* Main code: */
int main(int argc, char **argv)
{
	printf("Hello, World from %s in line %d!\n", *(argv), __LINE__);

	return 0;
}
