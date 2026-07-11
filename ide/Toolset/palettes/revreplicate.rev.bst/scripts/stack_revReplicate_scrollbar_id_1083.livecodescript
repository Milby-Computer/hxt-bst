Script "stack_revReplicate_scrollbar_id_1083"

/*
# Name: scrollbar "New Scrollbar 1" of card id 1002 of stack "revReplicate"
# ID: scrollbar id 1083 of card id 1002 of stack "revReplicate"
# Hash: GWU8Ikiv1FUNxxq6Yd1liw==
*/


on scrollBarDrag x
  if fld (the cTargetField of me) is not an integer then pass scrollBarDrag
  put the endValue of me - x into fld (the cTargetField of me)
end scrollBarDrag
