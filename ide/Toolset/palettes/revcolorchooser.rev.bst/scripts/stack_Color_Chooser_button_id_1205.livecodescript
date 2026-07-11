Script "stack_Color_Chooser_button_id_1205"

/*
# Name: button "OK" of card id 1001 of stack "Color Chooser"
# ID: button id 1205 of card id 1001 of stack "Color Chooser"
# Hash: wDWreJWR8QeWgvOodLLxuA==
*/


on mouseUp
  if not the visible of group "Patches" then # answer color mode
    set the dialogData to the backColor of button "answerColor"
    close this stack
  end if
end mouseUp
