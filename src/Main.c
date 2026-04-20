/* Importations: */
#include <stdio.h>


/* Main code: */
int main(const signed int argc, const char *const *const argv)
{
	const unsigned char *const *const uargv = (const unsigned char *const *const)argv;

	fprintf(stdout, "Hello, world from %s in line %d with %d arguments!\n", *uargv, __LINE__, argc);

	return 0;
}
