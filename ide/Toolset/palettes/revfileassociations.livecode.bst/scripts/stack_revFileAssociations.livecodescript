Script "stack_revFileAssociations"

/*
# Name: stack "revFileAssociations"
# ID: stack "revFileAssociations"
# Hash: j8pcpHons/lBwvvefROZqw==
*/


on preOpenStack
  revInternal__ConstrainStack the short name of me
  set the cantModify of me to true
  set the resizable of me to false
  set the destroyStack of me to true
  
  -- Make sure we use the screen of the menubar
  get line (the screen of stack "revMenubar") of the working screenRects
  set the loc of me to (item 3 of it + item 1 of it) div 2, (item 4 of it + item 2 of it) div 2
end preOpenStack

