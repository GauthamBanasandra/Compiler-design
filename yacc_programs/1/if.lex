%{
	#include "y.tab.h"
	int in=0, level=0;
%}
%%
if {in=1; return IF;}
"("[a-z]")" return COND;
"{" {++level; return OB;}
"}" {--level; return CB;}
. if(level==0) yyerror(yytext);
\n|\t ;
%%
int yywrap()
{
	return 1;
}
