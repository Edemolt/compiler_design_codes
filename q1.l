/* declaration section */

%{
    #include<stdio.h>
    int line_cnt = 0, space_cnt = 0, tab_cnt = 0, char_cnt = 0;
%}

/* rule section */

%%
\n line_cnt += 1;
([ ]) space_cnt += 1;
\t tab_cnt += 1;
. char_cnt += 1;
%%

/* subroutine section */

int main(){
    yylex(); // subroutine
    printf("Line cnt -> %d\n", line_cnt);
    printf("Space cnt -> %d\n", space_cnt);
    printf("Tab cnt -> %d\n", tab_cnt);
    printf("Total charachters -> %d\n", char_cnt);
}