%{
	#include<stdio.h>
%}
%%
[0-9] printf("digit %s\n", yytext);
[a-z] printf("letter %s\n", yytext);
%%
int yywrap()
{
	return 1;
}
int main()
{
	yylex();
	return 0;
}
