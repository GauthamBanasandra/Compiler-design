#!/usr/bin/env bash
lex calc_lexer.l
mv lex.yy.c calc_lexer.c
yacc -d calc_parser.y
mv y.tab.c calc_parser.c
gcc calc_lexer.c calc_parser.c -ll -ly
./a.out