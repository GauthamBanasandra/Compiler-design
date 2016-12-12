%{
/*
* This is the declaration section.
* Anything written here will go directly to the lexer program.
* Typically, all the include statements go here.
*/
%}
%%
.|\n ECHO;
%%
// This program just echoes whatever is typed into the console.
int main()
{
    printf("press ctrl+d to exit\n");
    yylex();

    return 0;
}