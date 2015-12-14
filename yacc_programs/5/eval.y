%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%token INTEGER
%left '+' '-'
%left '*'
%left '/'
%left '(' ')'
%right UMINUS
%%
S : E {printf("%d\n", $1);}
	;
E : E '+' E {$$=$1+$3;}
	| E '-' E {$$=$1-$3;}
	| E '*' E {$$=$1*$3;}
	| E '/' E {$$=$1/$3;}
	| '(' E ')' {$$=$2;}
	| UMINUS E {$$=-1*$2;}
	| INTEGER {$$=$1;}
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
