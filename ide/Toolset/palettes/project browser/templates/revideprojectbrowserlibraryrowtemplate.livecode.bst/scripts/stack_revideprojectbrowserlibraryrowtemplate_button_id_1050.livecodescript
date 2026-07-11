Script "stack_revideprojectbrowserlibraryrowtemplate_button_id_1050"

/*
# Name: button "typeIcon" of group "libraryRow" of card id 1002 of stack "revideprojectbrowserlibraryrowtemplate"
# ID: button id 1050 of group id 1044 of card id 1002 of stack "revideprojectbrowserlibraryrowtemplate"
# Hash: FE2Yu0sYcp95axZqu6WsvQ==
*/


on mouseUp
   if the icon of me is the id of image "stackContracted" of card "templates" of this stack or the icon of me is the id of image "childContracted" of card "templates" of this stack then
      toggleGroup  the cRowNumber of the owner of me,true
   else if the icon of me is the id of image "stackExpanded" of card "templates" of this stack or the icon of me is the id of image "childExpanded" of card "templates" of this stack then
      toggleGroup  the cRowNumber of the owner of me,false
   end if
end mouseUp
