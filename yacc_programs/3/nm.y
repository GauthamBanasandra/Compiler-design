%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%token A B
%%
S : term1 term2
	;
term1 : A term1
	| A
	;
term2 : B term2
	|
	;
%%
int yyerror(char *s)
{
	printf("invalid char %s\n", s);
	exit(1);
}
int main()
{
	printf("%s\n", yyparse()?"doesn't belong to G":"belongs to G");
	return 0;
}
