Script "stack_Browser_Sampler_image_id_1146"

/*
# Name: image "altScrollMiddle.png" of bkgnd "ChapterSlider" of stack "Browser Sampler"
# ID: image id 1146 of bkgnd id 1021 of stack "Browser Sampler"
# Hash: NJ+Zbhy+XMAUEp+ooKS9mA==
*/


on mouseUp
  put the owner of me into tGrp
  if the shiftKey is down and the environment is "development" then
    put the right of img "altScrollLeft.png" of tGrp into tL
    put the left of img "altScrollRight.png" of tGrp into tR
    put the top of img "altScrollLeft.png" of tGrp into tT
    
    put tR-tL into tW
    set the width of me to tW
    set the left of me to tL
    set the top of me to tT
    set the top of img "altScrollRight.png" of tGrp to tT
    set the top of img "slider.png" to tT+1
    set the lockLoc of me to true
    exit mouseUp
  end if
  put the mouseH into tX1
  put item 1 of the loc of img "slider.png" of tGrp into tX2
  if tX1 > tX2 then
    incrementSlider "right"
  else
    incrementSlider "left"
  end if
end mouseUp

on incrementSlider pWhich
  put the owner of me into tGrp
  put fld "sliderValue" of tGrp into tVal
  put the altSliderMinVal of img "slider.png" of tGrp into lMinVal
  put the altSliderMaxVal of img "slider.png" of tGrp into lMaxVal

  if pWhich is "right" then
    if tVal < lMaxVal then
      set the altValue of fld "sliderValue" of tGrp to tVal+1
    end if
  else
    if tVal > lMinVal then
      set the altValue of fld "sliderValue" of tGrp to tVal-1
    end if
  end if
end incrementSlider
