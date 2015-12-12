%{
	#include<stdio.h>
%}
%%
. printf("%c - %d\n", yytext[0], yytext[0]);
[\0-\40]	{
			switch(yytext[0])
			{
				case 0:
					printf("<null> - %d\n", yytext[0]);
					break;
				case 7:
					printf("<bel> - %d\n", yytext[0]);
					break;
				case 8:
					printf("<bs> - %d\n", yytext[0]);
					break;
				case 9:
					printf("<ht> - %d\n", yytext[0]);
					break;	
				case 10:
					printf("<nl> - %d\n", yytext[0]);
					break;			
				case 040:
					printf("<sp> - %d\n", yytext[0]);
					break;
				default:
					printf("%c - %d\n", yytext[0], yytext[0]);
			}
		}
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
		return 1;
	}
	yylex();
	fclose(f);
	
	return 0;
}