Script "stack_revResourceCenter_button_id_579868"

/*
# Name: button "Speak!" of group "Example" of group id 579871 of group "mainContent" of card "Speakinganalertmessage" of stack "revResourceCenter"
# ID: button id 579868 of group id 577038 of group id 579871 of group id 100222 of card id 100210 of stack "revResourceCenter"
# Hash: aIOc+It1kUpnnGjVYDsXUQ==
*/


on mouseUp
  if field "Speech" is empty then put the defaultAlert of field "Speech" into field "Speech"
  speakAlert field "Speech"
end mouseUp

on speakAlert theText
  if theText is empty then exit speakAlert -- skip the rest
  try -- in case revSpeak isn't installed
    revSpeak theText
  catch theError -- if the "revSpeak" command fails
    put return & "(Cannot speak text on this system.)" \
       after theText
    beep -- make a sound to get the user's attention
  end try
  answer theText
end speakAlert
