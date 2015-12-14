%{
	#include "y.tab.h"
%}
%%
[0-9]+ return DIGITS;
[-+*()/] return *yytext;
. yyerror(yytext);
%%
int yywrap()
{
	return 1;
}
