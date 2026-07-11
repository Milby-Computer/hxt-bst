Script "stack_livecodeTestInterface_button_id_84522"

/*
# Name: button "ChooseAutomation" of card "settings" of stack "livecodeTestInterface"
# ID: button id 84522 of card id 10862 of stack "livecodeTestInterface"
# Hash: 0lxsKEfL/rJB2c1YwG4bag==
*/


on mouseUp
   local tTemplate
   answer file "Please choose the XCode installation containing your Automation Template" with type "APPL|app" 
   if the result is not "cancel" then
      put it & "/Contents/Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate" into tTemplate
      if there is a file tTemplate then
         put tTemplate into field "automation template location"
      else
         put empty into field "automation template location"
      end if
   end if
end mouseUp
