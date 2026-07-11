Script "stack_SQLite_Sampler_button_id_1205"

/*
# Name: button "Show Script" of bkgnd "altFldHeader" of stack "SQLite Sampler"
# ID: button id 1205 of bkgnd id 1031 of stack "SQLite Sampler"
# Hash: 5w1y07NGFi814kZL3HYt2g==
*/


--on mouseEnter
--  set the foreColor of me to 249,156,27
--  set the opaque of me to true
--  set the showBorder of me to true
--end mouseEnter
--
--on mouseLeave
--  set the foreColor of me to 145,152,160
--  set the opaque of me to false
--end mouseLeave

on mouseUp
  if there is a fld "Sample" then Viewer the htmltext of fld "Sample"
end mouseUp
