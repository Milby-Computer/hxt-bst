Script "stack_revMessageWatcher_button_id_1008"

/*
# Name: button "Suppress..." of card id 1002 of stack "revMessageWatcher"
# ID: button id 1008 of card id 1002 of stack "revMessageWatcher"
# Hash: FFc0mNUCCV3NRKonQmh0Hg==
*/


on mouseUp
  suppressRecording 1
  modal "revSuppressMessages"
  suppressRecording 0
end mouseUp
