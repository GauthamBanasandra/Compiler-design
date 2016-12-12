%{
	#include<stdio.h>
	int count=0, in=0;
%}
%%
"//".*	++count;
"/*"	in=1;
"*/"	{in=0; ++count;}
.	if(!in) ECHO;
%%
int yywrap()
{
	return 1;
}
int main()
{
	yyout=fopen("output.c", "w");
	(yyin=fopen("input.c", "r"))?yylex(), fprintf(yyout, "//comments=%d\n", count), fclose(yyin):printf("file not found\n");
	fclose(yyout);
	return 0;
}
