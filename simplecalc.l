%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%

"//".*           ;//Se ignoran los comentarios
"f"              { return float; }
"i"              { return int; }
"p"              { return print; }
[a-z]            { yylval.id = yytext[0]; return ID; }
[0-9]+\.[0-9]+   { yylval.fval = atof(yytext); return fnum; }
[0-9]+           { yylval.ival = atoi(yytext); return inum; }
"+"              { return add; }
"-"              { return minus; }
"*"              { return multiply; }
"/"              { return divide; }
"="              { return equals; }
[ \t\n]+         ;
.                ;

%%

int yywrap() {
    return 1;
}
