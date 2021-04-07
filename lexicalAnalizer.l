%{
#include <stdio.h>
FILE *out ;
%}

/*** Definition section ***/
KEYWORD      "auto"|"if"|"else"|"for"|"while"|"do"|"switch"|"case"|"break"|"struct"|"int"|"char"|"float"|"doble"|"long"|"main"|"printf"|"scanf"
DECIMAL      [0-9]
IDENTIFIER   [a-zA-Z][a-zA-Z0-9]*
QUOTION_MARK [""]

/** Rules Section **/
%%

"+"         { fprintf(out, "\nsum operator => %s\n", yytext); }
"-"         { fprintf(out, "\nsubtraction operator => %s\n", yytext); }
"*"         { fprintf(out, "\nmultiplication operator => %s\n", yytext); }
"/"         { fprintf(out, "\ndivision operator => %s\n", yytext); }
"%"         { fprintf(out, "\nreminder after division perator => %s\n", yytext); }
"++"        { fprintf(out, "\nincrement operator => %s\n", yytext); }
"--"        { fprintf(out, "\ndecremente operator => %s\n", yytext); }
"<"         { fprintf(out, "\nless than operator => %s\n", yytext); }
">"         { fprintf(out, "\ngreater than operator => %s\n", yytext); }
"="         { fprintf(out, "\nattribution operator => %s\n", yytext); }
"=="        { fprintf(out, "\nequal operator => %s\n", yytext); }
"!="        { fprintf(out, "\nnot equal operator => %s\n", yytext); }
">="        { fprintf(out, "\ngreater than or equal to => %s\n", yytext); }
"<="        { fprintf(out, "\nless than or equal to => %s\n", yytext); }
"||"        { fprintf(out, "\nlogical OR operator => %s\n", yytext); }
"&&"        { fprintf(out, "\nlogical AND operator => %s\n", yytext); }
"//"        { fprintf(out, "\ncomment operator => %s\n", yytext); }
"/*"        { fprintf(out, "\ninit comment operator => %s\n", yytext); }
"*/"        { fprintf(out, "\nend comment operator => %s\n", yytext); }
";"         { fprintf(out, "\nsemicolon simbol => %s\n", yytext); }
"["         { fprintf(out, "\nopen square bracket => %s\n", yytext); }
"]"         { fprintf(out, "\nclose square bracket => %s\n", yytext); }
"("         { fprintf(out, "\nopen parenthesiss => %s\n", yytext); }
")"         { fprintf(out, "\nclose parenthesiss => %s\n", yytext); }
"{"         { fprintf(out, "\nopen curly bracket => %s\n", yytext); }
"}"         { fprintf(out, "\nclose curly bracket => %s\n", yytext); }
","         { fprintf(out, "\ncomma simbol => %s\n", yytext); }
"."         { fprintf(out, "\ndot simbol => %s\n", yytext); }
":"         { fprintf(out, "\ncolon simbol => %s\n", yytext); }
"&"         { fprintf(out, "\n& simbol => %s\n", yytext); }

{QUOTION_MARK} { fprintf(out, "\nquotion mark simbol => %s\n", yytext); }
{KEYWORD}      { fprintf(out, "\nKEYWORD => %s\n", yytext); } 
{IDENTIFIER}   { fprintf(out, "\nIDENTIFIER => %s\n", yytext); }
{DECIMAL}      { fprintf(out, "\nDECIMAL => %s\n", yytext); }

%%

int yywrap();

int main(int argc, char *argv[]){
    FILE *file = fopen(argv[1],"r");

    if (!file) {
      printf("File not found");
      return -1;
    }

    yyin = file;
    out = fopen(argv[2],"w");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
