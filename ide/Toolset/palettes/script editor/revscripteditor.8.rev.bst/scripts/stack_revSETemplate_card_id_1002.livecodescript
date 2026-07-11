Script "stack_revSETemplate_card_id_1002"

/*
# Name: card "Main" of stack "revSETemplate" of stack "revNewScriptEditor"
# ID: card id 1002 of stack "revSETemplate" of stack "revNewScriptEditor"
# Hash: 9mv7kq85P5KEt8ayx5KSkQ==
*/


# OK-2008-06-24 : The IDE periodically sends this message to the current card of the script editor,
# so it should be handled to prevent errors.
command revUpdatePalette
end revUpdatePalette

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
