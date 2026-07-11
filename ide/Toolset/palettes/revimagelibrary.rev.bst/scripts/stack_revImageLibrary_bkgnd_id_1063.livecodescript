Script "stack_revImageLibrary_bkgnd_id_1063"

/*
# Name: bkgnd "Images In Library" of stack "revImageLibrary"
# ID: bkgnd id 1063 of stack "revImageLibrary"
# Hash: dMgQfXfAqt//tYbDtXOOVg==
*/


on mouseUp
  if word 1 of the name of the target is "button" and the icon of the target is not 0 then 
    set the rect of grc "marquee" to the rect of the target
    set the cObject of grc "marquee" to the long id of the target -- resize stack
    enable btn "insert image into stack"
    enable btn "insert reference into stack"
    put the icon of the target into fld "image id"
    if the label of btn "library chooser" is not among the items of "Standard Images,Classic Images,Cursors" then enable btn "delete...1"
  end if
end mouseUp
