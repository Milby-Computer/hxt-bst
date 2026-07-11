Script "stack_revideprojectbrowsercontrolrowtemplate_button_id_1013"

/*
# Name: button "controlIcon" of group "controlRow" of card id 1002 of stack "revideprojectbrowsercontrolrowtemplate"
# ID: button id 1013 of group id 1003 of card id 1002 of stack "revideprojectbrowsercontrolrowtemplate"
# Hash: FE2Yu0sYcp95axZqu6WsvQ==
*/


on mouseUp
   if the icon of me is the id of image "stackContracted" of card "templates" of this stack or the icon of me is the id of image "childContracted" of card "templates" of this stack then
      toggleGroup  the cRowNumber of the owner of me,true
   else if the icon of me is the id of image "stackExpanded" of card "templates" of this stack or the icon of me is the id of image "childExpanded" of card "templates" of this stack then
      toggleGroup  the cRowNumber of the owner of me,false
   end if
end mouseUp
