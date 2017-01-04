%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "symtab.h"
    
    int yylex();
    int yyerror();
%}
%union {
    double dval;
    struct symtab* symp;
}
%token <symp> NAME 
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS
%type <dval> expression
%%
statement_list: statement
    |   statement_list statement
    ;
statement:  NAME '=' expression {$1->value=$3;}
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
    |   NAME    {$$=$1->value;}
    ;
%%
extern FILE *yyin;

int yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
    
    return 0;
}

struct symtab* symlook(char* s)
{
    char* p;
    struct symtab *sp;

    for(sp=symtab; sp<&symtab[NSYMS]; sp++)
    {
        if(sp->name && !strcmp(sp->name, s))
            return sp;
        if(!sp->name)
        {
            sp->name=strdup(s);
            return sp;
        }
    }

    yyerror("too many symbols");
    exit(1);
}

int main()
{
    do
    {
        yyparse();
    }while(!feof(yyin));

    return 0;
}