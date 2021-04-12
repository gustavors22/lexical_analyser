%{
#include <stdio.h>
FILE *outFile ;
%}

/*** Definition section ***/
KEYWORD      "auto"|"if"|"else"|"for"|"while"|"do"|"switch"|"case"|"break"|"struct"|"int"|"char"|"float"|"doble"|"long"|"main"|"printf"|"scanf"
CONSTANTS    [0-9]*
IDENTIFIER   [_|a-z|A-Z][a-z|A-Z|0-9|_]*
SYM          [""|#]

/** Rules Section **/
%%
"+"         { fprintf(outFile, "\nsum operator => %s\n", yytext); }
"-"         { fprintf(outFile, "\nsubtraction operator => %s\n", yytext); }
"*"         { fprintf(outFile, "\nmultiplication operator => %s\n", yytext); }
"/"         { fprintf(outFile, "\ndivision operator => %s\n", yytext); }
"%"         { fprintf(outFile, "\nreminder after division perator => %s\n", yytext); }
"++"        { fprintf(outFile, "\nincrement operator => %s\n", yytext); }
"--"        { fprintf(outFile, "\ndecremente operator => %s\n", yytext); }
"<"         { fprintf(outFile, "\nless than operator => %s\n", yytext); }
">"         { fprintf(outFile, "\ngreater than operator => %s\n", yytext); }
"="         { fprintf(outFile, "\nattribution operator => %s\n", yytext); }
"=="        { fprintf(outFile, "\nequal operator => %s\n", yytext); }
"!="        { fprintf(outFile, "\nnot equal operator => %s\n", yytext); }
">="        { fprintf(outFile, "\ngreater than or equal to => %s\n", yytext); }
"<="        { fprintf(outFile, "\nless than or equal to => %s\n", yytext); }
"||"        { fprintf(outFile, "\nlogical OR operator => %s\n", yytext); }
"&&"        { fprintf(outFile, "\nlogical AND operator => %s\n", yytext); }
"//"        { fprintf(outFile, "\ncomment operator => %s\n", yytext); }
"/*"        { fprintf(outFile, "\ninit comment operator => %s\n", yytext); }
"*/"        { fprintf(outFile, "\nend comment operator => %s\n", yytext); }
";"         { fprintf(outFile, "\nsemicolon simbol => %s\n", yytext); }
"["         { fprintf(outFile, "\nopen square bracket => %s\n", yytext); }
"]"         { fprintf(outFile, "\nclose square bracket => %s\n", yytext); }
"("         { fprintf(outFile, "\nopen parenthesiss => %s\n", yytext); }
")"         { fprintf(outFile, "\nclose parenthesiss => %s\n", yytext); }
"{"         { fprintf(outFile, "\nopen curly bracket => %s\n", yytext); }
"}"         { fprintf(outFile, "\nclose curly bracket => %s\n", yytext); }
","         { fprintf(outFile, "\ncomma simbol => %s\n", yytext); }
"."         { fprintf(outFile, "\ndot simbol => %s\n", yytext); }
":"         { fprintf(outFile, "\ncolon simbol => %s\n", yytext); }
"&"         { fprintf(outFile, "\n& simbol => %s\n", yytext); }

{SYM}          { fprintf(outFile, "\nsimbols => %s\n", yytext); }
{KEYWORD}      { fprintf(outFile, "\nKEYWORD => %s\n", yytext); } 
{IDENTIFIER}   { fprintf(outFile, "\nIDENTIFIER => %s\n", yytext); }
{CONSTANTS}    { fprintf(outFile, "\nCONSTANTS => %s\n", yytext); }
%%

int yywrap();

int main(int argc, char *argv[]){
    FILE *file = fopen(argv[1],"r");

    if (!file) {
      printf("File not found");
      return -1;
    }

    yyin = file;
    outFile = fopen(argv[2],"w");
    yylex();

    printf("Done...\n");
    printf("the analysis was written in the %s file\n", argv[2]);
    return 0;
}

int yywrap(){
    return 1;
}