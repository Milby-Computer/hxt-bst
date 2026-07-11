Script "stack_SmartProperties_button_id_11385"

/*
# Name: button "Check" of group "Checkboxes:" of group "Preferences" of card id 1002 of stack "SmartProperties"
# ID: button id 11385 of group id 11386 of group id 11392 of card id 1002 of stack "SmartProperties"
# Hash: EbwAE25up2RVe9VO0FEgGg==
*/


on mouseUp
  lock screen
  
  repeat with i=1 to number of btns of group "CkeckboxesGroup"
    if the visible of btn i of group "CkeckboxesGroup"
    then
      switch the hilitedButtonName of group "Checkboxes:"
      case "All"
        set the hilited of btn i of group "CkeckboxesGroup" to true
        break
        
      case "None"
        set the hilited of btn i of group "CkeckboxesGroup" to false
        break
        
      case "Matching"
        set the hilited of btn i of group "CkeckboxesGroup" to (fld i of group "LValuesGroup" = fld i of group "RValuesGroup")
        break
        
      case "Non-matching"
        set the hilited of btn i of group "CkeckboxesGroup" to (fld i of group "LValuesGroup" <> fld i of group "RValuesGroup")
        break
      end switch
    end if
  end repeat
 
  UpdateCopyBtns
end mouseUp
