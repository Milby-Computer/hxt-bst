Script "stack_revGettingStartedScripts_button_id_1060"

/*
# Name: button "Generate String" of group "Repeating a string of text Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1060 of group id 1059 of card id 1002 of stack "revGettingStartedScripts"
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
