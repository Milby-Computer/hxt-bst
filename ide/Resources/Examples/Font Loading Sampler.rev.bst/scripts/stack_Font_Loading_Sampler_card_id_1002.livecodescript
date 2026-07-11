Script "stack_Font_Loading_Sampler_card_id_1002"

/*
# Name: card "card id 1002" of stack "Font Loading Sampler"
# ID: card id 1002 of stack "Font Loading Sampler"
# Hash: AeUf/+qirBX1PRR8iG8SPw==
*/


on resizeStack pNewW, pNewH, pOldW, pOldH
  global gMouseChecking
  if gMouseChecking is not true then
    CheckMouseState
  end if
  pass resizeStack
end resizeStack

on preOpenStack
end preOpenStack

on openCard
  initMe
end openCard

on initMe
  lock screen
  stripAndShip
  loadFontNames
  set the hilitedLine of field "fontNames" to 1
  set the textFont of field "Sample" to line 1 of field "fontNames"
  unlock screen
end initMe

on stripAndShip
  put empty into fld "FontNames"
  put the cSampleText of fld "Sample" into fld "Sample"
  set the hilitedButton of grp "gFontSize" to 1
  set the textfont of fld "Sample" to ""
  set the textsize of fld "Sample" to 12
end stripAndShip

# Put the fontNames into the relevant field.
on loadFontnames pFontToSelect
  lock screen
  get the fontNames
  sort it
  put it into field "fontNames"
  get lineOffset(pFontToSelect, it)
  if it is not 0 or it is not empty then
    set the hilitedLine of field "fontNames" to it
    set the textFont of field "Sample" to pFontToSelect
  end if
end loadFontnames

