Script "stack_ZipTest_card_id_1002"

/*
# Name: card "card id 1002" of stack "ZipTest"
# ID: card id 1002 of stack "ZipTest"
# Hash: sjRPVRuyiiORsxMAfTeEGA==
*/


global zip_progress_count
global zip_progress_current
global zip_item_data

on revZipProgressCallback pArchive, pItem, pType, pItemProgress, pItemTotal, pGlobalProgress, pGlobalTotal
  put pArchive & comma into field CallbackLine
  put pItem & comma after field CallbackLine
  put pType & comma after field CallbackLine
  put pItemProgress & comma after field CallbackLine
  put pItemTotal & comma after field CallbackLine
  put pGlobalProgress & comma after field CallbackLine
  put pGlobalTotal & comma after field CallbackLine
end revZipProgressCallback
