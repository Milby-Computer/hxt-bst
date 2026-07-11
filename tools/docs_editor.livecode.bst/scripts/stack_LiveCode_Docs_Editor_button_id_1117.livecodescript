Script "stack_LiveCode_Docs_Editor_button_id_1117"

/*
# Name: button "edit sections" of group "xml editing" of card "card id 1002" of stack "LiveCode Docs Editor"
# ID: button id 1117 of group id 1102 of card id 1002 of stack "LiveCode Docs Editor"
# Hash: LCoObYxd5cMWOv3JTgsdiA==
*/


on menuPick pItemName
   hideGroups
   show group pItemName
end menuPick

on hideGroups
   hide group "basics"
   hide group "history"
   hide group "properties"
   hide group "classifications"
   hide group "references"
   hide group "description"
end hideGroups
