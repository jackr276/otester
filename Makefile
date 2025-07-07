# Author: Jack Robbins
# Makefile for Oteser

#Use gcc for compilation
CC = gcc
CFLAGS = -Wall -Wextra -c
LEXER_PATH = ./src/lexer
TEST_RUNNER_PATH = ./src/test_runner
DYNAMIC_ARRAY_PATH = ./src/dynamic_array
OUTPUT_DIRECTORY = ./out

test_runner.o: $(TEST_RUNNER_PATH)/test_runner.c
	$(CC) $(CFLAGS) $(TEST_RUNNER_PATH)/test_runner.c -o $(OUTPUT_DIRECTORY)/test_runner.o

lexer.o: $(LEXER_PATH)/lexer.c
	$(CC) $(CFLAGS) $(LEXER_PATH)/lexer.c -o $(OUTPUT_DIRECTORY)/lexer.o

dynamic_array.o: $(DYNAMIC_ARRAY_PATH)/dynamic_array.c
	$(CC) $(CFLAGS) $(DYNAMIC_ARRAY_PATH)/dynamic_array.c -o $(OUTPUT_DIRECTORY)/dynamic_array.o

main.o: ./src/main.c
	$(CC) $(CFLAGS) ./src/main.c -o $(OUTPUT_DIRECTORY)/main.o

otester: main.o lexer.o test_runner.o
	$(CC) $(OUTPUT_DIRECTORY)/main.o $(OUTPUT_DIRECTORY)/lexer.o $(OUTPUT_DIRECTORY)/dynamic_array.o $(OUTPUT_DIRECTORY)/test_runner.o -o $(OUTPUT_DIRECTORY)/otester
