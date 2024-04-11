/* declaration section */
%{
#include <stdio.h>

int char_cnt = 0, word_cnt = 0, space_cnt = 0, line_cnt = 0;
int in_word = 0; // To track if we are currently inside a word
%}

%%
\n      { line_cnt += 1; char_cnt += 1; in_word = 0; }
[ \t]+  { space_cnt += 1; char_cnt += 1; in_word = 0; }
.       { char_cnt += 1; if (!in_word) { word_cnt++; in_word = 1; } }
%%

int main(){
    extern FILE *yyin;
    yyin = fopen("input.txt", "r");
    yylex();
    fclose(yyin);
    printf("Character cnt = %d\nWord Cnt = %d\nSpace cnt = %d\nLine cnt = %d\n", char_cnt, word_cnt, space_cnt, line_cnt);
}
