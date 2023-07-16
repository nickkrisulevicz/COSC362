/*I pledge my honor that I have not cheated, and will not cheat, on this assignment.*/

/*Nick Krisulevicz*/
/*COSC 362*/
/*Project 1*/
/*10/09/2022*/
/*tiny.l*/

%option yylineno
%option noyywrap

%{
	#define DEBUG 1
	typedef YYTOKENTYPE Token;
	Token scanned(Token t);
%}

digit [0-9]+
id [a-z][a-z0-9]*

%%

"error" {return scanned(ERROR);}
<<EOF>> {return scanned(ENDFILE);}

if {return scanned(IF);}
then {return scanned(THEN);}
else {return scanned(ELSE);}
end {return scanned(END);}
repeat {return scanned(REPEAT);}
until {return scanned(UNTIL);}
read {return scanned(READ);}
write {return scanned(WRITE);}

over {return scanned(OVER);}

{id} {return scanned(ID);}
{digit} {return scanned(NUM);}

":=" {return scanned(ASSIGN);}
"==" {return scanned(EQ);}
"<" {return scanned(LT);}
"+" {return scanned(PLUS);}
"-" {return scanned(MINUS);}
"*" {return scanned(TIMES);}
"(" {return scanned(LPAREN);}
")" {return scanned(RPAREN);}
";" {return scanned(SEMI);}

"{" {char c = input(); while(c != '}' && c != EOF) c = input();}

%%

/*process and return scanned token t*/
Token scanned(Token t){
	if(DEBUG == 0) return t;
	switch(t){
		case ERROR: printf("ERROR "); return t;
		case ENDFILE: printf("ENDFILE\n "); return t;\
		case IF: printf("IF "); return t;
		case THEN: printf("THEN "); return t;
		case ELSE: printf("ELSE "); return t;
		case END: printf("END "); return t;
		case REPEAT: printf("REPEAT "); return t;
		case UNTIL: printf("UNTIL "); return t;
		case READ: printf("READ "); return t;
		case WRITE: printf("WRITE "); return t;
		case ID: printf("ID(%s) ", yytext); return t;
		case NUM: printf("NUM(%s) ", yytext); return t;
		case ASSIGN: printf("ASSIGN "); return t;
		case EQ: printf("EQ "); return t;
		case LT: printf("LT "); return t;
		case PLUS: printf("PLUS "); return t;
		case MINUS: printf("MINUS "); return t;
		case TIMES: printf("TIMES "); return t;
		case OVER: printf("OVER "); return t;
		case LPAREN: printf("LPAREN "); return t;
		case RPAREN: printf("RPAREN "); return t;
		case SEMI: printf("SEMI "); return t;
		default: printf("ERROR: Invalid token in scanned(). \n"); exit(-1);
	}
}
