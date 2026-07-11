Script "stack_Ask_Dialog_button_id_1116"

/*
# Name: button "OK" of card "card id 1002" of stack "Ask Dialog"
# ID: button id 1116 of card id 1002 of stack "Ask Dialog"
# Hash: eIBkj5qPMZGrme/kWmHOlw==
*/


on mouseUp
  --  switch the fieldmode of this card
  --  case "plain"
  --  case "question"
  --  case "error"
  --  case "information"
  --  case "warning"
  --    get field 2
  --    break
  --  case "clear"
  --    get field 3
  --    break
  --  case "password"
  --    get mcencrypt(field 3)
  --    break
  --  end switch
  --  set the dialogData to it
  --  lock messages
  --  close this stack
  --  revCleanUpAskDialog--won't get closeStack
  --  unlock messages
  closeAccept
end mouseUp
