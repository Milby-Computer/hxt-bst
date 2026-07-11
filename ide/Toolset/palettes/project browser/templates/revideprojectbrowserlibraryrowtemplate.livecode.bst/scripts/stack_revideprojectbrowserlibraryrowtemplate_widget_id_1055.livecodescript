Script "stack_revideprojectbrowserlibraryrowtemplate_widget_id_1055"

/*
# Name: widget "icon" of group "connector2" of group "libraryRow" of card id 1002 of stack "revideprojectbrowserlibraryrowtemplate"
# ID: widget id 1055 of group id 1054 of group id 1044 of card id 1002 of stack "revideprojectbrowserlibraryrowtemplate"
# Hash: 6tuVsAIws4x/8mLNX+oqWw==
*/


--on mouseUp
--   put the milliseconds && the cState of me
--   if the cState of me is "stackContracted" or the  cState of me is "childContracted" then
--      toggleGroup  the cRowNumber of the owner of me,true
--   else if the cState of me is"stackExpanded" or the cState of me is "childContracted" then
--      toggleGroup  the cRowNumber of the owner of me,false
--   end if
--end mouseUp

