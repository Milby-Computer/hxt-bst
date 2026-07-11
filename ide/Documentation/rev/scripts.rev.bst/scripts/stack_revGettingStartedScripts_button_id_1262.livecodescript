Script "stack_revGettingStartedScripts_button_id_1262"

/*
# Name: button "Truncate to fit in:" of bkgnd "Truncating text to a specific pixel width Example" of stack "revGettingStartedScripts"
# ID: button id 1262 of bkgnd id 1259 of stack "revGettingStartedScripts"
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
