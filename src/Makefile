TARGET = jass
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17

$(TARGET) : parser.tab.o lex.yy.o userinfo.o matrix.o
	$(CXX) $(CXXFLAGS) -o $@ $^

matrix.o : matrix.cpp matrix.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

userinfo.o : userinfo.cpp userinfo.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

parser.tab.o : parser.tab.cpp parser.tab.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

parser.tab.cpp parser.tab.hpp : parser.ypp
	bison -vd $<

lex.yy.o : lex.yy.c parser.tab.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

lex.yy.c : lexer.lex
	flex $<

.PHONY:clean

clean:
	rm *.o *.tab.* *.output lex.yy.c $(TARGET)
