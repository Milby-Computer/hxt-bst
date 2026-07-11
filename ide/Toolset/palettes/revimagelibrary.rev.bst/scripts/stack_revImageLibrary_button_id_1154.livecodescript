Script "stack_revImageLibrary_button_id_1154"

/*
# Name: button "Add Selected" of group "Buttons" of card "Objects" of stack "revImageLibrary"
# ID: button id 1154 of group id 1167 of card id 1150 of stack "revImageLibrary"
# Hash: ugMNwGmOzxd3rbQkPZ46oQ==
*/


on mouseUp
  put the cStackName of fld "objects list" into tStackName
  if (the selObj) is empty then exit mouseUp
  put (the selObj) into tList
  set the defaultStack to tStackName
  
  repeat for each line l in tList
    if word 1 of l is not in "playerimagescrollbar" then
      if the label of l is not empty then 
        put the label of l into tText
      else 
        put the short name of l into tText
      end if
    else put the short name of l into tText
    if tText is among the lines of fld "objects list" of stack "revImageLibrary" then
      repeat until tText is not among the lines of fld "objects list" of stack "revImageLibrary"
        if last char of tText is a number then add 1 to last char of tText
        else put "1" after tText
      end repeat
    end if
     
    lock messages
    create card tText
    copy l to card tText
    unlock messages
     
    --    repeat with i = 1 to the number of controls on cd tText
    --      set the cREVOrigColors of control i of cd tText to the colors of control i of cd tText
    --      put the effective colors of control i of cd tText into tColors
    --      disable control i of cd tText
    --      set the colors of control i of cd tText to tColors
    --    end repeat
  end repeat
   
  compact stack tStackName
  save stack tStackName
  set the defaultStack to "revImageLibrary"
   
  send "menuPick" && the label of btn "library chooser" to btn "Library chooser"
end mouseUp
