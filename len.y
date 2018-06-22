%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}

%union{      
    double num;  
    char *str;
}

%token<str> BGNP
%token<str> NEW
%token<str> ENDP
%token<str> STRING
%token<str> TEL
%token<str> NDIR
%token<str> EMAIL
%token<str> DATE
%token<num> NUMBER
%token<str> EOL


%%
final_program: BGNP program ENDP


program: {printf("");}
| program line
;

line:
EOL
| assign EOL
;

assign: EMAIL {printf("EMAIL: %s \n",$1);}
| TEL  {printf("TEL: %s \n",$1);}
| DATE {printf("DATE: %s \n",$1);}
| STRING {printf("N: %s \n",$1);}
| STRING NUMBER {printf("ADR: %s %.0f\n",$1,$2);}
;


%%
int main(int argc, char *argv[])
{
    yyparse();
}
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
