Script "stack_revOnline_field_id_70107"

/*
# Name: field "pages" of group "paging" of card "main" of stack "revOnline"
# ID: field id 70107 of group id 70106 of card id 1002 of stack "revOnline"
# Hash: iRhU1zKyprRA0s/7AK45aQ==
*/



on mousemove
   lock screen
   local tMouseText, tText, tTextToHilite
   put the text of me into tText
   put the mouseText into tMouseText
   local tWord
   put wordoffset(tMouseText, tText) into tWord
   put word tWord of tText into tTextToHilite
   clearColors (the long id of me)
   if tTextToHilite is not "." and tTextToHilite is not " " then
      set the textColor of word tWord of me to rvoHiliteColor()
   end if
   unlock screen
end mousemove

on mouseUp
   lock screen
   local tMouseText, tText
   put the text of me into tText
   put the mouseText into tMouseText
   set the itemdelimiter to space
   if tMouseText is not empty and tMouseText is not "." then
      local tItem
      put itemoffset(tMouseText, tText) into tItem
      clearStyles (the long id of me)
      selectPage (item tItem of me)      
      clearColors (the long id of me)
   end if
   unlock screen
end mouseUp

on mouseLeave
   --clearColors (the long id of me)
end mouseLeave
