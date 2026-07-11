Script "stack_revPreferencesGUI_button_id_1311"

/*
# Name: button "Remove entry" of group "iOS SDKs" of card "Mobile Support" of stack "revPreferencesGUI"
# ID: button id 1311 of group id 1261 of card id 1254 of stack "revPreferencesGUI"
# Hash: IRNdXf2j2i7ZtQalskENlg==
*/


on mouseUp
   local tSDKs
   repeat for each item tSDK in the hilitedLine of field "iOS SDKs"
      if tSDKs is not empty then
         put return after tSDKs
      end if
      put line tSDK of field "iOS SDKs" after tSDKs
   end repeat
   removeIOSSDK tSDKs   
end mouseUp
