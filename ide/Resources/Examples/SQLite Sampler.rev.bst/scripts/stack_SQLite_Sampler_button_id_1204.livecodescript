Script "stack_SQLite_Sampler_button_id_1204"

/*
# Name: button "Show Text" of bkgnd "altFldHeader" of stack "SQLite Sampler"
# ID: button id 1204 of bkgnd id 1031 of stack "SQLite Sampler"
# Hash: rp2WwZfsSJc7zIX8059vnA==
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
  if there is a fld "theText" then Viewer the htmltext of fld "theText"
end mouseUp
