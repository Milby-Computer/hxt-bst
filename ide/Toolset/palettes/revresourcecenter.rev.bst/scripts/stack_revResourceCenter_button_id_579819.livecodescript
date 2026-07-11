Script "stack_revResourceCenter_button_id_579819"

/*
# Name: button "Append Selected Text" of group "Example" of group id 579822 of group "mainContent" of card "Editingtheclipboard" of stack "revResourceCenter"
# ID: button id 579819 of group id 577026 of group id 579822 of group id 102572 of card id 102558 of stack "revResourceCenter"
# Hash: 0JI5JdRuB2oU/7XX7BSH2w==
*/


on mouseUp
  appendSelectionToClipboard
  if the result is not empty then answer the result
  put the length of the clipboardData["text"] into word 1 of field "Clipboard Chars"
end mouseUp

on appendSelectionToClipboard
  if the selectedText is empty -- there's no selection, so...
  then return "Error: no text is selected" -- ...never mind
  -- put the selected text at the end of the clipboard:
  set the clipboardData["text"] \
     to the clipboardData["text"] & return & the selectedText
end appendSelectionToClipboard
