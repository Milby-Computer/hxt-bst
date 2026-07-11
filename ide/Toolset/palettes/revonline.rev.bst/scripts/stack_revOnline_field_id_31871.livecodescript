Script "stack_revOnline_field_id_31871"

/*
# Name: field "headline" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 31871 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: Mz60X444PvyCeTRi5FWaVA==
*/


on openField
   --if the text of me is "<Place a title for your code snippet here>" then
      --put empty into me
   --end if
   send "selectText" to me in 0 milliseconds
end openField

command selectText
   if the text of me is "<Place a headline for your code snippet here>" or \
          the text of me is "<Place a headline for your stack here>" or \
          the text of me is "<Place a headline for your external here>" then
      select the text of me
   end if
end selectText

on exitField
   if the text of me is empty then
      if the cType of the owner of me is "code snippet" then
         put "<Place a headline for your code snippet here>" into me
      else if the cType of the owner of me is "external" then
         put "<Place a headline for your external here>" into me
      else
         put "<Place a headline for your stack here>" into me
      end if
   end if
end exitField

on closeField
   if the text of me is empty then
      if the cType of the owner of me is "code snippet" then
         put "<Place a headline for your code snippet here>" into me
      else if the cType of the owner of me is "external" then
         put "<Place a headline for your external here>" into me
      else
         put "<Place a headline for your stack here>" into me
      end if
   end if
end closeField
