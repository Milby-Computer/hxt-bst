Script "stack_Core_Image_Visual_Effects_group_id_1023"

/*
# Name: group "Destination Drop Zone" of bkgnd "Background" of stack "Core Image Visual Effects"
# ID: group id 1023 of bkgnd id 1031 of stack "Core Image Visual Effects"
# Hash: 29WhMcM8tSSo9DOZNVqRCg==
*/


setProp ciValue pValue
  set the text of image "Target Image" to the text of image id pValue
  put the text of image "Target Thumbnail" to the text of image id pValue
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
  set the text of image "Target Image" to URL ("binfile:" & pFilename)
  set the text of image "Target Thumbnail" to the text of image "Target Image"
  set the imageData of image "Target Thumbnail" to the imageData of image "Target Thumbnail"
end dropFile

on resetMe
  set the text of image "Target Image" to empty
  set the text of image "Target Thumbnail" to empty
end resetMe
