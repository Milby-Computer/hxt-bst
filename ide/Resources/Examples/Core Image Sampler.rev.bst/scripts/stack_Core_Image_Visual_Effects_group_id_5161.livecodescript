Script "stack_Core_Image_Visual_Effects_group_id_5161"

/*
# Name: group "IMAGE" of group "ciControls" of card "CIRippleTransition" of stack "Core Image Visual Effects"
# ID: group id 5161 of group id 1735 of card id 1048 of stack "Core Image Visual Effects"
# Hash: RGOJ1vVQ2Qe2Z2t/guGjOw==
*/


setProp ciValue pValue
  set the text of image "Image" of me to the text of image id pValue
  put the text of image "Thumbnail" of me to the text of image id pValue
end ciValue

getProp ciValue
  return "id" && the id of image "Image" of me
end ciValue

on dragEnter
  if the number of lines of the dragData["files"] is 1 then
    set the acceptDrop to true
  end if
end dragEnter

on dragDrop
  dropFile line 1 of the dragData["files"]
end dragDrop

on dropFile pFilename
  set the text of image "Image" of me to URL ("binfile:" & pFilename)
  set the text of image "Thumbnail" of me to the text of image "Image" of me
end dropFile

on resetMe
  set the text of image "Image" of me to empty
  set the text of image "Thumbnail" of me to empty
end resetMe
