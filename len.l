%{
    # include "len.tab.h"
    # include "mem.h"
%}

%%
"INICIO"        { return BGNP; }
"NUEVO"         { return NEW; }
"FIN"           { return ENDP; }
[0-9]+                                                { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z .,-]{2,}                                      { yylval.str = strdup(yytext); return STRING; }
\b#?(\d{1,3}[\,\.]{1}[0-9]{3}|[0-9]{1,6})($|\t)       { yylval.str = strdup(yytext); return NDIR; }
^([+]{1}[0-9]{2,5}\t?)??(([0-9]\t*){9})$	      { yylval.str = strdup(yytext); return TEL; }
^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$        { yylval.str = strdup(yytext); return EMAIL; }
^([0-2][0-9]|3[0-1])(\/|-)(0[1-9]|1[0-2])\2(\d{4})$   { yylval.str = strdup(yytext); return DATE; }
\n              { return EOL; }
[ \t]           { /* ignore whitespace */ }
. { printf("Mystery character %s\n", yytext);}
%%
