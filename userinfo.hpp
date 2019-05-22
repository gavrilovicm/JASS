#ifndef USERINFO_HPP
#define USERINFO_HPP
#include<iostream>
#include<unistd.h>
#include<pwd.h>

#define clear() printf("\033[H\033[J")

std::string* getuserinfo();

#endif
