%{
	#include<stdio.h>
	int word=0, space=0, line=0, char_=0;
%}
%%
[a-zA-Z]+ {++word; char_+=yyleng;}
\n ++line;
[ \t] ++space;
. ;
%%
int yywrap()
{
	return 1;
}

int main()
{
	(yyin=fopen("input.txt", "r"))?yylex(), printf("chars=%d\nwords=%d\nlines=%d\nspaces=%d\n", char_, word, line, space), fclose(yyin):printf("file not found\n");
	return 0;
}
