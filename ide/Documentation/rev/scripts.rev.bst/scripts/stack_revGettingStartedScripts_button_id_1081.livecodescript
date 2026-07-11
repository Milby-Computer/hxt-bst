Script "stack_revGettingStartedScripts_button_id_1081"

/*
# Name: button "Check Screen Size" of group "Check whether the screen resolution is high enough Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1081 of group id 1080 of card id 1002 of stack "revGettingStartedScripts"
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
