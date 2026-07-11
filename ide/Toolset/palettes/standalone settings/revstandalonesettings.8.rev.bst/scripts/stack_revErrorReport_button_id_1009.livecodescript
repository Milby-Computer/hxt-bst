Script "stack_revErrorReport_button_id_1009"

/*
# Name: button "Email" of card id 1002 of stack "revErrorReport" of stack "revStandaloneSettings"
# ID: button id 1009 of card id 1002 of stack "revErrorReport" of stack "revStandaloneSettings"
# Hash: UQEh+LkV7DDP/lR6oiUEmA==
*/



on mouseUp
  revMail the cEmail of this stack,,"Error Report",replaceText(the cReport of this stack & cr &cr&"Comments: "&fld "comments",quote,"'")
end mouseUp
