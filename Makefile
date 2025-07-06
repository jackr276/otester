# Author: Jack Robbins
# Makefile for Oteser

#Use gcc for compilation
CC = gcc
CFLAGS = -Wall -Wextra -c
OUTPUT_DIRECTORY = ./out



main.o: ./src/main.c
	$(CC) $(CFLAGS) ./src/main.c -o $(OUTPUT_DIRECTORY)/main.o

otester: $(OUTPUT_DIRECTORY)/main.o
	$(CC) $(OUTPUT_DIRECTORY)/main.o -o $(OUTPUT_DIRECTORY)/otester
