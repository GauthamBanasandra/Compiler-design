#define NSYMS 20

struct symtab
{
    char* name;
} symtab[NSYMS];

struct symtab* symlook();