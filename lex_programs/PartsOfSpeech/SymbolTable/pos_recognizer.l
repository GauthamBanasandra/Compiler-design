%{    
    int state;

    #include "sym_manager.c"
%}
%%
[\t ]+ ;
\n {state=LOOKUP;}
^verb {state=VERB;}
^adj {state=ADJ;}
^adv {state=ADV;}
^noun {state=NOUN;}
^prep {state=PREP;}
^pron {state=PRON;}
^conj {state=CONJ;}
[a-zA-Z]+ {    
    if(state!=LOOKUP)
        add_word(state, yytext);
    else
        switch(lookup_word(yytext))
        {
        case VERB:
            printf("%s:\tverb\n", yytext);
            break;
        case ADJ:
            printf("%s:\tadjective\n", yytext);
            break;
        case ADV:
            printf("%s:\tadverb\n", yytext);
            break;            
        case NOUN:
            printf("%s:\tnoun\n", yytext);
            break;
        case PREP:
            printf("%s:\tpreposition\n", yytext);
            break;
        case PRON:
            printf("%s:\tpronoun\n", yytext);
            break;
        case CONJ:
            printf("%s:\tconjunctive\n", yytext);
            break;
        default:
            printf("%s: not recognized\n", yytext);
            break;        
        }
    }
%%

int main()
{
    yylex();
}