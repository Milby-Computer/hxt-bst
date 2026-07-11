Script "stack_revBrushpopup_card_id_1001"

/*
# Name: card "Brushes Card" of stack "revBrushpopup"
# ID: card id 1001 of stack "revBrushpopup"
# Hash: lspN+Na0yO4/CNxLwSpSzQ==
*/


on preOpenCard
  set the defaultStack to "revBrushpopup"
  set the loc of grc "marquee" to the loc of btn (the cBrushShape of this stack) of group 1
end preOpenCard
