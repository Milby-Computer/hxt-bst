Script "stack_revResourceCenter_field_id_813286"

/*
# Name: field "Label" of group "ib0v3wpq5054nlii2lng7m6ia5x012fr" of group "Tree" of bkgnd "group id 2127" of stack "revResourceCenter"
# ID: field id 813286 of group id 813284 of group id 1034 of bkgnd id 2127 of stack "revResourceCenter"
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

