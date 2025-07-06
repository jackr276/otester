# Author: Jack Robbins
# Makefile for Oteser

#Use gcc for compilation
CC = gcc
CFLAGS = -Wall -Wextra -c
LEXER_PATH = ./src/lexer
OUTPUT_DIRECTORY = ./out

lexer.o: $(LEXER_PATH)/lexer.c
	$(CC) $(CFLAGS) $(LEXER_PATH)/lexer.c -o $(OUTPUT_DIRECTORY)/lexer.o

main.o: ./src/main.c
	$(CC) $(CFLAGS) ./src/main.c -o $(OUTPUT_DIRECTORY)/main.o

otester: main.o lexer.o
	$(CC) $(OUTPUT_DIRECTORY)/main.o $(OUTPUT_DIRECTORY)/lexer.o -o $(OUTPUT_DIRECTORY)/otester
