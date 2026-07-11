Script "stack_revStandaloneSettings_button_id_1234"

/*
# Name: button "Add Stack File..." of group "Basic Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: button id 1234 of group id 2037 of card id 1013 of stack "revStandaloneSettings"
# Hash: NWU5D86xiilkBCf/3wx3UQ==
*/


on mouseUp
   local filterstring,tIncludeList,tFiles,tType
   if the optionKey is not down then
      get revAnswerFiles("stack", "Select a stack file to add:")
      if it is empty then
         exit mouseUp
      end if
      revIncludeStackFiles it
      exit mouseUp
   else
      answer folder "Select a folder to add from:"
      if it is empty then exit mouseUp
      put the directory into tReturn
      set the directory to it
      put the files into tFiles
      repeat for each line tLine in tFiles
         put it&"/"&tLine & cr after tIncludeList
      end repeat
      delete char -1 of tIncludeList
      set the directory to tReturn
   end if
   revIncludeStackFiles tIncludeList
end mouseUp
