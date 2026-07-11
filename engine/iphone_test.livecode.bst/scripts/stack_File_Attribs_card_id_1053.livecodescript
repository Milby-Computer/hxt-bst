Script "stack_File_Attribs_card_id_1053"

/*
# Name: card "URL functions" of stack "File Attribs"
# ID: card id 1053 of stack "File Attribs"
# Hash: TzBY/NmFcX/7OLP42vXPYQ==
*/


on preOpenCard
   if the environment is not "mobile" then
      libUrlSetStatusCallback "urlProgress", the long ID of me
   end if
   put empty into the last field
   pass preOpenCard
end preOpenCard

on closeCard
   if the environment is not "mobile" then
      libUrlSetStatusCallback
   end if
end closeCard

on urlProgress pURL, pStatus, pRecieved, pTotal
   put pStatus && pURL && pRecieved && pTotal & return after the last field
end urlProgress

local sURL = "http://downloads.runrev.com/revselect/trev/tRev-Mac.zip"

function binURL
   return sURL
end binURL

------------------

on startReaching
   iphoneSetReachabilityTarget "www.runrev.com"
end startReaching

on stopReaching
   iphoneSetReachabilityTarget empty
end stopReaching

on reachabilityChanged pTarget, pStatus
   put "reach" && pTarget && pStatus & return after the last field
   set the vScroll of the last field to 32767
end reachabilityChanged
