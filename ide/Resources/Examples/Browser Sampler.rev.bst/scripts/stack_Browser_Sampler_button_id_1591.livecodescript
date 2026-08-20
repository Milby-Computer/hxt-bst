Script "stack_Browser_Sampler_button_id_1591"

/*
# Name: button "Make Thumbnail" of card "Getting the Browser Image" of stack "Browser Sampler"
# ID: button id 1591 of card id 1593 of stack "Browser Sampler"
# Hash: pi+L66CnvBo8XbrktPpuHQ==
*/


on mouseUp
  local tImgData = ""
   
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
   
  revBrowserSnapshot tBrowserId, "tImgData"
   
  local tOldRect
  put the rect of img "thumbnail" into tOldRect
   
  set the rect of img "thumbnail" to the rect of img "browserImage"
  set the imageData of img "thumbnail" to tImgData
  set the resizeQuality of img "thumbnail" to "best"
  set the rect of img "thumbNail" to tOldRect
   
end mouseUp
