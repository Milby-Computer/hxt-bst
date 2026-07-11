Script "stack_Core_Image_Visual_Effects_group_id_1068"

/*
# Name: group "IMAGE" of card "Control Haven" of stack "Core Image Visual Effects"
# ID: group id 1068 of card id 1034 of stack "Core Image Visual Effects"
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
