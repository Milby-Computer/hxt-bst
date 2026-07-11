Script "stack_revGettingStartedScripts_button_id_1089"

/*
# Name: button "Append Selected Text" of group "Editing the clipboard Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1089 of group id 1086 of card id 1002 of stack "revGettingStartedScripts"
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
