#include"userinfo.hpp"

std::string* getuserinfo(){

	struct passwd *pw;
	uid_t uid;

	uid = geteuid();
	pw = getpwuid(uid);

	if (pw){
		return new std::string(pw->pw_name);
	}else{
		return new std::string("anonimus");
	}
}
