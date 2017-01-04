%{
    #include <stdio.h>
    #include "symtab.h"

    int yylex();
    int yyerror(char*);
%}
%union {
    struct symtab* symp;
}
%token <symp> CLAUSE 
%token <symp> SOURCE
%token <symp> COND
%token <symp> SELECT
%token <symp> FROM
%token <symp> WHERE
%%
sql: SELECT CLAUSE FROM CLAUSE WHERE COND {printf("clause=%s\tsource=%s\tcondition=%s\n", $2->name, $4->name, $6->name);}
    ;
%%
extern FILE *yyin;

int main()
{
    do
    {
        yyparse();
    }while(!feof(yyin));
    
    return 0;
}
int yyerror(char* s)
{
    printf("%s", s);

    return 0;
}