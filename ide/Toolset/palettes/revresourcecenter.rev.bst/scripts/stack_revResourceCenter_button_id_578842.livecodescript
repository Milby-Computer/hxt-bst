Script "stack_revResourceCenter_button_id_578842"

/*
# Name: button "Generate String" of group "Example" of group id 578850 of group "mainContent" of card "Repeatingastringoftext" of stack "revResourceCenter"
# ID: button id 578842 of group id 578841 of group id 578850 of group id 109247 of card id 109229 of stack "revResourceCenter"
# Hash: zub4sWENOT7C34Pa0ZOZkQ==
*/


on mouseUp
  put repeatedString(field "String",field "Number") into field "Result"
end mouseUp
 
function repeatedString theString,numberOfTimes
  if numberOfTimes is empty \
      or numberOfTimes is not an integer \
      then put 1 into numberOfTimes
  repeat for numberOfTimes
    put theString after finalString
  end repeat
  return finalString
end repeatedString 
