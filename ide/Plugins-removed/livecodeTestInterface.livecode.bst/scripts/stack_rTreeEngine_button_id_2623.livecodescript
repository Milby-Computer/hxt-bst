Script "stack_rTreeEngine_button_id_2623"

/*
# Name: button "cellBehavior" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2623 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: m57JqjJeWPUnIOWCdBQjFQ==
*/


local 

on renderCell tData tRow tCol
   set the htmlText of me to tData[htmlText]
   set the backgroundColor of me to tData[backgroundColor]
   set the borderColor of me to tData[borderColor]
end renderCell

on keyUp
   put round(the thumbposition of scrollbar "horizontalScrollbar" of the owner of the owner of me) - 2 + the layer of me - the layer of the owner of me into tColumnNumber
   put the nodeID of the owner of me into tRowID
   set the nodeData[tRowID , tColumnNumber , htmlText] of the owner of (the owner of me) to the htmlText of me
end keyUp
