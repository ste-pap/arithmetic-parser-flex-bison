#include <iostream>
#include <stdlib.h>

#include "Grammar.tab.h"
extern FILE *yyin;

int main(int argc, char* argv[]) {
	
	fopen_s(&yyin, "test.txt", "r");
	yy::parser* p = new yy::parser();
	p->parse();

	return 0;
}