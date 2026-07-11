Script "stack_revRCDownloadProgress"

/*
# Name: stack "revRCDownloadProgress" of stack "revResourceCenter"
# ID: stack "revRCDownloadProgress" of stack "revResourceCenter"
# Hash: 5jKf9wLag9R/I/uw8gLZOA==
*/


on preOpenStack
   updateProgress 0
end preOpenStack

command updateProgress pPercentage
   set the thumbPosition of scrollbar "Progress" of me to pPercentage
end updateProgress

on preOpenCard
end preOpenCard

on openCard
end openCard

on escapeKey
   resourceDownloadCancel
   close this stack
end escapeKey
