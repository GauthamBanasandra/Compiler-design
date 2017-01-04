%{
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"
    
    #define EOL 0
    
    int state;
    int lookup(char*);
%}
%%
[\t ]+ ;
\n {state=EOL;}
\.\n {state=EOL; return state;}
^verb {state=VERB;}
^adj {state=ADJ;}
^adv {state=ADV;}
^noun {state=NOUN;}
^prep {state=PREP;}
^pron {state=PRON;}
^conj {state=CONJ;}
[a-zA-Z]+ {
    if(state==EOL)
    {
        switch(lookup(yytext))
        {
            case VERB:
                return VERB;
            case ADJ:
                return ADJ;
            case ADV:
                return ADV;
            case NOUN:
                return NOUN;
            case PRON:
                return PRON;
            case PREP:
                return PREP;
            case CONJ:
                return CONJ;
            case ND:
            default:
                printf("%s not recognized\n", yytext);
        }
    }
}
. ;
%%
int lookup(char *word)
{
    register int i = 0;
    char *nouns[] = {"happy", "top", "bat", "bottle"};
    char *verbs[] = {"is", "are", "run", "play"};
    char *pronouns[] = {"i", "you", "we", "they"};
    for (i = 0; i < 4; ++i)
        if (!strcmp(nouns[i], word))
            return NOUN;
    for (i = 0; i < 4; ++i)
        if (!strcmp(verbs[i], word))
            return VERB;
    for (i = 0; i < 4; ++i)
        if (!strcmp(pronouns[i], word))
            return PRON;

    return ND;
}