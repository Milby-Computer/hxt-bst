Script "stack_revResourceCenter_group_id_577023"

/*
# Name: group "Example" of group id 579808 of group "mainContent" of card "TranslatingacolornametoanRGBnumerictriplet" of stack "revResourceCenter"
# ID: group id 577023 of group id 579808 of group id 80463 of card id 80452 of stack "revResourceCenter"
# Hash: xJC2L17udGdIRKFNNz2Dng==
*/


on preOpenBackground
  put the colorNames into button "Color Name"
  set the label of button "Color Name" to "Black"
  put "The color" && quote & "Black" & quote && "is" && quote & "0,0,0" & quote & "." \
      into field "Color Result"
end preOpenBackground
