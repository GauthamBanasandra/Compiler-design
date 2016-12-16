//
// Created by root on 14/12/16.
//
#include "utils.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct word
{
    char *word_name;
    int word_type;
    struct word *next;
};

struct word *word_list;

int add_word(int type, char *word)
{
    struct word *wp;
    if (lookup_word(word) != LOOKUP)
    {
        printf("warning: word %s is already defined\n", word);
        return 0;
    }
    wp = (struct word *) malloc(sizeof(struct word));
    wp->next = word_list;
    wp->word_name = (char *) malloc(strlen(word) + 1);
    strcpy(wp->word_name, word);
    wp->word_type = type;
    word_list = wp;
    return 1;
}

int lookup_word(char *word)
{
    struct word *wp = word_list;
    for (; wp; wp = wp->next)
        if (strcmp(wp->word_name, word) == 0)
            return wp->word_type;
    return LOOKUP;
}
