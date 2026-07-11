Script "stack_revStandaloneSettings_button_id_1624"

/*
# Name: button "UAC Execution Level" of group "Windows" of card "Windows" of stack "revStandaloneSettings"
# ID: button id 1624 of group id 1169 of card id 1016 of stack "revStandaloneSettings"
# Hash: tsEjTq+ilXB5T4727ZvzAg==
*/


on menuPick pItemName
   local tValue
   put the cValue of me into tValue
   uacUpdateInfoField tValue
   
   if tValue is "default" then
      put empty into tValue
   end if
   
   set the cRevStandaloneSettings["Windows,uacExecutionLevel"] of stack the cRevTargetStack of this stack to tValue
end menuPick

getProp cValue
   return line (the menuHistory of me) of the cValues of me
end cValue

setProp cValue pValue
   local tLineNumber
   set the wholeMatches to true
   put lineOffset(pValue, the cValues of me) into tLineNumber
   set the wholeMatches to false
   
   if tLineNumber = 0 then
      exit cValue
   end if
   
   set the label of me to space
   set the label of me to line tLineNumber of the text of me
end cValue
