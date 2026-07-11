Script "stack_revGettingStartedScripts_button_id_1241"

/*
# Name: button "Speak!" of group "Speaking an alert message Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1241 of group id 1240 of card id 1002 of stack "revGettingStartedScripts"
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
