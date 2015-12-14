%{
	#include <stdlib.h>
	#include "y.tab.h"
%}
%%
[0-9]+ {yylval=atoi(yytext); return INTEGER;}
-/[0-9] {yylval='-'; return UMINUS;}
[-+*()/] return *yytext;
. yyerror(yytext);
%%
int yywrap()
{
	return 1;
}
