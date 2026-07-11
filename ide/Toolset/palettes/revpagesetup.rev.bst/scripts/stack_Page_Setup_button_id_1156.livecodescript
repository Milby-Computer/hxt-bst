Script "stack_Page_Setup_button_id_1156"

/*
# Name: button "Printer..." of bkgnd "Output" of stack "Page Setup"
# ID: button id 1156 of bkgnd id 1151 of stack "Page Setup"
# Hash: MiyPsYjT0Ec3djlSzoBybw==
*/


on mouseUp
  if the platform is "Win32" or the platform is "MacOS"
  then answer printer
  else modeless "Printer Chooser"
end mouseUp
