Script "stack_Core_Image_Visual_Effects"

/*
# Name: stack "Core Image Visual Effects"
# ID: stack "Core Image Visual Effects"
# Hash: ArHII2csEmAY5oPZ7zHDfw==
*/


on preOpenStack
  set the label of button "Effect Name" to "CIRippleTransition"
  go to card "CIRippleTransition"
end preOpenStack



on preOpenCard
  createCIControls
end preOpenCard

on createCIControls
  if there is no group "ciControls" of this card of me then
    exit createCIControls
  end if
  
  repeat while the number of controls of group "ciControls" of this card of me > 0
    delete control 1 of group "ciControls" of this card of me
  end repeat
  
  local tSpec, tControl, tTop, tLeft
  set the itemDelimiter to tab
  put the ciParameters of this card of me into tSpec
  put the left of group "ciControls" of me into tLeft
  put 8 + the top of group "ciControls" of me into tTop
  repeat for each line tControl in tSpec
    local tLabel, tId
    copy control "LABEL" of card "Control Haven" of me to group "ciControls" of this card of me
    put it into tLabel
    set the text of tLabel to item 1 of tControl & ":"
    set the topLeft of tLabel to tLeft, tTop
    copy group (item 2 of tControl) of card "Control Haven" of me to group "ciControls" of this card of me
    put it into tId
    set the ciName of tId to item 1 of tControl
    set the ciRange of tId to item 3 of tControl
    if item 4 of tControl is not empty then
      set the ciValue of tId to item 4 of tControl
    end if
    set the topLeft of tId to the right of tLabel, tTop
    put the bottom of tId into tTop
  end repeat
end createCIControls

function createCommand
  local tVisualEffect
  local tName, tParameters
  
  repeat with tIndex = 1 to the number of groups of group "ciControls"
    put the ciValue of group tIndex of group "ciControls" into tParameters[the ciName of group tIndex of group "ciControls"]
  end repeat
  
  put the short name of this card into tName
  
  combine tParameters using "~" and space
  replace "~" with " and " in tParameters
  return "visual effect " & quote & tName & quote & " slow with " & tParameters
end createCommand
