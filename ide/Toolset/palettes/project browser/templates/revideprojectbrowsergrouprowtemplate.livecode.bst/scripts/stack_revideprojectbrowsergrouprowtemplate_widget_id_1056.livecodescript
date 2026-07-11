Script "stack_revideprojectbrowsergrouprowtemplate_widget_id_1056"

/*
# Name: widget "icon" of group "connector1" of group "groupRow" of card id 1002 of stack "revideprojectbrowsergrouprowtemplate"
# ID: widget id 1056 of group id 1055 of group id 1044 of card id 1002 of stack "revideprojectbrowsergrouprowtemplate"
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

