Script "stack_revDataViewControl_button_id_1008"

/*
# Name: button "Test" of card id 1002 of stack "revDataViewControl" of stack "revCore"
# ID: button id 1008 of card id 1002 of stack "revDataViewControl" of stack "revCore"
# Hash: oYYtnPHv77KR6ZSxW8j6ww==
*/


on mouseUp
   put the long id of button "Template" into theTemplatesA["default"]
   put the long id of field "Template 2" into theTemplatesA["special"]
   set the viewProp["row style templates"] of group "DataView" to theTemplatesA
   
   repeat with i = 1 to 100
      put "Line" && i into theA["data"][i]["name"]
   end repeat
   
   set the uData of group "DataView" to theA
   dispatch "RenderView" to group "DataView"
end mouseUp
