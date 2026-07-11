Script "stack_revStandaloneSettings_group_id_1086"

/*
# Name: group "Flavors" of card "OS X" of stack "revStandaloneSettings"
# ID: group id 1086 of card id 1015 of stack "revStandaloneSettings"
# Hash: QM28XgDaR9fCbZ5nb32K9g==
*/


on mouseUp
   put false into tEnable
   repeat with x=1 to the number of btns of me
      if the hilite of btn X of me then
         put revDownloadEngine(the cSettingTag of btn X of me) into tEnable
         if not tEnable then set the hilite of btn X of me to false
      end if
      set the cRevStandaloneSettings[the cSettingTag of btn X of me] of stack (the cRevTargetStack of this stack) to the hilite of btn X of me
   end repeat
   buildForEnabled "MacOSX"
   revSetEdit
   set the enabled of group "OSX" to tEnable 
end mouseUp
