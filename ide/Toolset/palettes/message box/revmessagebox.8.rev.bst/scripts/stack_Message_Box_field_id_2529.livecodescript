Script "stack_Message_Box_field_id_2529"

/*
# Name: field "type" of group "controls" of card "Global Properties" of stack "Message Box"
# ID: field id 2529 of group id 2535 of card id 2525 of stack "Message Box"
# Hash: NdrGCfEFPH7tPJq+wFS3oA==
*/


command revDisplayProperties
   local tSelectedText, tPropertyRange
   
   put line (the hilitedLine of me) of me into tSelectedText
   put revIDEGlobalPropertyRange(tSelectedText) into tPropertyRange
   
   if tPropertyRange is not empty then
      enable field "contents"
      set the cREVFieldStyle of this card to "List"
      put tPropertyRange into field "contents"
      lock messages
      do "select line lineOffset(the" && tSelectedText & ", field" && quote & "Contents" & quote & ") of field" && quote & "contents" & quote
      focus field "Type"
      unlock messages
      put empty into field "values range"
   else 
      if tSelectedText is not empty then
         enable field "contents"
         set the cREVFieldStyle of this card to"Editable"
         do "put the" && tSelectedText && "into field" && quote & "contents" & quote
         put revIDEGlobalPropertyContinuousRange(tSelectedText) into field "values range"
      else
         disable field "contents"
         put empty into field "contents"
      end if
   end if
end revDisplayProperties

on arrowKey
  send "revDisplayProperties" to me in 10 milliseconds
  pass arrowKey
end arrowKey

on mouseUp
   revDisplayProperties
   pass mouseUp
end mouseUp
