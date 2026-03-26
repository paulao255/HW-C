/* Importations: */
#include <stdio.h>


/* Main code: */
int main(const int argc, const char *const *const argv)
{
	fprintf(stdout, "Hello, world from %s in line %d with %d arguments!\n", *argv, __LINE__, argc);

	return 0;
}
