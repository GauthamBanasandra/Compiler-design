%{
    #include "y.tab.h"
    #include <math.h>
    extern double vbltable[26];
%}
%%
[0-9]+  {yylval.dval=atof(yytext); return NUMBER;}
[ \t]   ;
"$" {return 0;}
[a-z]   {yylval.vblno=yytext[0]-'a'; return NAME;}
\n  {return 0;}
.   {return yytext[0];}
%%