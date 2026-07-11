Script "stack_revGettingStartedScripts_group_id_1122"

/*
# Name: group "Colors" of bkgnd "Drag drop a background color onto an object Example" of stack "revGettingStartedScripts"
# ID: group id 1122 of bkgnd id 1121 of stack "revGettingStartedScripts"
# Hash: s6IZAs7Mq8S1pHogmzVJGg==
*/


on mouseDown
  set the dragData["text"] to the short name of the target
  set the borderWidth of the target to 3
end mouseDown

on dragEnd
  set the borderWidth of the target to 1
end dragEnd
