Script "stack_revNewScriptEditor_1_card_id_1002"

/*
# Name: card "Main" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: card id 1002 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: 1CxZu4V3LI5BGQgSpp+/Mw==
*/


# OK-2008-06-24 : The IDE periodically sends this message to the current card of the script editor,
# so it should be handled to prevent errors.
command revUpdatePalette
end revUpdatePalette


// HXT
on PreOpenCard
   if (the systemAppearance = "dark") then
      set the backgroundColor of field "Handlers" to "black"
      set the foregroundColor of field "Handlers" to "white"
   else
      set the backgroundColor of field "Handlers" to "white"
      set the foregroundColor of field "Handlers" to "black"
   end if
end PreOpenCard
