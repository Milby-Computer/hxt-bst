Script "stack_revResourceCenter_button_id_579873"

/*
# Name: button "Check Screen Size" of group "Example" of group id 579875 of group "mainContent" of card "Checkwhetherthescreenresolutionishighenough" of stack "revResourceCenter"
# ID: button id 579873 of group id 577040 of group id 579875 of group id 80302 of card id 80284 of stack "revResourceCenter"
# Hash: OXm9QJYqJDvX+smCFHCoLg==
*/


on mouseUp
  checkForScreenSize
end mouseUp

on checkForScreenSize
  if item 3 of the screenRect < 1024 \
      or item 4 of the screenRect < 768 then
    answer error "MyApp requires a 1024x768 or larger monitor." \
        & return & return & "(This handler has been modified from the example, for" \
        & "obvious reasons. The application would quit here, if we hadn't commented out that part.)" \
        with "Sorry"
    -- quit -- commented this out in the example to avoid unpleasant surprises
  else
    -- this line is also added for the example
    answer "Screen size is OK!"
  end if
end checkForScreenSize
