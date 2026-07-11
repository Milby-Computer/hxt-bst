Script "stack_File_Attribs_card_id_1010"

/*
# Name: card "Touch Screen" of stack "File Attribs"
# ID: card id 1010 of stack "File Attribs"
# Hash: VJalaFzFUSPpEjdjN3dTGg==
*/


local sTouches

on touchStart pId
   put "started" into sTouches[pId]
   updateTouches
end touchStart

on touchMove pId, pX, pY
   put "moved to" && pX, pY into sTouches[pId]
   updateTouches
end touchMove

on touchEnd pId
   put "ended" into sTouches[pId]
   updateTouches
end touchEnd

on touchRelease pId
   put "released" into sTouches[pId]
   updateTouches
end touchRelease

on updateTouches
   get sTouches
   combine it with return and ":"
   put it into field "Touches"
end updateTouches
