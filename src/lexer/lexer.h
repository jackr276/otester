/**
 * Author: Jack Robbins
 *
 * This file defines the APIs for the Lexer for Otester
*/

#ifndef LEXER_H
#define LEXER_H

#define MAX_LEXEME_LENGTH 750 

#include <stdio.h>

//Lexitem type for tokenizing
typedef struct lexitem_t lexitem_t;

/**
 * Tokens recognized by otester
 */
typedef enum {
	STRING_CONSTANT,
	DASH, // -
	SEMICOLON,
	COLON,
	REPORTLOCATION, //ReportLocation keyword
	BEGIN,
	EXECUTE,
	END,
	RUN,
	SLASH,
	STAR,
	DONE, //The special done token
} token_t;


/**
 * What state is the lexer in?
 */
typedef enum {
	IN_START,
	IN_COMMENT,
	IN_IDENT,
	IN_STRING,
} lexstate_t ;


/**
 * The lexer item will hold a token and a lexeme
 */
struct lexitem_t {
	token_t token;
	char lexeme[MAX_LEXEME_LENGTH + 1];
};


/**
 * Get and return the next token in the token stream
 */
lexitem_t get_next_token(FILE* fl);

#endif /* LEXER_H */
