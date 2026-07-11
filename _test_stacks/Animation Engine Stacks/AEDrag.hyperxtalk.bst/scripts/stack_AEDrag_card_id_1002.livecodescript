Script "stack_AEDrag_card_id_1002"

/*
# Name: card id 1002 of stack "AEDrag"
# ID: card id 1002 of stack "AEDrag"
# Hash: g/302r0i6TBiKR+inP3Qrw==
*/




on openCard
    resetGame
end openCard

on resetGame
    aeLockMoves
    aeMoveTo the long id of fld "fld,red",the cInitialPosition of fld "fld,red",200,"inout"
    aeMoveTo the long id of fld "fld,green",the cInitialPosition of fld "fld,green",200,"inout"
    aeMoveTo the long id of fld "fld,yellow",the cInitialPosition of fld "fld,yellow",200,"inout"
    aeUnlockMoves
    set the constrainRectangular of fld "fld,red" to the rect of this card
    set the constrainRectangular of fld "fld,green" to the rect of this card
    set the constrainRectangular of fld "fld,yellow" to the rect of this card
end resetGame

on constrainRectangularExit
    local tColor
    put item 2 of the short name of the target into tColor
    if the mouseloc is within the rect of grc ("grc,"&tColor) then
        set the constrainRectangular of the target to empty
        aeMoveTo the long id of the target,the loc of grc ("grc,"&tColor),300,"overshoot"
    else
        aeMoveTo the long id of the target,the cInitialPosition of the target,350,"bounce"
    end if
end constrainRectangularExit
