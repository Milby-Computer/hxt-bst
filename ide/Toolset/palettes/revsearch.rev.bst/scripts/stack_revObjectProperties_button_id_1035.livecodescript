Script "stack_revObjectProperties_button_id_1035"

/*
# Name: button "specific property selector" of bkgnd "Object Properties to Search In:" of stack "revObjectProperties" of stack "revSearch"
# ID: button id 1035 of bkgnd id 1029 of stack "revObjectProperties" of stack "revSearch"
# Hash: bIhDJaVbE7MxiN+lhb7swA==
*/


on mouseDown
  repeat for each line l in the cREVAudioClipPropertyNames of stack "revSearch"
    put tab & l & cr after tAudio    
  end repeat
  repeat for each line l in the cREVButtonPropertyNames of stack "revSearch"
    put tab & l & cr after tButton    
  end repeat
  repeat for each line l in the cREVCardPropertyNames of stack "revSearch"
    put tab & l & cr after tCard    
  end repeat
  repeat for each line l in the cREVFieldPropertyNames of stack "revSearch"
    put tab & l & cr after tField    
  end repeat
  repeat for each line l in the cREVGraphicPropertyNames of stack "revSearch"
    put tab & l & cr after tGraphic    
  end repeat
  repeat for each line l in the cREVGroupPropertyNames of stack "revSearch"
    put tab & l & cr after tGroup    
  end repeat
  repeat for each line l in the cREVImagePropertyNames of stack "revSearch"
    put tab & l & cr after tImage    
  end repeat
  repeat for each line l in the cREVPlayerPropertyNames of stack "revSearch"
    put tab & l & cr after tPlayer    
  end repeat
  repeat for each line l in the cREVScrollbarPropertyNames of stack "revSearch"
    put tab & l & cr after tScrollbar
  end repeat
  repeat for each line l in the cREVStackPropertyNames of stack "revSearch"
    put tab & l & cr after tStack    
  end repeat
  repeat for each line l in the cREVVideoClipPropertyNames of stack "revSearch"
    put tab & l & cr after tVideo
  end repeat
    
  set the text of me to "AudioClip Properties"&cr&tAudio&"Button Properties"&cr&tButton&"Card Properties"&cr&tCard&"Field Properties"&cr&tField&"Graphic Properties"&cr&tGraphic&"Group Properties"&cr&tGroup&"Image Properties"&cr&tImage&"Player Properties"&cr&tPlayer&"Scrollbar Properties"&cr&tScrollbar&"Stack Properties"&cr&tStack&"VideoClip Properties"&cr&tVideo
    
end mouseDown

on menuPick pWhich
  set the itemDel to "|"
  delete item 1 of pWhich
  set the label of me to pWhich  
end menuPick
