#ifndef USERINFO_HPP
#define USERINFO_HPP
#include<iostream>
#include<unistd.h>
#include<pwd.h>
#include<climits>

#define clear() printf("\033[H\033[J")

std::string* getuserinfo();
std::string* getworkingdir(std::string* username);

#endif
