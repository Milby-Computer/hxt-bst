Script "stack_Message_Box"

/*
# Name: stack "Message Box"
# ID: stack "Message Box"
# Hash: yoRY/GifOrIhuzhMREOotA==
*/


on ideInitialiseMessageBox
   dispatch "setAsBehavior" to stack revIDEPaletteResourcePath("/behaviors/revmessageboxbehavior.livecodescript") with the long id of me
   set the behavior of card "Single Line" of me to the long id of stack revIDEMessageBoxBehavior("single line card")
   set the behavior of field "message" of card "Single Line" of me to the long id of stack revIDEMessageBoxBehavior("single line message")
   set the behavior of card "Multiple Lines" of me to the long id of stack revIDEMessageBoxBehavior("multiple lines card")
   set the behavior of field "script" of card "Multiple Lines" of me to the long id of stack revIDEMessageBoxBehavior("multiple lines message")
   set the behavior of group "fields" of card "Multiple Lines" of me to the long id of stack revIDEScriptEditorBehavior("common editor")
   revIDESubscribe "ideMsgChanged"
end ideInitialiseMessageBox
