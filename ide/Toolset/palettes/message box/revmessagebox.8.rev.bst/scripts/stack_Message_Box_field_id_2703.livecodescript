Script "stack_Message_Box_field_id_2703"

/*
# Name: field "contents" of group "controls" of card "Global Variables" of stack "Message Box"
# ID: field id 2703 of group id 2704 of card id 2526 of stack "Message Box"
# Hash: IKm5M3vl8O13rJGigHWjGw==
*/


on closeField
   local tSelectedText, tDoString
   put line (the hilitedLine of field "type") of field "type" into tSelectedText
    if tSelectedText is not empty then
      put "global" && tSelectedText & cr & "put field" && quote & "contents" & quote && "into" && tSelectedText into tDoString
      do tDoString
   end if
   pass closeField
end closeField

on enterInField
   send "closeField" to me
   select the text of me
end enterInField
