Script "stack_File_Attribs_card_id_1532"

/*
# Name: card "Multiline Text Field" of stack "File Attribs"
# ID: card id 1532 of stack "File Attribs"
# Hash: +yzrFprlbdICi/Ylhux9fQ==
*/


on closeCard
   inputDelete
end closeCard

on inputCreate
   if "testinput" is among the lines of iphoneControls() then
      inputDelete
   end if
   
   iphoneControlCreate "multiline", "testinput"
   iphoneControlSet "testinput", "rect", the rect of graphic "InputRect"
   iphoneControlSet "testinput", "visible", true
   updateFieldProps
end inputCreate

on inputDelete
   iphoneControlDelete "testinput"
end inputDelete

on inputFocus
   iphoneControlDo "testinput", "focus"
end inputFocus

on menuPick
   if word 1 of the name of the target is "button" then
      updateFieldProps
   end if
end menuPick

on mouseUp
   if word 1 of the name of the target is "button" then
      updateFieldProps
   end if
end mouseUp

on closeField
   updateFieldProps
end closeField

on updateFieldProps
   if "testinput" is not among the lines of iphoneControls() then
      exit updateFieldProps
   end if
   
   repeat with x = 1 to the number of controls
      if word 1 of the short name of control x is not "property" then
         next repeat
      end if
      
      local tValue
      if word 1 of the name of control x is "button" then
         if the style of control x is "menu" then
            put the label of control x into tValue
         else if the style of control x is "checkbox" then
            put the hilite of control x into tValue
         end if
      else if word 1 of the name of control x is "field" then
         put the text of control x into tValue
      end if
      
      iphoneControlSet "testinput", word 2 of the short name of control x, tValue
   end repeat
   
   get empty
   repeat for each word tWord in "opaque backgroundColor borderStyle"
      put tWord & "=" & iphoneControlGet("testinput", tWord) & return after it
   end repeat
   put it into field "Log"
end updateFieldProps

on inputBeginEditing
   put "beginEditing" & return before field "Log"
end inputBeginEditing

on inputEndEditing
   put "endEditing" & return before field "Log"
end inputEndEditing

on inputTextChanged
   put "textChanged" & return before field "Log"
   put iphoneControlGet("testinput", "text") into field "property Text"
end inputTextChanged

on inputReturnKey
   put "returnKey" & return before field "Log"
   focus on field "FocusField"
end inputReturnKey
