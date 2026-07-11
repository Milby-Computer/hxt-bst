Script "stack_revSaving_card_id_1001"

/*
# Name: card id 1001 of stack "revSaving"
# ID: card id 1001 of stack "revSaving"
# Hash: T/HvqoAbF1J5AFHLkHB5pg==
*/


on preOpenStack
   revCheckSaveStackRect
   set the backColor of me to (the systemWindowColor)  // HXT
   pass preOpenStack
end preOpenStack

setProp cSavingStack tStackName
   lock messages
   
   local tMainStack, tSubStacks
   set the defaultStack to "revSaving"
   put revIDELocalise("Saving stack") && tStackName into field 1
   put the mainStack of stack tStackName into tMainStack
   put the substacks of stack tMainStack into tSubStacks
   
   local tSubTabbed
   repeat for each line l in tSubStacks
      put tab & tab & tab & l & cr after tSubTabbed
   end repeat
   delete char 1 of tSubTabbed
   delete last char of tSubTabbed
   put tSubTabbed into tSubStacks
   
   local tOutput
   put revIDELocalise("Saving...") & cr & cr & "Stack:" & tab & tab & tStackName & cr into tOutput
   put revIDELocalise("Main stack:") & tab & tab & tMainStack & cr after tOutput
   put revIDELocalise("Sub stacks:") & tSubStacks & cr after tOutput
   put revIDELocalise("File name:") & tab & tab & the effective fileName of stack tStackName after tOutput
   put tOutput into field 1 of stack "revSaving"
   
   put cr & cr & revIDELocalise("Please wait") after fld 1
   set the width of field 1 to the formattedWidth of field 1 + 8
   set the height of field 1 to the formattedHeight of field 1
   set the topleft of field 1 to 0,0
   set the width of stack "revSaving" to the right of field 1
   set the height of stack "revSaving" to the height of field 1
   set the loc of stack "revSaving" to the loc of stack tStackName
   revCheckSaveStackRect
   unlock messages
end cSavingStack

on revCheckSaveStackRect
  --sanity checking
  lock screen
  if the right of this stack > item 3 of the windowBoundingRect
  then set the right of this stack to item 3 of the windowBoundingRect
  if the left of this stack < item 1 of the windowBoundingRect
  then set the left of this stack to item 1 of the windowBoundingRect
  if the bottom of this stack > item 4 of the windowBoundingRect
  then set the bottom of this stack to item 4 of the windowBoundingRect
  if the top of this stack < item 2 of the windowBoundingRect
  then set the top of this stack to item 2 of the windowBoundingRect
  unlock screen
end revCheckSaveStackRect


on systemAppearanceChanged pMode, pWindowColor
   set the backgroundColor of this stack to pWindowColor
end systemAppearanceChanged
