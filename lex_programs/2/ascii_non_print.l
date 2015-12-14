%{
	#include<stdio.h>
%}
%%
[^\41-\176]	{
			switch(*yytext)
			{
				case 0:
					printf("<null> - %d\n", *yytext);
					break;
				case 7:
					printf("<bel> - %d\n", *yytext);
					break;
				case 8:
					printf("<bs> - %d\n", *yytext);
					break;
				case 9:
					printf("<ht> - %d\n", *yytext);
					break;	
				case 10:
					printf("<nl> - %d\n", *yytext);
					break;			
				case 040:
					printf("<sp> - %d\n", *yytext);
					break;
				default:
					printf("%c - %d\n", *yytext, *yytext);
			}
		}
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
