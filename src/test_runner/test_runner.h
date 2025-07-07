/**
 * Author: Jack Robbins
 *
 * This header file defines APIs for the test runner
*/

#ifndef TEST_RUNNER_H
#define TEST_RUNNER_H

//Link to lexer
#include "../lexer/lexer.h"

//Top level structure to hold a test suite
typedef struct test_suite_t test_suite_t;
//Structure to hold an individual test action
typedef struct test_action_t test_action_t;

/**
 * A test suite can be made up of zero or many actions
 */
struct test_suite_t {

};


/**
 * An individual test action defines a run, and input and output files
 */
struct test_action_t {
	//The exec action is what will be ran via the "exec" path
	char exec_action[MAX_LEXEME_LENGTH + 1];
	

};


/**
 * Run a test suite that has been defined by the user
 */
void run_suite(test_suite_t* suite);


#endif /* TEST_RUNNER_H */

