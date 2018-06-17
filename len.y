%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}

%union{      
    double num;  
    char *str;
}
%token STRING NUMBER
%token TEL NDIR EMAIL DATE 

%token<num> BGNP NEW ENDP
%token<num> EOL

%type<str> STRING
%type<str> NUMBER
%type<str> NDIR
%type<str> EMAIL
%type<str> DATE
%type<str> TEL	



%%
final_program: BGNP program ENDP EOL

program: {printf("");}
| program line
;

line:
EOL
| assign EOL
;

assign: STRING {printf("N: %s \n",$1);}
| NUMBER 
| EMAIL {printf("EMAIL: %s \n",$1);}
| TEL  {printf("TEL: %s \n",$1);}
| DATE {printf("DATE: %s \n",$1);}
| NDIR {printf("ADR: %s \n",$1);}
;



%%
int main(int argc, char **argv)
{
    yyparse();
}
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
