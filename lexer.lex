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
	return ls_tok;
}
pwd {
	return pwd_tok;
}
chusername {
	return chusername_tok;
}
[a-zA-Z][a-zA-Z0-9]* {
	yylval.s = yytext;
	return id_tok;
}
(-)[a-zA-Z]+ {
	yylval.s = yytext;
	return ls_flags_tok;
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
