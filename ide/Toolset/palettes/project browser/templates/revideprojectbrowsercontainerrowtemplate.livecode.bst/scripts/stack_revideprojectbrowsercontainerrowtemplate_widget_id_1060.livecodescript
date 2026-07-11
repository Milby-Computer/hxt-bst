Script "stack_revideprojectbrowsercontainerrowtemplate_widget_id_1060"

/*
# Name: widget "icon" of group "disclosure" of group "containerRow" of card id 1002 of stack "revideprojectbrowsercontainerrowtemplate"
# ID: widget id 1060 of group id 1059 of group id 1044 of card id 1002 of stack "revideprojectbrowsercontainerrowtemplate"
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

