/* declaration section */
%{
    #include <stdio.h>
    FILE * output;
%}

%%
[ ]+ fprintf(output, "_");
.|\n fprintf(output, yytext, 0);
%%

int main(){
    extern FILE * yyin;
    yyin = fopen("input2.txt", "r");
    output = fopen("ouput.txt", "w");
    yylex();
    printf("Done 👍\n");
}