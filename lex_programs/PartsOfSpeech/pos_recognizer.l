%%
[\t ]+ ; // Ignore white-space and tabs.
is |
was |
are |
has |
had |
have |
come |
go { printf("%s:\tverb\n", yytext); } // These form the verbs.
dog |
cat |
mouse |
[tT]om |
[jJ]erry |
moon { printf("%s:\tnoun\n", yytext); } // These form the nouns
[a-zA-Z]+ { printf("%s:\tunrecoginzed\n", yytext); } // Currently, the rest of the words are not recognized.
.|\n ECHO; // Echo the rest of the symbols.
%%
int main()
{
    yylex();

    return 0;
}