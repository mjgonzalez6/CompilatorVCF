%{
    # include "len.tab.h"
    # include "mem.h"
%}

%%
"INICIO"        { return BGNP; }
"NUEVO"         { return NEW; }
"FIN"           { return ENDP; }
[a-zA-Z .,-]{2,}                                      { yylval.str = strdup(yytext); return STRING; }
[0-9]+                                                { yylval.str = strdup(yytext); return NUMBER; }
#?(\d{1,3}[\,\.]{1}\d{3}\b|[0-9]{1,6}\b)($|\s)        { yylval.str = strdup(yytext); return NDIR; }
^([+]{1}[0-9]{2,5}\s?)??((\d\s*){9})$		              { yylval.str = strdup(yytext); return TEL; }
^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$        { yylval.str = strdup(yytext); return EMAIL; }
^([0-2][0-9]|3[0-1])(\/|-)(0[1-9]|1[0-2])\2(\d{4})$   { yylval.str = strdup(yytext); return DATE; }
\n              { return EOL; }
[ \t]           { /* ignore whitespace */ }
%%
