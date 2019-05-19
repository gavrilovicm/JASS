%option noinput
%option nounput
%option noyywrap
%{
#include<iostream>



#include"parser.tab.hpp"
%}

%%

[()+*/\n-] {
	return *yytext;
}

(-)?([0-9]|[1-9][0-9]+) {
	yylval.int_type = atoi(yytext);
	return num_tok;
}

. {
	std::cerr << "Nepoznat token: " << *yytext << std::endl;
	exit(EXIT_FAILURE);
}
%%
