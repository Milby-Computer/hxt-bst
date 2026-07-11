Script "stack_revResourceCenter_field_id_579746"

/*
# Name: field "Display" of group "Example" of group "switchingtextstyles" of group "mainContent" of card "SwitchingBetweenStyledTextAndHTMLSource" of stack "revResourceCenter"
# ID: field id 579746 of group id 579745 of group id 113797 of group id 113802 of card id 113788 of stack "revResourceCenter"
# Hash: KAL6QPT4iV4SnHxRukBSiA==
*/


setProp displayedFormat theType
  -- accepts "HTML" (default) or "styled"
  if theType is "HTML" then
    set the text of the target to the htmlText of the target
  else
    set the htmlText of the target to the text of the target
  end if
end displayedFormat
