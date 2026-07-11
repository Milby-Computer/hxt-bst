Script "stack_revDataViewControl_button_id_1015"

/*
# Name: button "Field Editor Behavior" of card id 1002 of stack "revDataViewControl" of stack "revCore"
# ID: button id 1015 of card id 1002 of stack "revDataViewControl" of stack "revCore"
# Hash: Lz18U9mFg99INI5YTL+zgw==
*/


on escapeKey
   _CloseFieldEditor false, param(0)
end escapeKey


on closeField
   _CloseFieldEditor true, param(0)
end closeField


on exitField
   _CloseFieldEditor true, param(0)
end exitField


on returnInField
   if the autotab of me then
      _CloseFieldEditor true, param(0)
   else
      pass returnInField
   end if
end returnInField


on enterInField
   if the autotab of me then
      _CloseFieldEditor true, param(0)
   else
      pass enterInField
   end if
end enterInField


on tabKey
   if the autotab of me then
      _CloseFieldEditorAndOpenNext param(0)
   else
      pass tabkey
   end if
end tabKey

local sScrollingIntoView

on rawKeyDown
   ## scroll into view if not in view
     set the wholematches to true
   if sScrollingIntoView is not true and pKey is not among the items of kKeyNumsThatScroll then
      put true into sScrollingIntoView
      if not the visible of the dvRowControl of me or (the selectedLoc is a point and the selectedLoc is not within the viewProp["content window rect"] of the dvControl of me) then 
         ScrollSelectionIntoView
      end if
      put false into sScrollingIntoView
   end if
   
   pass rawKeyDown
end rawKeyDown


on selectionChanged
    ## don't pass as selectionChanged is reserved for group
    ## developer can override behavior to process selectionChanged
end selectionChanged
