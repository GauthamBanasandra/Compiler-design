%{
	#include "y.tab.h"
%}
%%
a return A;
b return B;
. yyerror(yytext);
%%
int yywrap()
{
	return 1;
}
