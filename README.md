
2021csb1107  2021csb125
kushagra sharma  priyanshu Kumar

I HAVE ATTACHED THE CORRECT PROGRAM TO BE TESTED IN FILE "CorrectSample.txt"
IF YOU WANT TO TEST ON InCorrectSample then change the file name to "IncorrectSample.txt" which has an error at line 5

FOR RUNNING THE CODE TYPE FOLLOWING COMMAND:

flex BMM_Scanner.l;
bison -dy BMM_Parser.Y;
gcc lex.yy.c y.tab.c;
./a.exe;
