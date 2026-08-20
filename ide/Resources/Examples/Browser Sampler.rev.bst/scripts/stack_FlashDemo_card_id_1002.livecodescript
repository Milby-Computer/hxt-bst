Script "stack_FlashDemo_card_id_1002"

/*
# Name: card "browserTest" of stack "FlashDemo" of stack "Browser Sampler"
# ID: card id 1002 of stack "FlashDemo" of stack "Browser Sampler"
# Hash: WxpC3Fvyx1X1az8VLVjmcw==
*/


local sError

on preOpenStack
  if the environment is "development" then
    show btn "Browser ON"
  else
    hide btn "Browser ON"
  end if
end preOpenStack

on openstack
    send "initAltBrowser" to this card in 1 second
end openstack

on initAltBrowser
  hilite btn "Browser ON"
   
  abOpenBrowser the altHomeURL of this stack
   
  --  XBrowser_set "showborder",false,the altBrowserID of this stack
  --  XBrowser_Set "scrollbars",false
  --  XBrowser_Set "rect",rect of image "browserimage",the altBrowserID of this stack
  
  revBrowserSet the altBrowserId of this stack, "showborder", false
  revBrowserSet the altBrowserId of this stack, "scrollbars", false
  revBrowserSet the altBrowserId of this stack, "rect", the rect of image "browserimage"
   
end initAltBrowser

#on showBorderHack
#  XBrowser_set "showborder",true
#  XBrowser_Set "rect",rect of image "browserimage"
#  XBrowser_Redraw
#end showBorderHack


on resizeStack
  local tRect
  put the rect of this card into tRect
  get the rect of image "browserimage"
  set the rect of image  "browserimage" to 5, item 2 of it, item 3 of tRect - 5, item 4 of tRect - 5
  #XBrowser_Set "rect",rect of image "browserimage",the altBrowserID of this stack
  revBrowserSet the altBrowserId of this stack, "rect", the rect of image "browserimage"
end resizeStack

on closeStackRequest
  if the altBrowserId of this stack is among the items of revBrowserInstances() then
    revBrowserClose the altBrowserId of this stack
  end if
  set the altBrowserID of this stack to empty
  close this stack
end closeStackRequest

on closeCard
    
end closeCard

on stripAndShip
  unhilite btn "Browser ON"    
  put "" into fld "browserAddress"
  #toggleControls "on"
  set the rect of this stack to 122,164,722,564
  resizeStack
end stripAndShip

on abSuspendBrowser
  if the altBrowserState of this stack is true then
    local tCurrentUrl
    #put XBrowser_Get("url",the altBrowserID of this stack) into tCurrURL
    put revBrowserGet(the altBrowserId of this stack, "url") into tCurrentUrl
    set the altCurrURL of this stack to tCurrentUrl
    #XBrowser_Close the altBrowserID of this stack
    revBrowserClose the altBrowserId of this stack
  end if
end abSuspendBrowser

on abResumeBrowser
  if the altBrowserState of this stack is true then
    abOpenBrowser the altCurrURL of this stack
    
    --    XBrowser_Set "rect",rect of image "browserimage" of this stack,the altBrowserID of this stack
    --    XBrowser_Set "newwindow",false,the altBrowserID of this stack
    --    XBrowser_Set "visible",true,the altBrowserID of this stack
    --    XBrowser_set "showborder",false,the altBrowserID of this stack
    --    XBrowser_Set "scrollbars",false
    
    revBrowserSet the altBrowserId of this stack, "rect", the rect of image "browserimage" of this stack
    revBrowserSet the altBrowserId of this stack, "newwindow", false
    revBrowserSet the altBrowserId of this stack, "visible", true
    revBrowserSet the altBrowserId of this stack, "showborder", false
    revBrowserSet the altBrowserId of this stack, "scrollbars", false
    
    abLoadURL the altCurrURL of this stack
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
    #XBrowser_Set "url",pURL,the altBrowserID of this stack
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
  #XBrowser_Open tWindowId, pURL
  put revBrowserOpen(tWindowId, pUrl) into tBrowserId
  if tBrowserID contains "error" or tBrowserId is not an integer then
    answer "warning" tBrowserId
    exit to top
  end if
  set the altBrowserID of this stack to tBrowserId
end abOpenBrowser

on abIamBusy
    set the repeatcount of img "busy.gif" to -1
end abIamBusy

on abIamNotBusy
    set the repeatcount of img "busy.gif" to 0
    set the currentframe of img "busy.gif" to 1
end abIamNotBusy

on browserClosing pId
end browserClosing

on browserNewUrlWindow pId, pUrl
  answer "link trying to open in new window:"&cr&pURL
  #XBrowser_Set "url",pURL
  revBrowserSet pId, "url", pUrl
