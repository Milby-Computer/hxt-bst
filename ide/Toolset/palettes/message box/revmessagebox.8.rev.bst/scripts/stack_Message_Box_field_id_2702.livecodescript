Script "stack_Message_Box_field_id_2702"

/*
# Name: field "type" of group "controls" of card "Global Variables" of stack "Message Box"
# ID: field id 2702 of group id 2704 of card id 2526 of stack "Message Box"
# Hash: hlROaGLPd5koxIwJglxq4Q==
*/


command revDisplayGlobals
   local tSelectedText, tDoString
   
   put line (the hilitedLine of me) of me into tSelectedText
   if tSelectedText is not empty then
      put "global" && tSelectedText & return & "put" && tSelectedText && "into field " & quote & "contents" & quote into tDoString
      do tDoString              
   end if
   if the hilitedLine of me is empty then disableFrameItem "removeSelected"
end revDisplayGlobals

on arrowKey
  send "revDisplayGlobals" to me in 10 milliseconds
  pass arrowKey
end arrowKey

on mouseUp
   if the hilitedLine of field "type" is empty 
   then disableFrameItem "removeSelected"
   else enableFrameItem "removeSelected"
  revDisplayGlobals
  pass mouseUp
end mouseUp
