%{
    #include<stdio.h>
    int char_cnt = 0, word_cnt = 0, space_cnt = 0, line_cnt = 0;
    int in_word = 0;
%}

%%
[ \t] { space_cnt += 1; in_word = 0;}
\n { line_cnt = 0; in_word = 0;}
. { if(!(in_word)){ word_cnt += 1; in_word = 1}; }
%%

int main(){
    extern FILE * yyin;
    yyin = fopen("input.txt", "r");
    yylex();
    fclose(yyin);
    printf("%d\n%d\n%d\n%d\n",char_cnt, word_cnt, space_cnt, line_cnt);
}