Script "stack_SQLite_Sampler_image_id_1147"

/*
# Name: image "slider.png" of bkgnd "ChapterSlider" of stack "SQLite Sampler"
# ID: image id 1147 of bkgnd id 1021 of stack "SQLite Sampler"
# Hash: vAUQHNdIjSZ4+hAQJn4DiQ==
*/


local lDown,lGrp,lMinX,lMaxX,lTotalVal,lTotalPixels,lMinVal,lMaxVal

on mouseDown
  put the owner of me into lGrp
  put the left of img "altScrollMiddle.png" of lGrp +5 into lMinX
  put the right of img "altScrollMiddle.png" of lGrp -5 into lMaxX
  put the altSliderMinVal of me into lMinVal
  put the altSliderMaxVal of me into lMaxVal
  put lMaxVal - lMinVal into lTotalVal
  put lMaxX - lMinX into lTotalPixels
  put true into lDown
end mouseDown

on mouseUp
  mouseRelease
end mouseUp

on mouseMove x,y
  if lDown then
    put max(lMinX,min(lMaxX,x)) into tX
    set the loc of me to tX, item 2 of the loc of me
    if there is a fld "sliderValue" of lGrp then
      put round(((tX-lMinX) * lTotalVal/lTotalPixels )+lMinVal) into tXPos
      put tXPos into fld "sliderValue" of lGrp
      put the short name of cd tXPos into fld "chapter"
    end if
  end if
end mouseMove

on mouseRelease
  put false into lDown
  put the text of fld "sliderValue" of lGrp into tVal
  set the altRecentNumber of fld "sliderValue" of lGrp to tVal
  set the altValue of fld "sliderValue" of lGrp to tVal
end mouseRelease
