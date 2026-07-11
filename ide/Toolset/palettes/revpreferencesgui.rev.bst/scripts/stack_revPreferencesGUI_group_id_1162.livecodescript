Script "stack_revPreferencesGUI_group_id_1162"

/*
# Name: group "sections" of card "Browser" of stack "revPreferencesGUI"
# ID: group id 1162 of card id 1010 of stack "revPreferencesGUI"
# Hash: p8zsjqfaLHWeSLu6RbCV2Q==
*/


on mouseUp
   local tSelectedSections, tSections
   put "Front scripts,Stacks,Back scripts,Stacks in use" into tSections
   repeat for each item tSection in tSections
      if the hilite of button tSection of me then
         put tSection & comma after tSelectedSections
      end if
   end repeat
   delete the last char of tSelectedSections
   
   updatePreference "pb_sections",tSelectedSections
end mouseUp
