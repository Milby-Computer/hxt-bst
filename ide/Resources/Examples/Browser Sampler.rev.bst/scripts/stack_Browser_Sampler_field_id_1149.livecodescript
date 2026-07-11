Script "stack_Browser_Sampler_field_id_1149"

/*
# Name: field "sliderValue" of bkgnd "ChapterSlider" of stack "Browser Sampler"
# ID: field id 1149 of bkgnd id 1021 of stack "Browser Sampler"
# Hash: zVWd+VLQC5KrpmLQLRhfwQ==
*/


on closeField
  put the owner of me into tGrp
  put the text of me into tNum
  if not isNumber(tNum) then
    answer warning "Please only enter numbers!"
    put the altRecentNumber of me into me
    exit to top
  end if
  
  put the altSliderMinVal of img "slider.png" of tGrp into tMinVal
  put the altSliderMaxVal of img "slider.png" of tGrp into tMaxVal
  put max(tMinVal,min(tMaxVal,tNum)) into tNum
  setSliderPos tNum
end closeField

on setSliderPos pVal
  put the owner of me into tGrp
  put the left of img "altScrollMiddle.png" of tGrp +5 into tMinX
  put the right of img "altScrollMiddle.png" of tGrp -5 into tMaxX
  put the altSliderMinVal of img "slider.png" of tGrp into tMinVal
  put the altSliderMaxVal of img "slider.png" of tGrp into tMaxVal
  put tMaxVal - tMinVal into tTotalVal
  put tMaxX - tMinX into tTotalPixels
  
  put (pVal-tMinVal)*tTotalPixels/tTotalVal + tMinX into tXloc
  
  set the loc of img "slider.png" of tGrp to \
      tXloc, item 2 of the loc of img "slider.png" of tGrp
      
  set the altRecentNumber of me to pVal
  put pVal into me
  
end setSliderPos

on arrowKey p
  put the owner of me into tGrp
  put the altSliderMinVal of img "slider.png" of tGrp into tMinVal
  put the altSliderMaxVal of img "slider.png" of tGrp into tMaxVal
  put the text of me into tNum
  switch p
  case "up"
    put min(tNum+1,tMaxVal) into tNum
    setSliderPos tNum
    break
  case "down"
    put max(tNum-1,tMinVal) into tNum
    setSliderPos tNum
    break
  end switch
  
end arrowKey

setProp altValue pVal
  setSliderPos pVal  
  put the short name of cd pVal into fld "chapter"
  put the short name of cd pVal into fld "title"
  go cd pVal
end altValue
