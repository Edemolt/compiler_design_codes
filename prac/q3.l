%{
    #include<stdio.h>
%}

%%
^[-+]?[0-9]+ { printf("Valid Int\n"); }
^[-+]?[0-9]*\.[0.9]+ { printf("Valid Float\n"); }
[ \t\n]+ ;
. { printf("Invalid char : %c\n", yytext[0]); };
%%

int main(){
    yylex();
}