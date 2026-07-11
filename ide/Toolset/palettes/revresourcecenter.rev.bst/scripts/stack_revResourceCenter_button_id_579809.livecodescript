Script "stack_revResourceCenter_button_id_579809"

/*
# Name: button "Choose a picture file..." of group "Example" of group id 579813 of group "mainContent" of card "Gettingthedimensionsofapicturefile" of stack "revResourceCenter"
# ID: button id 579809 of group id 577024 of group id 579813 of group id 80351 of card id 80339 of stack "revResourceCenter"
# Hash: +AMIA2cKIvEsRhMpzqtKHw==
*/


on mouseUp
  answer file "Please choose a picture file:"
  if it is empty then exit mouseUp -- user canceled
  put it into myFile
  get imageFileDimensions(myFile)
  put item 1 of it into word 2 of field "Width"
  put item 2 of it into word 2 of field "Height"
  set the itemDelimiter to "/"
  put last item of myFile into field "Filename"
end mouseUp

function imageFileDimensions theFilePath
  lock screen -- so user doesn't see the following shenanigans
  lock error dialogs -- prevent error window if import fails and debug mode is on
  import paint from file theFilePath -- creates a new image
  unlock error dialogs
  put the width of last image into myWidth
  put the height of last image into myHeight
  delete last image -- get rid of image we created
  unlock screen
  return myWidth,myHeight
end imageFileDimensions

on errorDialog theDetails-- executed if the import causes a script error
  beep
  answer "There was a problem accessing the file data."\
      & return & return & \
      "Picture files must be in one of the following formats:" & \
      return & "PNG, JPEG, GIF, PICT, BMP, XWD/XBM/XPM, or PBM/PGM/PPM."
end errorDialog
