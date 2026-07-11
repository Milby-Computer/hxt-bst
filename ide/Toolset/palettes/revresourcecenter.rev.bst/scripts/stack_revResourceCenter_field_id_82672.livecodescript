Script "stack_revResourceCenter_field_id_82672"

/*
# Name: field "Label" of group "Template Branch" of bkgnd "group id 2127" of stack "revResourceCenter"
# ID: field id 82672 of group id 82667 of bkgnd id 2127 of stack "revResourceCenter"
# Hash: I54MFBGMhuOzcgcruO+J1Q==
*/


on preOpenStack
   pass preOpenStack
end preOpenStack

-- LG 2008-06-19
--on mouseUp
--   local tLabel
--   put the cLabel of the owner of me into tLabel
--   set the toolTip of the owner of me to tLabel
--   replace space with "" in tLabel
--   if there is a card tLabel and tLabel is not "UserGuide" then
--      lock cursor
--      set the cursor to watch
--      go to card tLabel
--      unlock cursor
--   else if tLabel is "UserGuide" then
--      documentationLaunchUserGuide
--   end if
--   pass mouseUp
--end mouseUp

on mouseEnter
   local tLabel
   put the cLabel of the owner of me into tLabel
   set the toolTip of me to tLabel
end mouseEnter

