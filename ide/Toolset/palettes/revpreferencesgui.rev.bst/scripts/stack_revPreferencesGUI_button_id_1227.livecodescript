Script "stack_revPreferencesGUI_button_id_1227"

/*
# Name: button "Delete account" of group "Login options" of group "revOnline" of card "RevOnline" of stack "revPreferencesGUI"
# ID: button id 1227 of group id 1224 of group id 1223 of card id 1014 of stack "revPreferencesGUI"
# Hash: QFhbG1vknBcMLj6OJtdqhA==
*/


on mouseUp
   if revOnlineSession() is empty then
      revOnlineShowLoginDialog
   end if
   
   if revOnlineSession() is empty then
      exit mouseUp
   end if
   
   ask password clear "If you are sure you want to delete your RevOnline account, please confirm your password"
   if it is empty or the result is "Cancel" then
      exit mouseUp
   end if
   
   revOnlineDeleteAccount revOnlineSession(), md5digest(it), "deleteAccountCallback", the long id of me
end mouseUp

command deleteAccountCallback pResult
   if pResult then
      answer "Your account was successfullly deleted"
   else
      answer "There was an error deleting your account: " & pResult
   end if
end deleteAccountCallback
