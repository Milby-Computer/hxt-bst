Script "stack_Browser_Sampler_image_id_1148"

/*
# Name: image "altScrollRight.png" of bkgnd "ChapterSlider" of stack "Browser Sampler"
# ID: image id 1148 of bkgnd id 1021 of stack "Browser Sampler"
# Hash: lPlwwgwGBtdAZZ5CwbICSQ==
*/


on mouseUp
  put the owner of me into tGrp
  send incrementSlider && "right" to img "altScrollMiddle.png"
end mouseUp

