Script "stack_InetBrowser_card_id_1002"

/*
# Name: card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: Ls6t9DnN6OSXP49Gx1WjSw==
*/



on preOpenStack
  if the environment is "development" then
    show btn "Browser ON"
  else
    hide btn "Browser ON"
  end if
end preOpenStack

on openstack
    toggleControls "on"
    send "initAltBrowser" to this card in 1 second
end openstack

on initAltBrowser
  hilite btn "Browser ON"
   
  abOpenBrowser the altHomeURL of this stack
   
  revBrowserSet the altBrowserId of this stack, "showborder", true
  revBrowserSet the altBrowserId of this stack, "rect", the rect of image "browserimage"
  revBrowserRedraw the altBrowserId of this stack
end initAltBrowser

on resizeStack
  local tRect
  put the rect of this card into tRect
  set the width of field "browseraddress" to width of this card - 114
  set the width of grc "topBack" to width of this card
  set the width of btn "bDiv1" to width of this card
  set the width of btn "bDiv2" to width of this card
  set the width of btn "bDiv3" to width of this card
  set the right of img "busy.gif" to the width of this card
  set the right of btn "GO" to the width of this card -10
  set rect of field "logfield" to 2, item 4 of tRect-22, item 3 of tRect-2, item 4 of tRect-2
   
  get the rect of image "browserimage"
  set the rect of image  "browserimage" to 5, item 2 of it,item 3 of trect-5,item 4 of trect-26
  
  -- OK-2007-11-23 : Bug 5445
  if the altBrowserId of this stack is among the items of revBrowserInstances() then 
    revBrowserSet the altBrowserId of this stack, "rect", the rect of image "browserimage"
  end if
end resizeStack

on closeStackRequest
  local tBrowserId
  put the altBrowserID of this stack into tBrowserId
  if tBrowserId is among the items of revBrowserInstances() then
    revBrowserClose tBrowserId
  end if
  set the altBrowserID of this stack to empty
  close this stack
end closeStackRequest

on closeCard
    
end closeCard

on stripAndShip
  unhilite btn "Browser ON"    
  put "" into fld "browserAddress"
  toggleControls "on"
  set the rect of this stack to 122,164,722,564
  resizeStack
end stripAndShip

on toggleControls pState
  if pState is "off" then
    disable btn "Back"
    disable btn "Forward"
    disable btn "Refresh"
    disable btn "Stop"
    disable btn "Go"
    disable btn "Home"
    disable fld "browserAddress"
  else
    enable btn "Back"
    enable btn "Forward"
    enable btn "Refresh"
    enable btn "Stop"
    enable btn "Go"
    enable btn "Home"
    enable fld "browserAddress"
  end if
end toggleControls

on abSuspendBrowser
  if the altBrowserId of this stack is not among the items of revBrowserInstances() then
    exit abSuspendBrowser
  end if
  
  local tCurrentUrl
  if the altBrowserState of this stack is true then
    put revBrowserGet(the altBrowserId of this stack, "url") into tCurrentUrl
    set the altCurrURL of this stack to tCurrentUrl
    revBrowserClose the altBrowserId of this stack
    toggleControls "off"    
  end if
end abSuspendBrowser

on abResumeBrowser
  if the altBrowserState of this stack is true then
     
    abOpenBrowser the altCurrURL of this stack
    
    revBrowserSet the altBrowserId of this stack, "rect", the rect of image "browserimage" of this stack
    revBrowserSet the altBrowserId of this stack, "newwindow", false
    revBrowserSet the altBrowserId of this stack, "visible", true
    revBrowserSet the altBrowserId of this stack, "showborder", true
    
    abLoadURL the altCurrURL of this stack
    toggleControls "on" 
  end if
end abResumeBrowser

on abLoadURL pURL
  local tPrefix
  put char 1 to 6 of pURL into tPrefix
  switch tPrefix
  case "http:/"
  case "file:/"
  case "https:"
    break
  case "ftp://"
    if the platform is "MacOS" then
      answer "Sorry, Safari browser won't do FTP :-("
      exit to top
    end if
    break
  default
    put "http://" before pURL
    put pURL into fld "browserAddress" of stack "InetBrowser"
    break
  end switch
   
  if the altBrowserState of this stack is true then
    revBrowserSet the altBrowserId of this stack, "url", pUrl
  else
    initAltBrowser
  end if
  set the altCurrURL of this stack to pURL
end abLoadURL

on abOpenBrowser pURL
  local tWindowId
  put the windowid of this stack into tWindowId
  
  local tBrowserId
  put revBrowserOpen(tWindowId, pUrl) into tBrowserId
   
  if tBrowserID contains "error" or tBrowserId is not an integer then
    answer warning tBrowserId
    exit to top
  end if
  set the altBrowserID of this stack to tBrowserId
end abOpenBrowser

on abIamBusy
  set the repeatcount of img "busy.gif" to -1
  put "Accessing page:" && the altCurrURL of this stack into fld "logfield" of this stack
end abIamBusy

on abIamNotBusy
  set the repeatcount of img "busy.gif" to 0
  set the currentframe of img "busy.gif" to 1
  put "Finished" into fld "logfield" of this stack
end abIamNotBusy

on browserClosing pId
end browserClosing

on browserNewUrlWindow pId, pUrl
  answer "link trying to open in new window:"&cr&pURL
  revBrowserSet pId, "url", pUrl
end browserNewUrlWindow

on browserNavigateComplete pId, pUrl
end browserNavigateComplete

on browserBeforeNavigate pId, pUrl
  abIamBusy
  global browserCancel
  if pURL contains "xxx.com" then
    abIamNotBusy
    answer warning "Won't allow you to go to domain xxx.com! See XBrowser_BeforeNavigate!"
    put true into browserCancel
  end if
end browserBeforeNavigate

on browserNavigateCompleteFrame pId, pUrl
end browserNavigateCompleteFrame

on browserBeforeNavigateFrame pId, pUrl
  abIamBusy
end browserBeforeNavigateFrame

on browserDocumentComplete pId, pUrl
  abIamNotBusy
  put pURL into fld "browserAddress" of this stack
   
  local tUrl
  put fld "browserAddress" into tUrl
  set the altCurrURL of this stack to tUrl
end browserDocumentComplete

on browserDocumentCompleteFrame pId, pUrl
  abIamNotBusy
  put pURL into fld "browserAddress" of this stack
  local tUrl
  put fld "browserAddress" of this stack into tUrl
  set the altCurrURL of this stack to tUrl
end browserDocumentCompleteFrame

on browserDownloadRequest pId, pUrl
  answer information "The browser is attempting to download the file: " & return & \
      pURL & return & return & "Please handle this in the 'DownloadRequest' callback'"
  abIamNotBusy
  #revBrowserStop the altBrowserId of this stack
end browserDownloadRequest
