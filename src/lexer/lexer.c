/**
 * Author: Jack Robbins
 * This file contains the implementations for the APIs defined in lexer.h
*/

#include "lexer.h"
#include <stdio.h>
#include <string.h>

char keyword_array[] = {};
token_t token_array[] = {REPORTLOCATION, BEGIN, END, EXECUTE};

/**
 * Is a processed token a lexitem or a keyword?
 */
static void identifier_or_keyword(lexitem_t* lexitem){
}


/**
 * Consume the next token and update the seek head
*/
lexitem_t get_next_token(FILE* fl){
	//Declare a top level lexitem
	lexitem_t lexitem;
	
	//Wipe it clean
	memset(&lexitem, 0, sizeof(lexitem_t));

	//Grab a pointer to the lexeme
	char* str_ptr = lexitem.lexeme;

	//The current char
	char ch;

	//So long as we are not at the end of file
	//We'll also break out if we see a token
	while((ch = fgetc(fl)) != EOF){
		switch(ch){

		}
	}

	//Give back the lexitem
	return lexitem;
}
