
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INPUT = 258,
     PRINT = 259,
     LET = 260,
     IF = 261,
     THEN = 262,
     FOR = 263,
     TO = 264,
     STEP = 265,
     NEXT = 266,
     GOTO = 267,
     GOSUB = 268,
     RETURN = 269,
     DIM = 270,
     READ = 271,
     DATA = 272,
     RESTORE = 273,
     STOP = 274,
     END = 275,
     DEFI = 276,
     REMI = 277,
     COMMENT = 278,
     REM = 279,
     ADDOP = 280,
     RELOP = 281,
     MULOP = 282,
     SEMICOLON = 283,
     COMMA = 284,
     rem_var = 285,
     temp = 286,
     NUM_CONST = 287,
     NUMBER = 288,
     IDENTIFIER = 289,
     STRING = 290,
     IDENTIFIER_TYPE = 291,
     AND = 292,
     OR = 293,
     NOT = 294,
     XOR = 295,
     OPEN_PAREN = 296,
     CLOSE_PAREN = 297,
     EXPON = 298,
     NEGATION = 299
   };
#endif
/* Tokens.  */
#define INPUT 258
#define PRINT 259
#define LET 260
#define IF 261
#define THEN 262
#define FOR 263
#define TO 264
#define STEP 265
#define NEXT 266
#define GOTO 267
#define GOSUB 268
#define RETURN 269
#define DIM 270
#define READ 271
#define DATA 272
#define RESTORE 273
#define STOP 274
#define END 275
#define DEFI 276
#define REMI 277
#define COMMENT 278
#define REM 279
#define ADDOP 280
#define RELOP 281
#define MULOP 282
#define SEMICOLON 283
#define COMMA 284
#define rem_var 285
#define temp 286
#define NUM_CONST 287
#define NUMBER 288
#define IDENTIFIER 289
#define STRING 290
#define IDENTIFIER_TYPE 291
#define AND 292
#define OR 293
#define NOT 294
#define XOR 295
#define OPEN_PAREN 296
#define CLOSE_PAREN 297
#define EXPON 298
#define NEGATION 299




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 51 "BMM_Parser.Y"

    int num;
    char *str;



/* Line 1676 of yacc.c  */
#line 147 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


