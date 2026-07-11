Script "stack_rTreeEngine_button_id_2602"

/*
# Name: button "nodeGridBehavior" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2602 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: /l2F5yVjTIx/OAZkgagyVw==
*/


global
local

on renderNode tData # tData is an array of all the data for this row/node. It has the form: tData[name of the control][property]
   put the left of group "columnHeaders" of the owner of me into tLeft
   repeat with i = 1 to the number of controls of group "columnHeaders" of the owner of me
      set the left of control i of group "columnHeaders" of the owner of me to tLeft
      if i = 1 then next repeat
      put the right of control i of group "columnHeaders" of the owner of me - 1 into tLeft
      if i = 3 then subtract 1 from tLeft
   end repeat
   repeat with i = 1 to the number of controls of me
      switch
         case word 1 of the name of control i of me is "field"
            -- if the short name of the target is "cellTemplate" then put tData[i][htmlText] into control i of me
            -- set the backgroundColor of control i of me to empty
            if tData["children"] is not empty
            then
               -- set the backgroundColor of control i of me to 228,228,228
            end if
            if control i of me is not empty
            then
               -- set the backgroundColor of control i of me to 244,255,255
            end if
            break
         case word 1 of the name of control i of me is "graphic"
            
            break
      end switch
   end repeat
   if tData["children"] is empty then set the icon of control "firstIcon" of me to 0
   set the left of control 2 of me to the left of me + 1
   set the label of control 2 of me to tData["number"]
   pass renderNode
end renderNode

# on rawKeyUp
   switch
      case word 1 of the name of the target is "field"
         set the nodeData[the nodeID of me,the short name of the target,htmlText] of the owner of me to the htmlText of the target
         break
   end switch
   pass rawKeyUp
end rawKeyUp

on mouseDown
   
   pass mouseDown
end mouseDown

on mouseUp
   switch word 1 of the name of the target
      case "button"
         switch
            case the style of the target is "checkBox"
               set the nodeData[the nodeID of me,the short name of the target,hilited] of the owner of me to the hilited of the target
               break
            case the style of the target is "radioButton"
               if the radioBehavior of the owner of me is true
               then
                  set the hilitedRadioNodeID of the owner of me to the nodeID of me
               else
                  set the nodeData[the nodeID of me,the short name of the target,hilited] of the owner of me to the hilited of the target
               end if
               break
         end switch
         break
      case "field"
         
         break
      case "player"
         beep
         start player "player" -- (the short name of the target)
         break
   end switch
   send "renderTree" to the owner of me
   pass mouseUp
end mouseUp

on menuPick tChoice
   set the nodeData[the nodeID of me,the short name of the target,menuHistory] of the owner of me to the menuHistory of the target
   pass menuPick
end menuPick
