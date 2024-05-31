%{
    #include <stdio.h>
%}

%s B C

%%
<INITIAL>0 BEGIN B;
<INITIAL>1 BEGIN INITIAL;
<INITIAL>\n BEGIN INITIAL; printf("NOT ACCEPTED\n");
<INITIAL>[^01] BEGIN INITIAL; printf("NOT ACCEPTED\n");

<B>0 BEGIN C;
<B>1 BEGIN INITIAL;
<B>\n BEGIN INITIAL; printf("NOT ACCEPTED\n");
<B>[^01] BEGIN INITIAL; printf("NOT ACCEPTED\n");

<C>0 BEGIN C;
<C>1 BEGIN C;
<C>\n BEGIN INITIAL; printf("ACCEPTED\n");
<C>[^01] BEGIN INITIAL; printf("NOT ACCEPTED\n");

%%

int main(){
    printf("Enter the string -> ");
    yylex();
    return 0;
}