%option noinput
%option nounput
%option noyywrap
%{
#include<iostream>
#include<cstring>
#include"matrix.hpp"
#include<vector>
#include<string>
#include<cstring>


#include"parser.tab.hpp"
%}

%%
exit {
	return exit_tok;
}
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
matlab {
	return matlab_tok;
}
[a-zA-Z][a-zA-Z0-9]* {
	if (strlen(yytext) == 1){
		// Matrix variable name can only be one upper letter
		yylval.string_type = new std::string(yytext);
		return id_matrix_tok;
	}else{
		yylval.s = yytext;
		return id_tok;
	}
}

(-)[a-zA-Z]+ {
	yylval.s = yytext;
	return ls_flags_tok;
}
([0-9]|[1-9][0-9]+) {
	yylval.int_type = atoi(yytext);
	return num_tok;
}
([0-9]|[1-9][0-9]+)(\.([0-9]+))? {
	yylval.double_type = atof(yytext);
	return d_num_tok;
}
[(),%+=[\];*/\n-] {
	return *yytext;
}
[ \t] {}
. {
	std::cerr << "Unknown token: " << *yytext << std::endl;
	exit(EXIT_FAILURE);
}
%%
