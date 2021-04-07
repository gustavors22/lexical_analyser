%{
#include <stdio.h>
FILE *out ;
%}

/*** Definition section ***/
KEYWORD     "auto"|"if"|"else"|"for"|"while"|"do"|"switch"|"case"|"break"|"struct"|"int"|"char"|"float"|"doble"|"long"|"main"|"printf"|"scanf"
DECIMAL     [0-9]
IDENTIFIER  [a-zA-z]_][a-zA-Z]_[0-9]*
SPACE       []

/** Rules Section **/
%%
{KEYWORD}   { printf("\nkeyword => %s\n", yytext); }

"+"         { printf("\nsum operator => %s\n", yytext); }
"-"         { printf("\nsubtraction operator => %s\n", yytext); }
"*"         { printf("\nmultiplication operator => %s\n", yytext); }
"/"         { printf("\ndivision operator => %s\n", yytext); }
"%"         { printf("\nreminder after division perator => %s\n", yytext); }
"++"        { printf("\nincrement operator => %s\n", yytext); }
"--"        { printf("\ndecremente operator => %s\n", yytext); }
"<"         { printf("\nless than operator => %s\n", yytext); }
">"         { printf("\ngreater than operator => %s\n", yytext); }
"="         { printf("\nattribution operator => %s\n", yytext); }
"=="        { printf("\nequal operator => %s\n", yytext); }
"!="        { printf("\nnot equal operator => %s\n", yytext); }
">="        { printf("\ngreater than or equal to => %s\n", yytext); }
"<="        { printf("\nless than or equal to => %s\n", yytext); }
"||"        { printf("\nlogical OR operator => %s\n", yytext); }
"&&"        { printf("\nlogical AND operator => %s\n", yytext); }
"//"        { printf("\ncomment operator => %s\n", yytext); }
"/*"        { printf("\ninit comment operator => %s\n", yytext); }
"*/"        { printf("\nend comment operator => %s\n", yytext); }

{IDENTIFIER} { printf("IDENTIFIER => %s\n", yytext); }

%%

int yywrap();

int main(int argc, char *argv[]){
    FILE *arquivo = fopen(argv[1],"r");
    if (!arquivo) {
      printf("File not found");
      return -1;
    }
    yyin = arquivo;
    out = fopen(argv[2],"w");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
