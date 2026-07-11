Script "stack_SmartProperties_button_id_11373"

/*
# Name: button "StackHeightFlipper" of group "BtnGroup" of card id 1002 of stack "SmartProperties"
# ID: button id 11373 of group id 11393 of card id 1002 of stack "SmartProperties"
# Hash: GLTWUasBnhuUjTr70rUNPw==
*/


on mouseUp
  global gFlipper
  
  put true into gFlipper
  lock screen
  
  if the hilite of me
  then
    set the toolTip of me to "Reveal Preferences panel"
    set the cRevGeometry["Master","scaleBottomDistance"] of group "PropsGroup" to -13
    set the cRevGeometry["Master","movevDistance"] of group "BtnGroup" to -7
    set the cRevGeometry["Master","movevDistance"] of group "Preferences" to 100
    set the rect of this stack to the topLeft of this stack, the right of this stack, the bottom of this stack - the cDeltaStackHeight of me
    set the minHeight of this stack to 137
  else
    set the toolTip of me to "Hide Preferences panel"
    set the cRevGeometry["Master","scaleBottomDistance"] of group "PropsGroup" to -13 -the cDeltaStackHeight of me
    set the cRevGeometry["Master","movevDistance"] of group "BtnGroup" to -7 -the cDeltaStackHeight of me
    set the cRevGeometry["Master","movevDistance"] of group "Preferences" to -81
    set the rect of this stack to the topLeft of this stack, the right of this stack, the bottom of this stack + the cDeltaStackHeight of me
    set the minHeight of this stack to 137 + the cDeltaStackHeight of me
  end if
end mouseUp
