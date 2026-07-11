Script "stack_revResourceCenter_group_id_579784"

/*
# Name: group "Colors" of group "Example" of group id 579796 of group "mainContent" of card "Dragdropabackgroundcolorontoanobject" of stack "revResourceCenter"
# ID: group id 579784 of group id 579783 of group id 579796 of group id 80325 of card id 80305 of stack "revResourceCenter"
# Hash: s6IZAs7Mq8S1pHogmzVJGg==
*/


on mouseDown
  set the dragData["text"] to the short name of the target
  set the borderWidth of the target to 3
end mouseDown

on dragEnd
  set the borderWidth of the target to 1
end dragEnd
