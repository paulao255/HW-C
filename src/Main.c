/*************************/
/* Library importations: */
/*************************/

#include <stdio.h>

/**************/
/* Functions: */
/**************/

extern signed int main(const signed int argc, const char *const *const argv)
{
	if(argc == 1)
	{
		fprintf(stdout, "Hello, world from %s in line %d of %s with %d argument!\n", argv[0], __LINE__, __FILE__, argc);
	}

	else
	{
		fprintf(stdout, "Hello, world from %s in line %d of %s with %d arguments!\n", argv[0], __LINE__, __FILE__, argc);
	}

	(void)argc;
	(void)argv;

	return 0;
}
