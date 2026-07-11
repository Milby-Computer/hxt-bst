Script "stack_revResourceCenter_field_id_577913"

/*
# Name: field "Example" of group "Example" of group id 577915 of group "mainContent" of card "Showorhideascrollbarautomaticallyastextisenteredinafield" of stack "revResourceCenter"
# ID: field id 577913 of group id 577003 of group id 577915 of group id 80271 of card id 80261 of stack "revResourceCenter"
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
