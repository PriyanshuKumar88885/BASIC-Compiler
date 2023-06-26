%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
int arr[100000];
int c=0;
int max=0;
extern FILE *yyin,*yyout,*lexout;


void yyerror(char *);
int yylex(void);

#define MAX_SYMBOL_TABLE_SIZE 1000

typedef struct {
    char *name;
    int type;
    int value;
} symbol;

symbol symbol_table[MAX_SYMBOL_TABLE_SIZE];
int symbol_table_size = 0;

void add_symbol(char *name, int type, int value) {
    if (symbol_table_size >= MAX_SYMBOL_TABLE_SIZE) {
        fprintf(stderr, "Error: Symbol table overflow\n");
        exit(EXIT_FAILURE);
    }
    symbol_table[symbol_table_size].name = strdup(name);
    symbol_table[symbol_table_size].type = type;
    symbol_table[symbol_table_size].value = value;
    symbol_table_size++;
}

int find_symbol(char *name) {
    int i;
    for (i = 0; i < symbol_table_size; i++) {
        if (strcmp(symbol_table[i].name, name) == 0) {
            return i;
        }
    }
    return -1;
}

#define TYPE_INTEGER 1

%}

%union {
    int num;
    char *str;
}

%token INPUT PRINT LET IF THEN FOR TO STEP NEXT GOTO GOSUB RETURN DIM READ DATA RESTORE STOP END DEFI REMI COMMENT REM
%token   ADDOP RELOP  MULOP SEMICOLON COMMA rem_var temp 
%token NUM_CONST NUMBER IDENTIFIER  STRING IDENTIFIER_TYPE
%token   AND OR NOT XOR OPEN_PAREN CLOSE_PAREN EXPON NEGATION 



%start program

%%

program: statements
        ;

statements: statement '\n' 
          | statements statement '\n' 
          ;

statement: 
          |NUMBER INPUT term5
         | NUMBER IDENTIFIER 
         | NUMBER PRINT  follow
         | NUMBER LET  DEFIN
         | NUMBER IF condition THEN NUMBER
        
         | NUMBER FOR IDENTIFIER RELOP expression TO expression STEP expression '\n'
               statements NUMBER NEXT IDENTIFIER
          | NUMBER FOR IDENTIFIER RELOP expression TO expression '\n'
            statements NUMBER NEXT IDENTIFIER
         | NUMBER GOTO NUMBER   {if(arr[yylval.num]==0)
                                 printf("LINE DOES NOT EXIST\n");}
         | NUMBER GOSUB NUMBER   {c=c+1;}
         | NUMBER RETURN         {if(c==0)
                           printf("Subroutine does not exist\n");
                           else
                           c=c-1;}
         | NUMBER DIM DECLARATION
         | NUMBER READ IDENTIFIER 
         | NUMBER RESTORE 
         | NUMBER STOP  
         | NUMBER END   {if(max!=yyval.num)
                   printf("ERROR :END IS NOT IN LAST\n");}
         | NUMBER DATA value
        | NUMBER DEFI IDENTIFIER  RELOP expression
        |NUMBER DEFI IDENTIFIER expression RELOP expression
        |NUMBER REM
         ;

term5:
     IDENTIFIER
     |IDENTIFIER_TYPE
     |IDENTIFIER COMMA term5
     |IDENTIFIER_TYPE COMMA term5
     |IDENTIFIER OPEN_PAREN term1 CLOSE_PAREN
     |IDENTIFIER OPEN_PAREN term1 CLOSE_PAREN term5
     ;
    
DEFIN:
     IDENTIFIER_TYPE RELOP expression
     |IDENTIFIER_TYPE RELOP STRING
     |IDENTIFIER RELOP expression
     |IDENTIFIER RELOP STRING
     |IDENTIFIER RELOP temp expression 
     |IDENTIFIER OPEN_PAREN expression CLOSE_PAREN RELOP expression
     |IDENTIFIER OPEN_PAREN term1 COMMA term1 CLOSE_PAREN RELOP expression
     ;
term1:
   IDENTIFIER
   |NUMBER
   ;
   

    
     

       
follow:
     expression 
     |temp  IDENTIFIER OPEN_PAREN term1 CLOSE_PAREN follow
     |STRING 
     |expression COMMA follow
     |expression SEMICOLON follow
     |STRING COMMA follow
     |STRING SEMICOLON follow
     |COMMA
     |SEMICOLON
     |
     ;
DECLARATION:
         IDENTIFIER OPEN_PAREN NUMBER CLOSE_PAREN
         |IDENTIFIER OPEN_PAREN NUMBER COMMA NUMBER CLOSE_PAREN 
         |IDENTIFIER OPEN_PAREN NUMBER CLOSE_PAREN COMMA DECLARATION
         |IDENTIFIER OPEN_PAREN NUMBER COMMA NUMBER CLOSE_PAREN COMMA DECLARATION
         ;
value: 
        id
        |id  COMMA value
        ;
id :
       NUM_CONST
       |NUMBER
       |STRING
       ;


expression : term
           | expression ADDOP term
           ;

term : factor
     | term MULOP factor
     ;
condition : 
           
            STRING
            |expression RELOP expression
            |IDENTIFIER RELOP expression
          
           |IDENTIFIER RELOP STRING
           |IDENTIFIER_TYPE RELOP STRING
           |STRING RELOP STRING
           |STRING RELOP IDENTIFIER
           |STRING RELOP IDENTIFIER_TYPE
          | NOT condition
          | condition AND condition
          | condition OR condition
          |expression
          ;

factor:
       factor1
       | ADDOP IDENTIFIER
       | ADDOP NUMBER
       ;
factor1:
        factor2
        |factor1 EXPON factor2
        ;
factor2 :IDENTIFIER
       |NUMBER
       |IDENTIFIER_TYPE
       |NUM_CONST
       |OPEN_PAREN expression CLOSE_PAREN
       |IDENTIFIER OPEN_PAREN expression CLOSE_PAREN
        ;


%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
       
   

        FILE *fp;
    char buffer[1024];
    int prev_line_num = 0;
    int curr_line_num;
    for(int i=0;i<10000;i++)
    arr[i]=0;


    fp = fopen("CorrectSample.bmm.txt", "r");  
    if (fp == NULL) {
        printf("Error: Unable to open file\n");
        return 1;
    }

    while (fgets(buffer, 1024, fp)) {
        
        curr_line_num = atoi(buffer);
       
        arr[curr_line_num]=1;
        if(curr_line_num>max)
        max=curr_line_num;
       

        if (curr_line_num <= prev_line_num) {
            printf("Error: Line numbers not in ascending order\n");
            return 1;
        }

       
        prev_line_num = curr_line_num;

        
    }
    

    fclose(fp);
    yyin=fopen("CorrectSample.bmm.txt","r");
  
    lexout=fopen("Lexer.txt","w");
    
  
    yyparse();
    return 0;
}
