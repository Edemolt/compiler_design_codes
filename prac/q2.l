%{
    #include<stdio.h>
%}

%%
^[a-zA-Z_][a-zA-Z0-9_]* {printf("Valid\n");}
. {printf("Invalid\n");}
%%

int main(){
    yylex();
}