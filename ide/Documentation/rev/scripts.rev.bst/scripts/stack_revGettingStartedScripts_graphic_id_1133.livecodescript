Script "stack_revGettingStartedScripts_graphic_id_1133"

/*
# Name: graphic "Ball" of bkgnd "Drag drop a background color onto an object Example" of stack "revGettingStartedScripts"
# ID: graphic id 1133 of bkgnd id 1121 of stack "revGettingStartedScripts"
# Hash: YqqJ+fIXesePPOmfEPlOvQ==
*/


on dragEnter
  set the acceptDrop to true
end dragEnter

on dragDrop
  set the backgroundColor of the target to the dragData["text"]
  set the label of the target to the backgroundColor of the target && "ball"
end dragDrop
