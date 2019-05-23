%option noinput
%option nounput
%option noyywrap
%{
#include<iostream>
#include<cstring>



#include"parser.tab.hpp"
%}

%%
clear {
	return clear_tok;
}
ls {
	return list_tok;
}
(-)[a-zA-Z]+ {
	yylval.s = yytext;
	return list_flags_tok;
}
[()%+*/\n-] {
	return *yytext;
}

([0-9]|[1-9][0-9]+) {
	yylval.int_type = atoi(yytext);
	return num_tok;
}
[ \t] {}
. {
	std::cerr << "Nepoznat token: " << *yytext << std::endl;
	exit(EXIT_FAILURE);
}
%%
