Script "stack_revMenuManager_button_id_4867"

/*
# Name: button "Shortcut Checkbox" of bkgnd "Menu Item Controls" of stack "revMenuManager"
# ID: button id 4867 of bkgnd id 3265 of stack "revMenuManager"
# Hash: z3+6ZvJa5Ga5LBzhLuA9eg==
*/


on mouseUp
  lock screen
  revCheckNameChanged
  if the hilite of me then 
     enable fld "Shortcut"
     --------------------
     -- LG 2008-08-26
     enable button "Control"
     enable button "Command"
     enable button "Shift"
     enable button "Option_Alt"
     --------------------
    select the text of fld "Shortcut"
  else
    --remove Shortcut
    put empty into fld "Shortcut"
    send "revSetShortCut" to fld "Shortcut"
    disable fld "Shortcut"
    -------------------------
    -- LG 2008-08-26
    set the hilite of button "Control" to "false"
    set the hilite of button "Command" to "false"
    set the hilite of button "Option_Alt" to "false"
    set the hilite of button "Shift" to "false"
    disable button "Control"
    disable button "Command"
    disable button "Shift"
    disable button "Option_Alt"
    -------------------------
  end if
  unlock screen
end mouseUp

--on revSelectText
  select the text of fld "Shortcut"
end revSelectText
