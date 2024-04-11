/* declaration section */
%{
    #include <stdio.h>
%}

/* rule section */
%%
^[a-zA-Z_][a-zA-Z0-9_]* {printf("Valid Identifier");}
. {printf("Invalid Identifier\n");}
%%

/* subroutine section */
int main(){
    yylex();
}