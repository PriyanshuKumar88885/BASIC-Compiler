// It is lex/yacc-based compiler
%{
#include <stdio.h>
#include<string.h>
#include "y.tab.h"
int count=0;
int arr[1000];
FILE *lexout;
%}
digit [0-9]
integer [0-9]+
%%
[*]                 {fprintf(lexout,"mul: *\n");return MULOP;}

(\".*\")      { fprintf(lexout,"STRING: %s\n",yytext);yylval.str=strdup(yytext); return STRING;}
"DEF FN"             {fprintf(lexout,"DEF FN: DEF FN\n");return DEFI;}
"FN"                   {fprintf(lexout,"FN: FN\n");return temp;}
{integer}             { fprintf(lexout,"INTEGER: %d\n",atoi(yytext));yylval.num = atoi(yytext); return NUMBER;
 }
[-]{0,1}{integer}"\."{integer} { fprintf(lexout,"NUM_CONST: %s\n",yytext);return NUM_CONST; }

[A-Z][0-9]?            {fprintf(lexout,"ID: %s\n",yytext);yylval.str= strdup(yytext);
return IDENTIFIER;}
[A-Z][0-9]?[$!#%]{1} { fprintf(lexout,"ID_TYPE: %s\n",yytext);return IDENTIFIER_TYPE; }



INPUT               { fprintf(lexout,"INPUT: INPUT\n");return INPUT; }
PRINT               {fprintf(lexout,"PRINT: PRINT\n"); return PRINT; }
LET                 { fprintf(lexout,"LET: LET\n");fprintf(lexout,"INPUT: INPUT\n");return LET; }
IF                  {fprintf(lexout,"IF: IF\n"); return IF; }
THEN                {fprintf(lexout,"THEN: THEN\n"); return THEN; }
FOR                 { fprintf(lexout,"FOR: FOR\n");return FOR; }
TO                  {fprintf(lexout,"TO: TO\n"); return TO; }
STEP                {fprintf(lexout,"STEP: STEP\n"); return STEP; }
NEXT                {fprintf(lexout,"NEXT: NEXT\n"); return NEXT; }
GOTO                {fprintf(lexout,"GOTO: GOTO\n"); return GOTO; }
GOSUB               { fprintf(lexout,"GOSUB: GOSUB\n");return GOSUB; }
RETURN              { fprintf(lexout,"RETURN: RETURN\n");return RETURN; }
DIM                 { fprintf(lexout,"DIM: DIM\n");return DIM; }
READ                { fprintf(lexout,"READ: READ\n");return READ; }
DATA                { fprintf(lexout,"DATA: DATA\n");return DATA; }
RESTORE             { fprintf(lexout,"RESTORE: RESTORE\n");return RESTORE; }
STOP                { fprintf(lexout,"STOP: STOP\n");return STOP; }
END                 { fprintf(lexout,"END: END\n");return END; }
"+"                 { fprintf(lexout,"PLUS: +\n");return ADDOP; }
"-"                 { fprintf(lexout,"MINUS: -\n");return ADDOP;}
"/"                 { fprintf(lexout,"DIVIDE: /\n");return MULOP; }

"="                 {fprintf(lexout,"EQUALS: =\n"); return RELOP;  }
"<>"                { fprintf(lexout,"NOT_EQUALS: <>\n");return RELOP; }
">"                 { fprintf(lexout,"GRATER_THAN: >\n");return RELOP; }
"<"                 { fprintf(lexout,"LESS_THAN: <\n");return RELOP; }
">="                { fprintf(lexout,"GREATER_THAN_EQUALS: >=\n");return RELOP; }
"<="                { fprintf(lexout,"LESS_THAN_EQUALS: <=\n");return RELOP; }
"("                 { fprintf(lexout,"LEFTBRACKET: (\n");return OPEN_PAREN; }
")"                 { fprintf(lexout,"RIGHTBRACKET: )\n");return CLOSE_PAREN; }
"AND"                {fprintf(lexout,"AND: AND\n");return AND;}
"OR"                 {fprintf(lexout,"OR: OR\n");return OR;}
"NOT"                 {fprintf(lexout,"NOT: NOT\n");return NOT;}
"XOR"                   {fprintf(lexout,"XOR: XOR\n");return XOR;}
"^"                       {fprintf(lexout,"EXPONENTIAL: ^\n");return EXPON;}
","                 { fprintf(lexout,"COMMA: ,\n");return COMMA;  }
";"                    {fprintf(lexout,"SEMICOLON: ;\n");return SEMICOLON;}
REM[^a-z\n]*\n          {
                    unput(yytext[yyleng-1]);
                     fprintf(lexout,"REM: COMMENT\n");return REM;
                      }      
REM[^\n]*\n        {unput(yytext[yyleng-1]);
                    fprintf(lexout,"REM: COMMENT\n");return REM;

                       }
[ \t]+          
[\n]                {fprintf(lexout,"NEWLINE: '\n'\n");return '\n';}

%%

int yywrap() {
    return 1;
}


