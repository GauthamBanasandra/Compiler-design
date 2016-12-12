%{
	#include<stdio.h>
%}
%%
[0-7]+	{
			int i=0, dec=0;
			for(i=0; i<yyleng; dec+=pow_8(yyleng-i-1)*(yytext[i++]-'0'));
			printf("%d\n", dec);
		}
%%
int yywrap()
{
	return 1;
}
int pow_8(int i)
{
	int p=1;
	
	while(i--)
		p*=8;

	return p;
}
int main()
{
	yylex();
	return 0;
}
