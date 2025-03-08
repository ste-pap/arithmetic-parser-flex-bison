
%language "C++"


%{
#include "Grammar.tab.h"
extern int yylex(yy::parser::semantic_type *yylval);
%}


%union{
	int i;
	float f;
}

%type <i> expression

%start compileUnit
%token <i> NUMBER
%left '+' '-'
%left '*' '/'


%%

compileUnit : statements
		;

statements : statement
		| statements statement
		;

statement : expression ';'	{ printf("\nResult: %d",$1); }
		| ';'
		;

expression : NUMBER	{ $$ = $1;}
		| expression '+' expression	{ $$ = $1 + $3; }
		| expression '-' expression	{ $$ = $1 - $3; }
		| expression '*' expression	{ $$ = $1 * $3; }
		| expression '/' expression	{ $$ = $1 / $3; }
		;

%%

namespace yy{
	void parser::error(const location_type& loc, const std::string& msg){
		std::cerr << "error at" << loc << ": " << msg << std::endl;
	}
}