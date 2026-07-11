Script "stack_revOnline_field_id_3623677"

/*
# Name: field "view as" of group "search order" of card "main" of stack "revOnline"
# ID: field id 3623677 of group id 78150 of card id 1002 of stack "revOnline"
# Hash: xMwJdaPqRjnz7Xu43jL13g==
*/



on mousemove
   lock screen
   local tText
   put the mouseText into tText
   clearColors
   switch tText
      case "List"
         set the textStyle of word 1 of me to "underline"
      break
      case "Grid"
         set the textStyle of word 3 of me to "underline"
      break
   end switch
   unlock screen
end mousemove

on mouseUp
   lock screen
   local tText
   put the mouseText into tText
   if tText is among the items of "List,Grid" then
      clearColors
      switch tText
         case "list"
            updateView "list"
         break
         case "grid"
            updateView "grid"
         break
      end switch
   end if
   unlock screen
end mouseUp

command clearColors
   repeat with x = 1 to the number of words of me
      set the textStyle of word x of me to empty
      set the textColor of word 2 of me to empty
      if word x of me is not the cSelectedView of the owner of me then
         --set the textColor of word x of me to (the foregroundcolor of stack "revonline") 
      end if
   end repeat
end clearColors

on mouseleave
   clearColors
end mouseleave
