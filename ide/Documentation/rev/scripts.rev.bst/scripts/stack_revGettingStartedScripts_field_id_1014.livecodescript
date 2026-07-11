Script "stack_revGettingStartedScripts_field_id_1014"

/*
# Name: field "Animation" of group "Scrolling text banner Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1014 of group id 1012 of card id 1002 of stack "revGettingStartedScripts"
# Hash: QgN2jVzOOgl1S5bI/We5zw==
*/


on mouseUp
  put "                                   " \
      & "You too can be a winner!" into me
  repeat until the text of me is empty
    -- shift everything one character to the left:
    delete first character of me
    wait 6 ticks -- 1/10th of a second
  end repeat
end mouseUp
