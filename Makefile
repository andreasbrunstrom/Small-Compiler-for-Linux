CC = g++
CFLAGS += -Wall -g
OBJ =  lex.yy.o symbol.o parser.tab.o init.o  main.o
EXE = tree

lexer: parser.tab.hpp $(OBJ)
	$(CC) $(CFLAGS) -o $(EXE) $(OBJ) 

parser.tab.cpp parser.tab.hpp: parser.ypp
	bison -d parser.ypp

lex.yy.c: lexer.l
	flex lexer.l

main.o:     main.cpp global.h
	$(CC) -Wall -c main.cpp

symbol.o:       symbol.cpp global.h
	$(CC) -Wall -c symbol.cpp

init.o:         init.cpp global.h
	$(CC) -Wall -c init.cpp

clean:
	$(RM) $(EXE) $(OBJ) lex.yy.o lex.yy.c parser.tab.hpp parser.tab.cpp 29.tar.gz 29.zip *~
