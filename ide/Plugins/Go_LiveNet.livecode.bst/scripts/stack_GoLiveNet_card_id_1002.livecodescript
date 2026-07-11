Script "stack_GoLiveNet_card_id_1002"

/*
# Name: card id 1002 of stack "GoLiveNet"
# ID: card id 1002 of stack "GoLiveNet"
# Hash: kfLqmgSZjeCrfROFlZ9HkA==
*/


--============================================================================================--
--
-- GoLiveNet Script
--
-- R. Gaskin
-- Fourth World Systems
-- http://www.fourthworld.com
-- ambassador@fourthworld.com
-- 
--=============================================================================================--


local sTime, sCancelled
local sProgressInterval = 250



on preOpenCard
  InitGoLiveNet
end preOpenCard


on InitGoLiveNet
  -- Init UI:
  hide sb "revnetProgress" of stack "GoLiveNet"
  show btn "revnetCancel" of stack "GoLiveNet"
  put "Version "& the uRIP["version"] of this stack into fld "revnetStatus"  of stack "GoLiveNet"
  set the rect of btn "revnetCancel"  of stack "GoLiveNet" to the rect of btn "Go RevNet"  of stack "GoLiveNet"
  hide btn "Go RevNet"  of stack "GoLiveNet"
  set the loc of stack "GoLiveNet" to fwAlertLoc()
  --
  set the style of stack "GoLiveNet" to "toplevel"
  -- Allow method to open without auto-go:
  if (the shiftKey is "up") then
    GoLiveNet "closewhendone"
  end if
end InitGoLiveNet



on GoLiveNet
  put "http://www.fourthworld.net/livenet/LiveNet.livecode.gz" into tUrl
  if the shiftkey is "down" then unload url tUrl
  put false into sCancelled
  if tUrl is among the lines of the cachedUrls then
    _rnCleanExit tUrl, "", "done"
  else
    set the cursor to watch
    revnetPutS "Connecting to "&UrlDomain(tUrl) &"..."
    unload url tUrl
    if there is a button "revnetCancel"  of stack "GoLiveNet" then
      set the rect of btn "revnetCancel"  of stack "GoLiveNet" to the rect of btn "Go RevNet"
      show btn "revnetCancel" of stack "GoLiveNet"
      hide btn "Go RevNet" of stack "GoLiveNet"
    end if
    load url tUrl
    show sb "revnetProgress" of stack "GoLiveNet"
    revnetPutS "Downloading "& lpc(tUrl)
    set the thumbPos of sb 1  of stack "GoLiveNet" to 0
    send "revnetUpdateProgress" &&q(tUrl) to me in sProgressInterval milliseconds
    put the long seconds into sTime
  end if
end GoLiveNet



on revnetUpdateProgress pUrl
  local tStatus, nk
  if (sCancelled) then _rnCleanExit pUrl, "You've cancelled the download."
  put urlStatus(pUrl) into tStatus
  switch
  case (tStatus contains "not found")
    _rnCleanExit pUrl, "The resource " & q(pUrl)  &" was not found."
    break
    --
  case (tStatus contains "error")
  case (tStatus contains "timeout")
    _rnCleanExit pUrl, "Error downloading URL" && q(lpc(pUrl))  & cr \
        & "Check network connection and proxy setup."
    break
    --
  case (tStatus contains "cached")
    set the defaultstack to the topstack
    if (there is a sb "revnetProgress"  of stack "GoLiveNet") then
      set the thumbpos of sb "revnetProgress"  of stack "GoLiveNet" to (the endValue of sb "revnetProgress"  of stack "GoLiveNet")
    end if
    wait 250 milliseconds
    _rnCleanExit pUrl, "", "done"
    break
    --
  case (item 1 of tStatus is "loading")
    put item 2 of tStatus div 1024 into nk
    # revnetPutS "Downloading "& lpc(pUrl) &" from "&UrlDomain(pUrl) &cr&
    revnetPutS "Downloading "& lpc(pUrl) &cr&\
        nk & "K/" & item 3 of tStatus div 1024 & "K  "\
        & nk * 10 div (the long seconds - stime) / 10 & "K/sec"
    set the endValue of sb "revnetProgress" to item 3 of tStatus
    set the thumbpos of sb "revnetProgress" to item 2 of tStatus
    send "revnetUpdateProgress" && q(pUrl) to me in sProgressInterval milliseconds
    break
    --
  default
    revnetPutS tStatus
    send "revnetUpdateProgress" && q(pUrl) to me in sProgressInterval milliseconds
  end switch
end revnetUpdateProgress


on _rnCleanExit pUrl, pMessage, pDoneFlag
  local tStack
  --
  revnetPutS pMessage
  if pDoneFlag is not empty then
    set the cursor to watch
    if (char -3 to -1 of pUrl = ".gz") then
      put decompress( url pUrl) into tStack
    else put url pUrl into tStack
    if ( (char 1 to 9 of tStack = "#!/bin/sh") OR (char 1 to 4 of tStack = "REVO")) then
      revnetPutS
      hide sb "revnetProgress" of stack "GoLiveNet"
      close stack "GoLiveNet"
      go stack tStack
    else
      revnetPutS lpc(pUrl)&" is not a stack file."
      unload url pUrl
    end if
  else
    unload url pUrl
    if there is a sb "revnetProgress" of stack "GoLiveNet" then
      hide sb "revnetProgress" of stack "GoLiveNet"
      set the thumbpos of sb "revnetProgress"  of stack "GoLiveNet" to 0
    end if
  end if
  if there is a button "revnetCancel"  of stack "GoLiveNet" then
    show btn "Go RevNet"  of stack "GoLiveNet"
    hide btn "revnetCancel"  of stack "GoLiveNet"
  end if
  exit _rnCleanExit
end _rnCleanExit



function UrlDomain p
  set the itemdel to "/"
  return item 3 of p
end UrlDomain





on revNetClose
  local tMessages
  --
  put the pendingmessages into tMessages
  repeat for each line tMsg in tMessages
    if "revNet" is in tMsg then
      get item 1 of tMsg
      cancel it
    end if
  end repeat
  if "dev" is not in the environment then quit
end revnetClose



on revnetCancel
  put true into sCancelled
  if there is a button "revnetCancel"  of stack "GoLiveNet" then
    hide btn "revnetCancel" of stack "GoLiveNet"
    hide sb "revnetProgress" of stack "GoLiveNet"
    show btn "Go RevNet" of stack "GoLiveNet"
  end if
end revnetCancel



on revnetPutS s
  put s into fld "revnetStatus" of stack "GoLiveNet"
end revnetPutS



function q s
  return quote& s &quote
end q

function lpc p
  set the itemdel to "/"
  return last item of p
end lpc


function fwAlertLoc
  local tLoc
  --
  put item 1 of the screenloc into item 1 of tLoc
  put ((item 4 of the screenrect) div 5)*2 into item 2 of tLoc
  return tLoc
end fwAlertLoc


on fwErr pResult, pMessage, pNoExitFlag
  if pResult is not empty then
    if pMessage is not empty then 
      answer pMessage
    else answer pResult
    if pNoExitFlag is empty then
      exit to top
    end if
  end if
end fwErr



on fwGoURL pURL
  launch url pUrl
end fwGoURL


