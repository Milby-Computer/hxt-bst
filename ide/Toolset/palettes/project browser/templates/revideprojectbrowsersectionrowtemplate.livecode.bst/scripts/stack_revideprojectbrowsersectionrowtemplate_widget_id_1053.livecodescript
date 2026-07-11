Script "stack_revideprojectbrowsersectionrowtemplate_widget_id_1053"

/*
# Name: widget "icon" of group "connector1" of group "sectionRow" of card id 1002 of stack "revideprojectbrowsersectionrowtemplate"
# ID: widget id 1053 of group id 1052 of group id 1044 of card id 1002 of stack "revideprojectbrowsersectionrowtemplate"
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

