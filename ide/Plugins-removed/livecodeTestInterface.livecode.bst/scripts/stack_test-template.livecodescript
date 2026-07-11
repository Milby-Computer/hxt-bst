Script "stack_test-template"

/*
# Name: stack "test-template" of stack "livecodeTestInterface"
# ID: stack "test-template" of stack "livecodeTestInterface"
# Hash: bcLdD4UnSpfLQ1cTf2klQA==
*/


// The tests to execute
------------------

// Any command in the stack script that starts with "test_"
// is considered a test to be run and is executed in the test framework.

// All tests should make use of the assert command to evaluate an expression
// The assert command has the following forms
// assert tExpr -- an expression which is expected to evaluate to true
// assert true tExpr -- an expression which is expected to evaluate to true
// assert false tExpr -- an expression which is expected to evaluate to false
// assert failure tExpr -- an expression which is expected to cause an error when evaluated
// assert success tExpr -- an expression which may be true or false but should not cause an error

// See the following examples:

on test_addition_true
   // This is a test that will pass.
   assert true 1+1=2
end test_addition_true

on test_addition_false
   // This is a test that will cause an error
   assert false 1+1=3
end test_addition_false

on test_addition_fail
   // This is a test that will cause an error
   local tArg1,tArg2, tCode
   put 1 into tArg1
   put "a" into tArg2
   
   assert failure tArg1 + tArg2 = 1
end test_addition_fail
