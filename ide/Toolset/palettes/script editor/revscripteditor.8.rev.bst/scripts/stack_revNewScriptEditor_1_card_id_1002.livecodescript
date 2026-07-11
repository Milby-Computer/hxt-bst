Script "stack_revNewScriptEditor_1_card_id_1002"

/*
# Name: card "Main" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: card id 1002 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: C+m50/vun9f2JRcXwh1TPA==
*/


# OK-2008-06-24 : The IDE periodically sends this message to the current card of the script editor,
# so it should be handled to prevent errors.
command revUpdatePalette
end revUpdatePalette

on OpenCard
   --   set the backgroundColor of this stack to EMPTY
   --   set the backgroundColor of this card to EMPTY
   --   set the foregroundColor of this stack to EMPTY
   ApplySystemAppearanceChanged the systemAppearance, the systemWindowColor, the systemTextColor
end OpenCard

on SystemAppearanceChanged pMode, pWindowColor, pTextColor
  ApplySystemAppearanceChanged pMode, pWindowColor, pTextColor
end SystemAppearanceChanged


command ApplySystemAppearanceChanged pMode, pWindowColor, pTextColor
   set the backgroundColor of field "Numbers" to (iff(pMode = "dark", "128,128,128", "217,217,217"))
   set the foregroundColor of field "Numbers" to (iff(pMode = "dark", "217,217,217", "128,128,128"))
   set the backgroundColor of this stack to pWindowColor
   set the backgroundColor of this card to pWindowColor
   set the foregroundColor of this stack to pTextColor
   
   seUpdateLeftBar
   seUpdateToolbar
end ApplySystemAppearanceChanged
