Script "stack_ColorsPatterns_group_id_1014"

/*
# Name: group "BtnsGroup" of card id 1002 of stack "ColorsPatterns" of stack "SmartProperties"
# ID: group id 1014 of card id 1002 of stack "ColorsPatterns" of stack "SmartProperties"
# Hash: f8ykoit28xzPECrFtjnMlw==
*/


on mouseUp
  if the label of this stack is "Colors"
  then
    answer color with the backgroundColor of the target
    if the result is not "Cancel"
    then
      set the backgroundColor of the target to it
    end if
  else
    set the dialogData to the backgroundPattern of the target
    modal stack "ChoosePattern"
    if the dialogData is not empty
    then
      set the backgroundPattern of the target to the dialogData
    end if
  end if
end mouseUp
