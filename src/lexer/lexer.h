/**
 * Author: Jack Robbins
 *
 * This file defines the APIs for the Lexer for Otester
*/

#ifndef LEXER_H
#define LEXER_H

#define MAX_LEXEME_LENGTH 500

#include <stdio.h>

//Lexitem type for tokenizing
typedef struct lexitem_t lexitem_t;

/**
 * Tokens recognized by otester
 */
typedef enum {
	STRING_CONSTANT,

} token_t;


struct lexitem_t {
	token_t token;
	char lexeme[MAX_LEXEME_LENGTH + 1];
};

token_t get_next_token(FILE* fl);



#endif /* LEXER_H */
