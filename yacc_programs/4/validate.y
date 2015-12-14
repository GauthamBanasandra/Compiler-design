%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%token DIGITS
%%
E : E '+' E
	| E '-' E
	| E '*' E
	| E '/' E
	| '(' E ')'
	| '-' E
	| DIGITS
	;
%%
int yyerror(char *s)
{
	if(strcmp(s, "syntax error"))
		printf("invalid char %s\n", s);
	else
		printf("%s\n", s);
	exit(1);
}
int main()
{
	printf("%s\n", yyparse()?"invalid expr":"valid expr");
	return 0;
}
