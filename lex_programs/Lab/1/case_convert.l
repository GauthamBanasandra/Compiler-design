%{
	#include<stdio.h>
%}
%%
[a-z] {yytext[0]-=32; ECHO;}
%%
int yywrap()
{
	return 1;
}

int main()
{
	(yyin=fopen("input.txt", "r"))?yylex(), fclose(yyin):printf("file not found\n");
	return 0;
}
