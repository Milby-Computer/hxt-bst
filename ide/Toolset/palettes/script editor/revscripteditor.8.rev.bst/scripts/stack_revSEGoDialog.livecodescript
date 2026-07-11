Script "stack_revSEGoDialog"

/*
# Name: stack "revSEGoDialog" of stack "revNewScriptEditor"
# ID: stack "revSEGoDialog" of stack "revNewScriptEditor"
# Hash: vFzlX+VQ5W02E1f592AXqQ==
*/


command closeAccept
   set the cChoice of me to the text of field "Number" of me
   close me
end closeAccept

command closeReject
   set the cChoice of me to empty
   close me
end closeReject

on preOpenStack
   set the text of field "Label" of me to "Line number (1 - " & the cMaxLineNumber of me & "):"
   set the text of field "Number" of me to empty
   select before field "Number" of me
end preOpenStack

on escapeKey
   closeReject
end escapeKey

on commandKeyDown pKey
   if pKey is not "v" then
      pass commandKeyDown
   end if
   
   local tTextToPaste
   put line 1 of the clipboardData["text"] into tTextToPaste
   set the clipboardData["text"] to empty
   set the clipboardData["html"] to empty
   
   if tTextToPaste is an integer then
      set the clipboardData["text"] to tTextToPaste
   else
      exit commandKeyDown
   end if
   
   pass commandKeyDown
end commandKeyDown
  
on keyDown pKey
   if pKey is an integer then
      pass keyDown
   end if
end keyDown
