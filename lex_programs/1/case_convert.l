%{
	#include<stdio.h>
%}
%%
[a-z] {printf("%c", yytext[0]-32);}
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
		printf("file not found\n");
		return -1;
	}
	yylex();
	fclose(f);
	
	return 0;
}
