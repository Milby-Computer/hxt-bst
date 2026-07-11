Script "stack_revNewScriptEditor_1_field_id_54423"

/*
# Name: field "Password" of group "Enter Password" of group "Editor" of card "Main" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: field id 54423 of group id 54422 of group id 1046 of card id 1002 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: zo0wK8n61TTPxc7bG4uc4g==
*/


local sValue

getProp cValue
  return sValue
end cValue

setProp cValue pValue
  put pValue into sValue
end cValue

on keyDown pKey
  local tFrom, tTo
  get the selectedChunk
  put word 2 of it into tFrom
  put word 4 of it into tTo
   
  if tFrom > tTo then
    put pKey after char tTo of sValue
    put "*" after char tTo of me
  else
    put pKey into char tFrom to tTo of sValue
    put "*" into char tFrom to tTo of me
  end if
end keyDown

on deleteKey
  local tFrom, tTo
  get the selectedChunk
  put word 2 of it into tFrom
  put word 4 of it into tTo
  
  if tFrom > tTo then
    delete char (tTo + 1) of me
    delete char (tTo + 1) of sValue
  else
    delete char tFrom to tTo of me
    delete char tFrom to tTo of sValue
  end if
end deleteKey

on backspaceKey
  local tFrom, tTo
  get the selectedChunk
  put word 2 of it into tFrom
  put word 4 of it into tTo
  
  if tFrom > tTo then
    delete char tTo of me
    delete char tTo of sValue
  else
    delete char tFrom to tTo of me
    delete char tFrom to tTo of sValue
  end if
end backspaceKey

on copyKey
end copyKey

on commandKeyDown pKey
  if pKey is "V" then
    put line 1 of the the clipboarddata["text"] into sValue
    local tText
    repeat (the number of chars of sValue) times
      put "*" after tText
    end repeat
    set the text of me to tText
    exit commandKeyDown
  end if
  
  if pKey is "C" or pKey is "X" then
    # block these messages
  else
    pass commandKeyDown
  end if
end commandKeyDown



