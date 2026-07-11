Script "stack_File_Attribs_card_id_1002"

/*
# Name: card "Graphic rendering" of stack "File Attribs"
# ID: card id 1002 of stack "File Attribs"
# Hash: Wer01VStJ6mJV9wjX53BNA==
*/


on mouseDown
   if word 1 of the name of the target is among the items of "image,graphic" then
      set the layer of the target to top
      grab the target
   end if
end mouseDown
