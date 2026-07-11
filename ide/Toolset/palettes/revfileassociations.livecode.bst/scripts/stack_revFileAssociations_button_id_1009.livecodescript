Script "stack_revFileAssociations_button_id_1009"

/*
# Name: button "Show" of card id 1002 of stack "revFileAssociations"
# ID: button id 1009 of card id 1002 of stack "revFileAssociations"
# Hash: XWrEVoQAxSkGGhMS4oCmcg==
*/


on mouseUp
  # We need this done as soon as the user clicks the button. In case they close the window for example.
  set the cDontShowFileAssociationsDialog of stack "revPreferences" to the hilite of me
end mouseUp
