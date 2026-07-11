Script "stack_revIDEProjectBrowser_group_id_656485"

/*
# Name: group "pbDragIndicator" of card "templates" of stack "revIDEProjectBrowser"
# ID: group id 656485 of card id 5773 of stack "revIDEProjectBrowser"
# Hash: r6n9fRJu85MPgwt28iPE7g==
*/


on resizeControl
   set the width of me to the width of this stack
   set the width of graphic "indicator" of me to the width of this stack
   set the left of graphic "indicator" of me to 0
end resizeControl

--on PositionDropIndicator pParam, pParam2
--   put "position drop" && pParam && pParam2 & return before msg
--end PositionDropIndicator
