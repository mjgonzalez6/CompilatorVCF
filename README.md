# CompilatorVCF

Formato VCF3.0 : https://www.evenx.com/vcard-3-0-format-specification

Probar expresiones regulares: https://regex101.com/

comandos para ejecutar:

bison -d gram.y		-> gram.tab.g y gram.tab.h
flex regex.l		-> lex.
gcc -o nombredemiprograma gram.tab.c lex.yy.c -ll
./nombredemiprograma archivo
