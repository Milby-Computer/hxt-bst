Script "stack_SQLite_Sampler_image_id_1145"

/*
# Name: image "altScrollLeft.png" of bkgnd "ChapterSlider" of stack "SQLite Sampler"
# ID: image id 1145 of bkgnd id 1021 of stack "SQLite Sampler"
# Hash: wRZXTDTtmvpsyvsgzI7Csw==
*/


on mouseUp
  put the owner of me into tGrp
  send incrementSlider && "left" to img "altScrollMiddle.png"
end mouseUp

