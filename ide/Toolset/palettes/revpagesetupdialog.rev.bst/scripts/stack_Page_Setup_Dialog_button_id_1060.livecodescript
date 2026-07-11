Script "stack_Page_Setup_Dialog_button_id_1060"

/*
# Name: button "Scale" of group "Paper Scale" of card "card id 1002" of stack "Page Setup Dialog"
# ID: button id 1060 of group id 1063 of card id 1002 of stack "Page Setup Dialog"
# Hash: W0f53vjLGgD3yCGoQLln9g==
*/


on menuPick pText
  set the cValue of me to pText
  pass menuPick
end menuPick

--on keyDown
--  set the cValue of me to the label of me
--  pass keyDown
--end keyDown

command updateValue
  set the cValue of me to the label of me
end updateValue



