//
// Created by root on 14/12/16.
//


enum
{
    LOOKUP = 0,
    VERB,
    ADJ,
    ADV,
    NOUN,
    PREP,
    PRON,
    CONJ
};

int add_word(int type, char *word);
int lookup_word(char *word);