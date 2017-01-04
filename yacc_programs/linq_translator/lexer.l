%{
    #include "y.tab.h"
    #include "symtab.h"
    #include <stdlib.h>
%}
%%
select  {return SELECT;}
from    {return FROM;}
where   {return WHERE;}
[a-zA-Z*]+  {yylval.symp=symlook(yytext); return CLAUSE;}
[a-zA-Z.<=>!0-9]+   {return COND;}
";" {return 0;}
%%
struct symtab* symlook(char* s)
{
    char* p;
    struct symtab *sp;
    int yyerror(char *);

    for(sp=symtab; sp<&symtab[NSYMS]; sp++)
    {
        if(sp->name && !strcmp(sp->name, s))
            return sp;
        if(!sp->name)
        {
            sp->name=strdup(s);
            return sp;
        }
    }

    yyerror("too many symbols");
    exit(1);
}