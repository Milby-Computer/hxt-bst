Script "stack_File_Attribs_card_id_1391"

/*
# Name: card "Compose Mail" of stack "File Attribs"
# ID: card id 1391 of stack "File Attribs"
# Hash: Qm3KhLki0ilbqVQWMoBoQg==
*/


on doCompose
   local tTo, tCC, tBCC, tSubject
   put field "To" into tTo
   put field "CC" into tCC
   put field "BCC" into tBCC
   put field "Subject" into tSubject
   
   local tLogo
   if the hilite of button "Attach Logo" then
      put "image/png" into tLogo["type"]
      put "LiveCodeLogo.png" into tLogo["name"]
      put the text of image "Logo" into tLogo["data"]
   end if
   
   local tMovie
   if the hilite of button "Attach Movie" then
      put "video/mp4" into tMovie["type"]
      put "QuickTime.mp4" into tMovie["name"]
      put specialFolderPath("engine") & slash & "quicktime.mp4" into tMovie["file"]
   end if
   
   local tAttachments
   if tLogo is an array and tMovie is an array then
      put tLogo into tAttachments[1]
      put tMovie into tAttachments[2]
      put tMovie into tAttachments[3]
   else if tLogo is an array then
      put tLogo into tAttachments
   else if tMovie is an array then
      put tMovie into tAttachments
   end if
   
   if the hilite of button "Plain" then
      iphoneComposeMail tSubject, tTo, tCC, tBCC, the text of field "Body", tAttachments
   else if the hilite of button "Unicode" then
      iphoneComposeUnicodeMail uniEncode(tSubject), tTo, tCC, tBCC, the unicodeText of field "Body", tAttachments
   else
      iphoneComposeHtmlMail uniEncode(tSubject), tTo, tCC, tBCC, the text of field "Body", tAttachments
   end if
end doCompose
