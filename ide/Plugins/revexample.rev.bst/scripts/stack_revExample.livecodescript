Script "stack_revExample"

/*
# Name: stack "revExample"
# ID: stack "revExample"
# Hash: aQj6qZDrpf7LTT4RBCGLcg==
*/


local lTimerId

on resizeStack
  revUpdateGeometry
end resizeStack

on preOpenStack
  set the menuHistory of btn "Tabs" to 1
  go cd 1
end preOpenStack

on preOpenCard
  resizeStack
end preOpenCard

on revSelectedObjectChanged
  revShowMessageReceived "revSelectedObjectChanged"
end revSelectedObjectChanged

on revNameChanged
  revShowMessageReceived "revNameChanged"
end revNameChanged

on revIDChanged
  revShowMessageReceived "revIDChanged"
end revIDChanged

on revEditScript
  revShowMessageReceived "revEditScript"
end revEditScript

on revResizeControl
  revShowMessageReceived "revResizeControl"
end revResizeControl

on revMouseMoved
  revShowMessageReceived "revMouseMoved"
end revMouseMoved


on revMoveControl
  revShowMessageReceived "revMoveControl"
end revMoveControl

on revNewTool
  revShowMessageReceived "revNewTool"
end revNewTool

on revSaveStackRequest
  revShowMessageReceived "revSaveStackRequest"
end revSaveStackRequest

on revChangeWindowSize
  revShowMessageReceived "revChangeWindowSize"
end revChangeWindowSize

on revPreOpenStack
  revShowMessageReceived "revPreOpenStack"
end revPreOpenStack

on revCloseStack
  revShowMessageReceived "revCloseStack"
end revCloseStack

on revResumeStack
  revShowMessageReceived "revResumeStack"
end revResumeStack

on revPreOpenCard
  revShowMessageReceived "revPreOpenCard"
end revPreOpenCard

on revShutDown
  revShowMessageReceived "revShutDown"
end revShutDown

on revShowMessageReceived pMessage
  if the mode of this stack is 0 then exit revShowMessageReceived
  if the textStyle of fld "Title" of grp "Title" is not "bold"
  then set the textStyle of fld "Title" of grp "Title" to "bold"
  cancel lTimerId
  send "revUnboldifyMessage" to me in 500 milliseconds
  put the result into lTimerId
  lock screen
  put pMessage into fld "Plugin Message" of cd 1
  put toLower(char 4 of pMessage) & char 5 to -1 of pMessage into fld "Transcript Message" of cd 1
  put the long id of the target into fld "Target" of cd 1
  put the long time into tTime
  put tTime into fld "Time" of cd 1
  put pMessage && "at" && tTime &cr before fld "Log" of cd 1
  unlock screen
end revShowMessageReceived

on revUnboldifyMessage
  set the textStyle of fld "Title" of grp "Title" to "plain"
end revUnboldifyMessage
