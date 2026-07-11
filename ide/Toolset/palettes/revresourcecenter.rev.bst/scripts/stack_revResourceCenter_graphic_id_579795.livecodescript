Script "stack_revResourceCenter_graphic_id_579795"

/*
# Name: graphic "Ball" of group "Example" of group id 579796 of group "mainContent" of card "Dragdropabackgroundcolorontoanobject" of stack "revResourceCenter"
# ID: graphic id 579795 of group id 579783 of group id 579796 of group id 80325 of card id 80305 of stack "revResourceCenter"
# Hash: YqqJ+fIXesePPOmfEPlOvQ==
*/


on dragEnter
  set the acceptDrop to true
end dragEnter

on dragDrop
  set the backgroundColor of the target to the dragData["text"]
  set the label of the target to the backgroundColor of the target && "ball"
end dragDrop
