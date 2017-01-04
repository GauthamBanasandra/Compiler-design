%{
    #include <stdio.h>
    
    int yylex();
    int yyerror();
%}
%token VERB ADJ ADV NOUN PREP PRON CONJ ND
%%
sentence: subject VERB object {printf("sentence is valid.\n");}
    ;
subject: NOUN
    |   PRON
    ;
object: NOUN
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