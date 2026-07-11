Script "stack_revResourceCenter_field_id_579815"

/*
# Name: field "Animation" of group "Example" of group id 579816 of group "mainContent" of card "Scrollingtextbanner" of stack "revResourceCenter"
# ID: field id 579815 of group id 577025 of group id 579816 of group id 80247 of card id 80237 of stack "revResourceCenter"
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
