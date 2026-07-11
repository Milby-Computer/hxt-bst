Script "stack_Font_Loading_Sampler_button_id_1004"

/*
# Name: button "Load Font" of card "card id 1002" of stack "Font Loading Sampler"
# ID: button id 1004 of card id 1002 of stack "Font Loading Sampler"
# Hash: 0HVrn4O+4D2OEK/dsU6Q/A==
*/


on mouseUp
  local tOldList, tNumOfFonts, tResult, tNewList, tFontName
  
  answer file "Choose a ttf file to load"
  
  if it is empty then 
    exit mouseUp
  end if
  
  put the fontNames into tOldList
  put the number of lines in tOldList into tNumOfFonts
   
  -- Use the revFont external to load the font file.
  revFontLoad it
  put the result into tResult
   
  if tResult is not empty then 
    -- There was an error loading this font.
    answer error tResult
    exit mouseUp
  end if
   
  put the fontnames into tNewList
  if the number of lines in tNewList is tNumOfFonts + 1 then
    -- There is one more font than before: success
    
    put diffLists(tOldList,tNewList) into tFontName
    
    -- Reload the fontnames into the relevant field, and select this new font.
    loadFontnames tFontName
     
    answer info "Font successfully loaded: " & tFontName
  else
    answer info "Problem loading font." & return & \
        "This could be because it is already loaded, or the file is not of correct type!"
  end if
end mouseUp

function diffLists pOldList, pNewList
  set the wholematches to true
  repeat with x = the number of lines in pNewList down to 1
    if line x of pNewList is not among the lines of pOldList then 
      return line x of pNewList
    end if
  end repeat
end diffLists


