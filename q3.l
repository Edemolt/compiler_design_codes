%{
  #include <stdio.h>
%}

%%
^[-+]?[0-9]+ { printf("Valid Int\n"); }
^[-+]?[0-9]*\.[0-9]+ { printf("Valid Float\n"); } 
[ \t\n]+ ; /* Ignore whitespace */
. { printf("Invalid character\n"); } 
%%

int main() {
  yylex();
}
