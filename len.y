%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
    FILE *fp = NULL;
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
final_program: BGNP program 

program: 
| new_contact program
;

new_contact: NEW {fprintf(fp,"\nBEGIN:VCARD\nVERSION:2.1");}
| line 
| ENDP {fprintf(fp,"\nEND:VCARD");}
;

line:
EOL 
| assign EOL
;

assign: EMAIL {fprintf(fp,"\nEMAIL: %s",$1);}
| TEL  {fprintf(fp,"\nTEL: %s",$1);}
| DATE {fprintf(fp,"\nDATE: %s",$1);}
| dir
| STRING {fprintf(fp,"\nN: %s",$1);}

;

dir: STRING NUMBER {fprintf(fp,"\nADR: %s %.0f",$1,$2);}
| dir STRING NUMBER {fprintf(fp,"%s %.0f",$2,$3);}
;




%%
int main(int argc, char *argv[])
{
    
    fp = fopen("salida.vcf" , "a");
   
    yyparse();
}
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
