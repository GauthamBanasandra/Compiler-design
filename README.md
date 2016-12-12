# Compiler-design
Lex and yacc programs

[lex_programs/Lab](https://github.com/GauthamBanasandra/Compiler-design/tree/master/lex_programs/Lab) contains -<br/>
1. Convert the upper case characters to lower case characters in a file.<br/>
2. Display the ASCII values of non-printing characters which are present in a file.<br/>
3. Count number of characters, words, lines, and spaces in a given file.<br/>
4. Count the number of comment lines in a given C program. Also eliminate them and copy the resulting program into a separate file.<br/>
5. Convert an octal number to its equivalent decimal number.<br/>
6. Recognize and count the number of identifiers in a given input file.<br/>

Execute the lex programs as -
```sh
$ lex <lex_file>.lex && gcc lex.yy.c -ll && ./a.out
```

[yacc_programs](https://github.com/GauthamBanasandra/Compiler-design/tree/master/yacc_programs) contains -<br/>
1. Recognize IF control statements and display number of levels of nesting.<br/>
2. Recognize a valid variable name, which starts with a letter, followed by any number of letters or digits?<br/>
3. Check whether the given string an bm (n>0, m>=0) is accepted by the grammar or not.<br/>
4. Check for the validity of a given arithmetic expression.<br/>
5. Evaluate an arithmetic expression involving operators +, -, and /.<br/>
6. Check whether the given string an bn (n>0) is accepted by the grammar or not.<br/>

>The input for the yacc programs must be given through the file named <strong>input.txt</strong> to avoid confusion during execution.

Execute the yacc programs as -<br/>
```sh
$ yacc -d <yacc_file>.y && lex <lex_file>.lex && gcc y.tab.c lex.yy.c -ll && ./a.out < input.txt
```
