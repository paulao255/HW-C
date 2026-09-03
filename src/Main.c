/*************************/
/* Library importations: */
/*************************/

#include <stdio.h>

/**************/
/* Functions: */
/**************/

extern signed int main(const signed int argc, const char *const *const argv)
{
	fprintf(stdout, "Hello, world from %s in line %d of %s with %d argument(s)!\n", argv[0], __LINE__, __FILE__, argc);

	return 0;
}
