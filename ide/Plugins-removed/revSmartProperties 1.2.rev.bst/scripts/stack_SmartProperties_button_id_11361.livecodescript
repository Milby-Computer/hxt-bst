Script "stack_SmartProperties_button_id_11361"

/*
# Name: button "GetL" of group "BtnGroup" of card id 1002 of stack "SmartProperties"
# ID: button id 11361 of group id 11393 of card id 1002 of stack "SmartProperties"
# Hash: nc9HZznPOWBGSPuzvi+t3w==
*/


on mouseUp
  if the mode of this stack is 1
  then
    if the optionKey is down
    then GetProps the name of this stack,"L"
    else if the shiftKey is down
    then GetProps the name of this cd,"L"
    else GetProps the target,"L"
  else
    if the optionKey is down
    then GetProps the name of the topStack,"L"
    else if the shiftKey is down
    then GetProps the long name of this cd of the topStack,"L"
    else
      if the selectedObject is not empty
      then GetProps the selectedObject,"L"
    end if
  end if
end mouseUp



















































































































