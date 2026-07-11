Script "stack_revideprojectbrowsersectionrowtemplate_button_id_1048"

/*
# Name: button "typeIcon" of group "sectionRow" of card id 1002 of stack "revideprojectbrowsersectionrowtemplate"
# ID: button id 1048 of group id 1044 of card id 1002 of stack "revideprojectbrowsersectionrowtemplate"
# Hash: KoxrccBbjd6QJPM03oGgyA==
*/


on mouseUp
   if the icon of me is the id of image "contracted" of card "templates" of this stack then
      set the icon of me to the id of image "expanded" of card "templates" of this stack
      --set the hoverIcon of me to the id of image "expanded_hover" of card "templates" of this stack
      toggleGroup  the cRowNumber of the owner of me,true
   else if the icon of me is the id of image "expanded" of card "templates" of this stack then
      set the icon of me to the id of image "contracted" of card "templates" of this stack
      --set the hoverIcon of me to the id of image "contracted_hover" of card "templates" of this stack
      toggleGroup  the cRowNumber of the owner of me,false
   end if
end mouseUp
