Script "stack_SmartProperties_button_id_11369"

/*
# Name: button "GetR" of group "BtnGroup" of card id 1002 of stack "SmartProperties"
# ID: button id 11369 of group id 11393 of card id 1002 of stack "SmartProperties"
# Hash: L5BGE59DOCrB026GhRD5tQ==
*/


on mouseUp
  if the mode of this stack is 1
  then
    if the optionKey is down
    then GetProps the name of this stack,"R"
    else if the shiftKey is down
    then GetProps the name of this cd,"R"
    else  GetProps the target,"R"
  else
    if the optionKey is down
    then GetProps the name of the topStack,"R"
    else if the shiftKey is down
    then GetProps the long name of this cd of the topStack,"R"
    else
      if the selectedObject is not empty
      then GetProps the selectedObject,"R"
    end if
  end if
end mouseUp
