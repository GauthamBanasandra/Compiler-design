%{
	#include"y.tab.h"
%}
%%
[a-zA-Z] return LETTER;
[0-9] return DIGIT;
%%
int yywrap()
{
	return 1;
}
