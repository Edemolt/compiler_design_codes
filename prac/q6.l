%{
    #include<stdio.h>
    FILE * output;
%}

%%
[ ]+ fopen(output, "_");
.|\n fprintf(output, yytext, 0);
%%

int main(){
    extern FILE * yyin;
    yyin = fopen("input2.txt", "r");
    output = fopen("output.txt", "w");
    yylex();
    printf("Done 👍\n");
}