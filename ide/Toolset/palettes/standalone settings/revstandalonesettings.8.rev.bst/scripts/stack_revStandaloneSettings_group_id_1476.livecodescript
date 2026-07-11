Script "stack_revStandaloneSettings_group_id_1476"

/*
# Name: group "Flavors" of card "UNIX" of stack "revStandaloneSettings"
# ID: group id 1476 of card id 1035 of stack "revStandaloneSettings"
# Hash: skrx5BtStPf6cvRmxKwmDw==
*/


on mouseUp
  local tEnable
  put false into tEnable
  repeat with x = 1 to the number of buttons of me
    if the hilite of button x of me then
      put revDownloadEngine(the short name of button x of me) into tEnable
      if not tEnable then
        set the hilite of button x of me to false
      end if
    end if
    set the cRevStandaloneSettings[the short name of button x of me] of stack the cRevTargetStack of this stack to the hilite of button x of me
  end repeat
  buildForEnabled "Linux"
  revSetEdit
  set the enabled of group "UNIX" to tEnable 
end mouseUp
