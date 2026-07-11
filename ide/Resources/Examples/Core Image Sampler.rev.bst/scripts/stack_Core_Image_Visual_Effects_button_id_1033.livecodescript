Script "stack_Core_Image_Visual_Effects_button_id_1033"

/*
# Name: button "Go" of bkgnd "Background" of stack "Core Image Visual Effects"
# ID: button id 1033 of bkgnd id 1031 of stack "Core Image Visual Effects"
# Hash: MImZgEIjzNGHnslWZgKsoQ==
*/


on mouseUp
  local tVisualEffect
  local tName, tParameters
  
  repeat with tIndex = 1 to the number of groups of group "ciControls"
    put the ciValue of group tIndex of group "ciControls" into tParameters[the ciName of group tIndex of group "ciControls"]
  end repeat
  
  put the label of button "Effect Name" into tName
  
  combine tParameters using "~" and space
  replace "~" with " and " in tParameters

  hide image "Target Image"
  show image "Source Image"
  --put tParameters
  do "show image " & quote & "Target Image" & quote & " with visual effect tName slow with " & tParameters
end mouseUp
