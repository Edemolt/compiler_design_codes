%{
    #include <stdio.h>
    FILE * output;
%}

%s B C

%%
<INITIAL>0 BEGIN B;
<INITIAL>1 BEGIN INITIAL;
<INITIAL>\n BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");
<INITIAL>[^01] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

<B>0 BEGIN C;
<B>1 BEGIN INITIAL;
<B>\n BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");
<B>[^01] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

<C>0 BEGIN C;
<C>1 BEGIN C;
<C>\n BEGIN INITIAL; fprintf(output, "ACCEPTED\n");
<C>[^01] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

%%

int main(){
    extern FILE * yyin;
    yyin = fopen("input8.txt", "r");
    output = fopen("output8.txt", "w");

    yylex();

    fclose(yyin);
    fclose(output);

    printf("Done 👍\n");
    return 0;
}