end browserNewUrlWindow

on browserNavigateComplete pId, pUrl
end browserNavigateComplete

on browserBeforeNavigate pId, pUrl
  abIamBusy
  global browserCancel
  if pURL contains "xxx.com" then
    abIamNotBusy
    answer warning "Won't allow you to go to domain xxx.com! See BrowserBeforeNavigate!"
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
  put fld "browserAddress" into tURL
  set the altCurrURL of this stack to tURL
end browserDocumentComplete

on browserDocumentCompleteFrame pId, pUrl
  abIamNotBusy
  put pURL into fld "browserAddress" of this stack
  local tUrl
  put fld "browserAddress" of this stack into tURL
  set the altCurrURL of this stack to tURL
end browserDocumentCompleteFrame

on browserDownloadRequest pId, pUrl
  if the platform is "MacOS" then
    if char -4 to -1 of pURL is ".pdf" then
      local tPath
      put the defaultFolder into tPath
      put URL pURL into URL ("binfile:" & tPath & "/test.pdf")
      viewPDF_MacOSX tPath & "/test.pdf"
      abIamNotBusy
    else
      answer information "The browser is attempting to download the file: " & return & \
          pURL & return & return & "Please handle this in the 'DownloadRequest' callback'"
      abIamNotBusy
      XBrowser_Stop
    end if
  end if
end browserDownloadRequest

--on XBrowser_Closing pID
--end XBrowser_Closing
--
--on XBrowser_newURLWindow pURL,pID
--  answer "link trying to open in new window:"&cr&pURL
--  XBrowser_Set "url",pURL
--end XBrowser_newURLWindow
 
--on XBrowser_NavigateComplete pURL,pID
--  
--end XBrowser_NavigateComplete pID
 
--on XBrowser_BeforeNavigate pURL,pID
--  abIamBusy
--  global XBrowserCancel
--  if pURL contains "xxx.com" then
--    abIamNotBusy
--    answer warning "Won't allow you to go to domain xxx.com! See XBrowser_BeforeNavigate!"
--    put true into XBrowserCancel
--  end if
--end XBrowser_BeforeNavigate
 
--on XBrowser_NavigateCompleteFrame pURL,pID
--  
--end XBrowser_NavigateCompleteFrame
 
--on XBrowser_BeforeNavigateFrame pURL,pID
--  abIamBusy
--end XBrowser_BeforeNavigateFrame
 
--on XBrowser_DocumentComplete pURL,pID
--  abIamNotBusy
--  put pURL into fld "browserAddress" of this stack
--  local tUrl
--  put fld "browserAddress" into tURL
--  set the altCurrURL of this stack to tURL
--end XBrowser_DocumentComplete
 
--on XBrowser_DocumentCompleteFrame pURL,pID
--  abIamNotBusy
--  put pURL into fld "browserAddress" of this stack
--  local tUrl
--  put fld "browserAddress" of this stack into tURL
--  set the altCurrURL of this stack to tURL
--end XBrowser_DocumentCompleteFrame

--on XBrowser_DownloadRequest pURL,pID
--  --> MAC SAFARI BROWSER CAN'T DOWNLOAD BINARY FILES
--  if the platform is "MacOS" then
--    if char -4 to -1 of pURL is ".pdf" then
--      #put specialFolderPath("temporary") into tPath
--      local tPath
--      put the defaultFolder into tPath
--      put URL pURL into URL ("binfile:" & tPath & "/test.pdf")
--      viewPDF_MacOSX tPath & "/test.pdf"
--      abIamNotBusy
--    else
--      answer information "The browser is attempting to download the file: " &cr& \
--          pURL &cr&cr& "Please handle this in the 'DownloadRequest' callback'"
--      abIamNotBusy
--      XBrowser_Stop
--    end if
--  end if
--end XBrowser_DownloadRequest

on viewPDF_MacOSX pPDFpath
  if "AppleScript" is not among the lines of the alternateLanguages then
    answer "AppleScript must be installed."
    exit to top
  end if
  put revMacFromUnixPath(pPDFpath) into pPDFpath
   
  local tScript
  put "tell application " &quote& "Finder" & quote & cr into tScript
  put "set the creator type of file " &quote& pPDFpath &quote& \
      " to " &quote& "CARO" &quote& cr after tScript
  put "set the file type of file " &quote& pPDFpath &quote& \
      " to " &quote& "PDF " &quote& cr after tScript
  put "end tell" after tScript
  do tScript as "Applescript"
  put the result into sError
  
  put "tell application " &quote& "Finder" & quote & cr into tScript
  put "open file " &quote& pPDFpath &quote & cr after tScript
  put "end tell" after tScript
  do tScript as "Applescript"
  put the result into sError
  
end viewPDF_MacOSX
