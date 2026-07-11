Script "stack_revStandaloneSettings_button_id_4146"

/*
# Name: button "Disable ATS" of group "Reqs" of group "Requirement" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 4146 of group id 29852 of group id 30344 of card id 1641 of stack "revStandaloneSettings"
# Hash: 0FcjTJsGs8y4b01RBpSOxg==
*/


on mouseUp
   if the hilite of me then
      answer "App Transport Security protects you and users' data from modification and interception by enforcing secure connection. It is recommended to leave it enabled, and provide HTTPS access to your back-end services." with "Disable" or "Cancel" titled "Are you sure you want to disable ATS?"
      
      if it is "Cancel" then
         set the hilite of me to false
      end if
   end if
   
    storeSetting "disable ATS", the hilite of me
end mouseUp
