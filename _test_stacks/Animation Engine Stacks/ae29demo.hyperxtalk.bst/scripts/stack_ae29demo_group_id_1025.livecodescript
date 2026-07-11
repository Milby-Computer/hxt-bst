Script "stack_ae29demo_group_id_1025"

/*
# Name: group id 1025 of card id 1002 of stack "ae29demo"
# ID: group id 1025 of card id 1002 of stack "ae29demo"
# Hash: JrpE4w2x5roON6Cng8HyMw==
*/


on aeMoveDone
    -- just a callback handler
    -- go back to the card script (else clause)
    if the long name of the target is the long name of me then
        --initSwing
    end if
end aeMoveDone
