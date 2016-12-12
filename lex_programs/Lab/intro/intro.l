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
	FILE *f=fopen("input.txt", "r");
	if(!(yyin=f))
	{
		printf("invalid file\n");
		return -1;
	}
	yylex();
	fclose(f);
	return 0;
}
