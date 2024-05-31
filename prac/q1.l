%{
    #include <stdio.h>
    int line_cnt = 0, tab_cnt = 0, space_cnt = 0, char_cnt = 0;
%}

%%
\n { line_cnt += 1;}
\t { tab_cnt += 1;}
([ ]) { space_cnt += 1; }
. { char_cnt += 1; }
%%

int main(){
    yylex();
    printf("line cnt -> %d\ntab cnt -> %d\nspace_cnt -> %d\n char_cnt -> %d\n", line_cnt, tab_cnt, space_cnt, char_cnt);
}