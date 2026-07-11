Script "stack_revGettingStartedScripts_group_id_1255"

/*
# Name: group "Translating a color name to an RGB numeric triplet Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: group id 1255 of card id 1002 of stack "revGettingStartedScripts"
# Hash: xJC2L17udGdIRKFNNz2Dng==
*/


on preOpenBackground
  put the colorNames into button "Color Name"
  set the label of button "Color Name" to "Black"
  put "The color" && quote & "Black" & quote && "is" && quote & "0,0,0" & quote & "." \
      into field "Color Result"
end preOpenBackground
