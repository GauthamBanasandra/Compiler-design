%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
%}
%token LETTER DIGIT
%%
S : LETTER A
	;
A : LETTER A
	| DIGIT A
	|
	;
%%
int yyerror(char* s)
{
	printf("%s\n", s);
	exit(1);
}
int main()
{
	printf("%s\n", yyparse()?"invalid id":"valid id");
	return 0;
}
