# Author: Jack Robbins
# Makefile for Oteser

#Use gcc for compilation
CC = gcc
CFLAGS = -Wall -Wextra -c
LEXER_PATH = ./src/lexer
TEST_RUNNER_PATH = ./src/test_runner
DYNAMIC_ARRAY_PATH = ./src/dynamic_array
OUTPUT_DIRECTORY = ./out
# For use in CI runs
OUTPUT_DIRECTORY_CI = $$RUNNER_TEMP

test_runner.o: $(TEST_RUNNER_PATH)/test_runner.c
	$(CC) $(CFLAGS) $(TEST_RUNNER_PATH)/test_runner.c -o $(OUTPUT_DIRECTORY)/test_runner.o

lexer.o: $(LEXER_PATH)/lexer.c
	$(CC) $(CFLAGS) $(LEXER_PATH)/lexer.c -o $(OUTPUT_DIRECTORY)/lexer.o

dynamic_array.o: $(DYNAMIC_ARRAY_PATH)/dynamic_array.c
	$(CC) $(CFLAGS) $(DYNAMIC_ARRAY_PATH)/dynamic_array.c -o $(OUTPUT_DIRECTORY)/dynamic_array.o

main.o: ./src/main.c
	$(CC) $(CFLAGS) ./src/main.c -o $(OUTPUT_DIRECTORY)/main.o

otester: main.o lexer.o test_runner.o dynamic_array.o
	$(CC) $(OUTPUT_DIRECTORY)/main.o $(OUTPUT_DIRECTORY)/lexer.o $(OUTPUT_DIRECTORY)/dynamic_array.o $(OUTPUT_DIRECTORY)/test_runner.o -o $(OUTPUT_DIRECTORY)/otester

test_run: otester
	$(OUTPUT_DIRECTORY)/otester

## CI versions of the same events

test_runner-CI.o: $(TEST_RUNNER_PATH)/test_runner.c
	$(CC) $(CFLAGS) $(TEST_RUNNER_PATH)/test_runner.c -o $(OUTPUT_DIRECTORY_CI)/test_runner.o

lexer-CI.o: $(LEXER_PATH)/lexer.c
	$(CC) $(CFLAGS) $(LEXER_PATH)/lexer.c -o $(OUTPUT_DIRECTORY_CI)/lexer.o

dynamic_array-CI.o: $(DYNAMIC_ARRAY_PATH)/dynamic_array.c
	$(CC) $(CFLAGS) $(DYNAMIC_ARRAY_PATH)/dynamic_array.c -o $(OUTPUT_DIRECTORY_CI)/dynamic_array.o

main-CI.o: ./src/main.c
	$(CC) $(CFLAGS) ./src/main.c -o $(OUTPUT_DIRECTORY_CI)/main.o

otester-CI: main-CI.o lexer-CI.o test_runner-CI.o dynamic_array-CI.o
	$(CC) $(OUTPUT_DIRECTORY_CI)/main.o $(OUTPUT_DIRECTORY_CI)/lexer.o $(OUTPUT_DIRECTORY_CI)/dynamic_array.o $(OUTPUT_DIRECTORY_CI)/test_runner.o -o $(OUTPUT_DIRECTORY_CI)/otester

test_run-CI: otester-CI
	$(OUTPUT_DIRECTORY_CI)/otester

