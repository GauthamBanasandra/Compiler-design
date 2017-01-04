%{
    #include <stdio.h>

    double vbltable[26];
    int yylex();
    int yyerror();
%}
%union {
    double dval;
    int vblno;
}
%token <vblno> NAME 
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS
%type <dval> expression
%%
statement_list: statement
    |   statement_list statement
    ;
statement:  NAME '=' expression {vbltable[$1]=$3;}
    |    expression {printf("=%g\n", $1);}
    ;
expression: expression '+' expression   {$$=$1+$3;}
    |   expression '-' expression   {$$=$1-$3;}
    |   expression '*' expression   {$$=$1*$3;}
    |   expression '/' expression   {
        if($3==0.0)
            yyerror("division by zero");
        else
            $$=$1-$3;
    }
    |   NUMBER
    |   NAME    {$$=vbltable[$1];}
    ;
%%
extern FILE *yyin;

int yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
    
    return 0;
}

int main()
{
    do
    {
        yyparse();
    }while(!feof(yyin));

    return 0;
}