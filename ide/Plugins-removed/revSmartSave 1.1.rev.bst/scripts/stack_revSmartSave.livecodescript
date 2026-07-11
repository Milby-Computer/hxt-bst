Script "stack_revSmartSave"

/*
# Name: stack "revSmartSave"
# ID: stack "revSmartSave"
# Hash: svpzV3Do3jFS8VSJGsG10Q==
*/


on openStack
  if the thumbPosition of scrollBar "TimerScroll" > 1
  then send SmartSave to me
end openStack

on closeStack
  CancelSmartSaveMsg
  hide btn "Saving"
  set the thumbPosition of scrollBar "Timer" to 0
end closeStack

on CancelSmartSaveMsg
  repeat for each line theMsg in the pendingMessages
    if item 3 of theMsg is "SmartSave"
    then cancel item 1 of theMsg
  end repeat
end CancelSmartSaveMsg

on SmartSave
  set the thumbPosition of scrollBar "Timer" to the thumbPosition of scrollBar "Timer" + 1
  
  if the thumbPosition of scrollBar "Timer" is the endValue of scrollBar "Timer"
  then
    --check if any object script of the stack or its substacks is currently edited
    put the openStacks into revStacksList
    filter revStacksList with "REVPropertyPalette*"
    put false into currentlyEdited
    get the long name of stack the mainStack of the topStack
   
    repeat for each line revStack in revStacksList
      if the short name of this cd of stack revStack is "revscript" \
          and it is word -2 to -1 of the cTargetObject of this cd of stack revStack
      then
        put true into currentlyEdited
        exit repeat
      end if
    end repeat
   
    if not currentlyEdited
    then
      show btn "Saving"
     
      --now save all non-edited stacks
      get the mainStack of the topStack
      repeat for each line theStack in (it & return & the substacks of stack it)
        save stack theStack
      end repeat
     
      wait 30 ticks
      hide btn "Saving"
    end if
   
    set the thumbPosition of scrollBar "Timer" to 0
  end if
 
  send SmartSave to me in 2 seconds
end SmartSave
