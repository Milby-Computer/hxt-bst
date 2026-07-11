Script "stack_revStandaloneSettings_field_id_1254"

/*
# Name: field "stacks" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: field id 1254 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: zNO0JlYeErYyr2x/bjQCUw==
*/



on arrowKey
  send "mouseUp" to me in 10 milliseconds
  pass arrowKey
end arrowKey

on mouseUp
  local tHilitedStacks,tSettings,tStack
  if the hilitedLines of field "stacks" is not empty then
    put the hilitedStacks of me into tHilitedStacks
    put the cRevStandaloneSettings["destroyStack"] of stack (line 1 of tHilitedStacks) into tSettings["destroyStack"]
    put the cRevStandaloneSettings["password"] of stack (line 1 of tHilitedStacks) into tSettings["password"]
    put the cRevStandaloneSettings["moveImages"] of stack (line 1 of tHilitedStacks) into tSettings["moveImages"]
    repeat for each line tStack in line 2 to -1 of tHilitedStacks
      if the cRevStandaloneSettings["destroyStack"] of stack tStack <> tSettings["destroyStack"] then
        put "false" into tSettings["destroyStack"]
      end if
      if the cRevStandaloneSettings["password"] of stack tStack <> tSettings["password"] then
        put "" into tSettings["password"]
      end if
      if the cRevStandaloneSettings["moveImages"] of stack tStack <> tSettings["moveImages"] then
        put "false" into tSettings["moveImages"]
      end if
    end repeat
    set the hilite of btn "destroyStack" to tSettings["destroyStack"] = true
    set the hilite of btn "encrypt" to tSettings["password"] <> ""
    put tSettings["password"] into fld "encrypt"
  end if
  revSetEdit
end mouseUp

getProp hilitedStacks
   local tStacks,tHilitedStacks,tItem
   put fld "stacks" into tStacks
   repeat for each item tItem in the hilitedLines of field "stacks"
      put line tItem of tStacks & cr after tHilitedStacks
   end repeat
   delete char -1 of tHilitedStacks
   return tHilitedStacks
end hilitedStacks
