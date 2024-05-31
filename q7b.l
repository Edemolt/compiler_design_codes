%{
    #include <stdio.h>
    FILE * output;
%}

%s B C D E F

%%

<INITIAL>a BEGIN B;
<INITIAL>b BEGIN INITIAL;
<INITIAL>\n BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");
<INITIAL>[^ab] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

<B>a BEGIN B;
<B>b BEGIN C;
<B>\n BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");
<B>[^ab] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

<C>a BEGIN D;
<C>b BEGIN INITIAL;
<C>\n BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");
<C>[^ab] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

<D>a BEGIN D;
<D>b BEGIN E;
<D>\n BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");
<D>[^ab] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

<E>a BEGIN D;
<E>b BEGIN F;
<E>\n BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");
<E>[^ab] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

<F>a BEGIN D;
<F>b BEGIN F;
<F>\n BEGIN INITIAL; fprintf(output, "ACCEPTED\n");
<F>[^ab] BEGIN INITIAL; fprintf(output, "NOT ACCEPTED\n");

%%

int main(){
    extern FILE * yyin;
    yyin = fopen("input7.txt", "r");
    if (!yyin) {
        perror("Failed to open input file");
        return 1;
    }

    output = fopen("output7.txt", "w");
    if (!output) {
        perror("Failed to open output file");
        fclose(yyin);
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(output);

    printf("Done 👍\n");
    return 0;
}
