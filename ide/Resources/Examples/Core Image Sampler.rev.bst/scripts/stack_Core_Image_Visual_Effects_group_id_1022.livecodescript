Script "stack_Core_Image_Visual_Effects_group_id_1022"

/*
# Name: group "Source Drop Zone" of bkgnd "Background" of stack "Core Image Visual Effects"
# ID: group id 1022 of bkgnd id 1031 of stack "Core Image Visual Effects"
# Hash: LE/71dx5LexhbN0MIwXDxg==
*/


setProp ciValue pValue
  set the text of image "Source Image" to the text of image id pValue
  put the text of image "Source Thumbnail" to the text of image id pValue
end ciValue

getProp ciValue
  return the id of image "Image" of me
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
  set the text of image "Source Image" to URL ("binfile:" & pFilename)
  set the text of image "Source Thumbnail" to the text of image "Source Image"
  set the imageData of image "Source Thumbnail" to the imageData of image "Source Thumbnail"
end dropFile

on resetMe
  set the text of image "Source Image" to empty
  set the text of image "Source Thumbnail" to empty
end resetMe
