Script "stack_revBrushpopup"

/*
# Name: stack "revBrushpopup"
# ID: stack "revBrushpopup"
# Hash: bgXpH65hnJyoC0hlsME1Mg==
*/


on preOpenStack
   set the height of this stack to the cHeight of this stack
   set the topleft of this stack to globalLoc(the mouseLoc)
end preOpenStack
