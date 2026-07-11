Script "stack_Video_Capture_button_id_1037"

/*
# Name: button "Save image..." of card id 1002 of stack "Video Capture"
# ID: button id 1037 of card id 1002 of stack "Video Capture"
# Hash: GElhXO140T9VtH6ATWYdTw==
*/


on mouseUp
  -- bring up a standard system "save as" file selector
  -- specify a suggested file name of video image.png
  ask file "Save image as:" with "video image.png"
  -- if the user cancels, exit without saving
  if it is empty then exit mouseUp
  -- export the image videoImage on this card to the file name
  -- the user entered (now stored in the it variable) using png
  -- as the compression format
  export image "videoImage" to file it as png 
end mouseUp
