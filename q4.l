/* declaration section */
%{
    #include<stdio.h>
%}

/* rule section */
%%
int|float|double|long|char {printf("keyword\n");}
[(){};,] {printf("seperator\n");}
[+-/*] {printf("operator\n");}
([a-zA-Z][a-zA-Z0-9_]*) {printf("Identifier\n");}
.|\n;
%%

int main(){
    yylex();
}