Script "stack_revideprojectbrowsercontrolrowtemplate_widget_id_1039"

/*
# Name: widget "icon" of group "connector9" of group "controlRow" of card id 1002 of stack "revideprojectbrowsercontrolrowtemplate"
# ID: widget id 1039 of group id 1038 of group id 1003 of card id 1002 of stack "revideprojectbrowsercontrolrowtemplate"
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

