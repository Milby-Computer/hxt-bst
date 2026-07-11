Script "stack_revResourceCenter_button_id_579735"

/*
# Name: button "Truncate to fit in:" of group "Example" of group id 584248 of group "mainContent" of card "Truncatingtexttoaspecificpixelwidth" of stack "revResourceCenter"
# ID: button id 579735 of group id 577016 of group id 584248 of group id 80435 of card id 80422 of stack "revResourceCenter"
# Hash: +nXPg1B7qPcVHWAvXXDlXw==
*/


on mouseUp
  if field "Text" is empty or field "Width" is empty or field "Width" is not an integer then
    beep
    exit mouseUp
  end if
  put truncatedToFit(field "Text",field "Width") into field "Text"
end mouseUp

function truncatedToFit theString,thePixelWidth
  create invisible field
  set the width of last field to thePixelWidth
  put theString into last field
  put line 1 of the formattedText of last field into myLine
  delete last field
  send "choose browse tool" to me in 1 millisecond
  return myLine
end truncatedToFit
