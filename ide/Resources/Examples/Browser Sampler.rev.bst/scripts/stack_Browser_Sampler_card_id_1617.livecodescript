Script "stack_Browser_Sampler_card_id_1617"

/*
# Name: card "Multiple Instances" of stack "Browser Sampler"
# ID: card id 1617 of stack "Browser Sampler"
# Hash: E5t7CfyhZ7gIY5XSA6bwYw==
*/


on closeCard
    unhilite btn "Browser 1 ON"
    unhilite btn "Browser 2 ON"
    set the vScroll of fld "theText" to 0
    isNotBusy "",true
    pass closeCard
end closeCard

on BrowserDocumentComplete pId, pUrl
  isNotBusy pId
end BrowserDocumentComplete

on BrowserBeforeNavigate pUrl, pId
  isBusy pId
end BrowserBeforeNavigate

on isNotBusy pID, pForceIT
    if pForceIT is true then
        set the repeatcount of img "spin2.gif" to 0
        set the currentframe of img "spin2.gif" to 1
        set the repeatcount of img "spin1.gif" to 0
        set the currentframe of img "spin1.gif" to 1
        exit isNotBusy        
    end if
    switch pID
    case the altBrowserID of btn "Browser 2 ON"
        set the repeatcount of img "spin2.gif" to 0
        set the currentframe of img "spin2.gif" to 1
        break
    case the altBrowserID of btn "Browser 1 ON"
        set the repeatcount of img "spin1.gif" to 0
        set the currentframe of img "spin1.gif" to 1
        break
    end switch
end isNotBusy pID

on isBusy pID
    switch pID
    case the altBrowserID of btn "Browser 2 ON"
        set the repeatcount of img "spin2.gif" to -1
        break
    case the altBrowserID of btn "Browser 1 ON"
        set the repeatcount of img "spin1.gif" to -1
        break
    end switch
end isBusy
