Script "stack_revStandaloneSettings_group_id_1283"

/*
# Name: group "plist" of group "OSX" of card "OS X" of stack "revStandaloneSettings"
# ID: group id 1283 of group id 1221 of card id 1015 of stack "revStandaloneSettings"
# Hash: m/oT9OOUHL8gYNbGmUePdA==
*/


on mouseUp
   local tSize
   switch the hilitedButtonName of me
      case "enter"
         # OK-2010-02-22: Bug 7879 - This should be set to empty otherwise the standalone builder will
         # still think we're using a user-defined plist file.
         set the cRevStandaloneSettings["OSX,plist"] of stack the cRevTargetStack of this stack to ""
         hide group "choose"
         show group "enter"
         put the cSize of group "enter" into tSize
         break
      case "choose"
         set the cRevStandaloneSettings["OSX,plist"] of stack the cRevTargetStack of this stack to ""
         show group "choose"
         hide group "enter"
         put the cSize of group "choose" into tSize
         break
   end switch
   revChangeWindowSize item 1 of the cSize of this card,tSize,"snap",,250
end mouseUp
