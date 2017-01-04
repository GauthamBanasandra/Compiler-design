%{
    #include "y.tab.h"
    #include "symtab.h"
    #include <math.h>

    extern double vbltable[26];
%}
%%
[0-9]+  {yylval.dval=atof(yytext); return NUMBER;}
[ \t]   ;
"$" {return 0;}
[A-Za-z][A-Za-z0-9]*   {yylval.symp=symlook(yytext); return NAME;}
\n  {return 0;}
.   {return yytext[0];}
%%