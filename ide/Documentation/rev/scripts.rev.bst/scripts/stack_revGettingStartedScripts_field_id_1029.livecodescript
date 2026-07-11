Script "stack_revGettingStartedScripts_field_id_1029"

/*
# Name: field "Example" of group "Show or hide a scrollbar automatically as text is entered in a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1029 of group id 1028 of card id 1002 of stack "revGettingStartedScripts"
# Hash: XcAk7m991kQWoremoT9dLA==
*/


on rawKeyDown
  if the formattedHeight of me > the height of me then
    -- there's too much text to fit, so show a scrollbar:
    set the vScrollbar of me to true
  else -- text will fit without scrolling
    -- get rid of the scrollbar
    set the vScrollbar of me to false
  end if
  pass rawKeyDown -- let the keystroke be processed normally
end rawKeyDown 
