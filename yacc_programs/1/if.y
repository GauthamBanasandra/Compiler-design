%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	int count=0;
%}
%token IF COND OB CB
%%
S : IF_STAT {printf("nesting=%d\n", count);}
	;
IF_STAT: IF_STAT A
	| IF COND OB IF_STAT CB {++count;}
	|
	;
A : A IF_STAT {--count;}
	|
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
	if(yyparse())
		printf("invalid\n");
	return 0;
}
