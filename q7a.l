%{
    #include<stdio.h>
%}

%s B C D E F

%%

<INITIAL>a BEGIN B;
<INITIAL>b BEGIN INITIAL;
<INITIAL>\n BEGIN INITIAL; printf("NOT ACCEPTED\n");
<INITIAL>[^ab] BEGIN INITIAL; printf("NOT ACCEPTED\n");

<B>a BEGIN B;
<B>b BEGIN C;
<B>\n BEGIN INITIAL; printf("NOT ACCEPTED\n");
<B>[^ab] BEGIN INITIAL; printf("NOT ACCEPTED\n");

<C>a BEGIN D;
<C>b BEGIN INITIAL;
<C>\n BEGIN INITIAL; printf("NOT ACCEPTED\n");
<C>[^ab] BEGIN INITIAL; printf("NOT ACCEPTED\n");

<D>a BEGIN D;
<D>b BEGIN E;
<D>\n BEGIN INITIAL; printf("NOT ACCEPTED\n");
<D>[^ab] BEGIN INITIAL; printf("NOT ACCEPTED\n");

<E>a BEGIN D;
<E>b BEGIN F;
<E>\n BEGIN INITIAL; printf("NOT ACCEPTED\n");
<E>[^ab] BEGIN INITIAL; printf("NOT ACCEPTED\n");

<F>a BEGIN D;
<F>b BEGIN F;
<F>\n BEGIN INITIAL; printf("ACCEPTED\n");
<F>[^ab] BEGIN INITIAL; printf("NOT ACCEPTED\n");

%%

int main(){
    printf("Enter the string -> ");
    yylex();
    return 0;
}