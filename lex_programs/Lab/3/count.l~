%{
	#include<stdio.h>
	int word=0, space=0, line=0, char_=0;
%}
%%
[a-zA-Z]+ {++word; char_+=strlen(yytext);}
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
	FILE *f=fopen("input.txt", "r");
	if(!(yyin=f))
	{
		printf("file not found\n");
		return 1;	
	}
	yylex();
	printf("chars=%d\nwords=%d\nlines=%d\nspaces=%d\n", char_, word, line, space);
	fclose(f);
	return 0;
}
