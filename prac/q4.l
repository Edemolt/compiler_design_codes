%{
    #include<stdio.h>
%}

%%
int|char|float|double { printf("keyword\n"); }
[(){};,] { printf("seperator\n"); }
[+-/*] { printf("operator\n"); }
.|\n;
%%

int main(){
    yylex();
}