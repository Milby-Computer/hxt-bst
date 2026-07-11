Script "stack_hxtpmSample_card_id_1002"

/*
# Name: card id 1002 of stack "hxtpmSample"
# ID: card id 1002 of stack "hxtpmSample"
# Hash: //2gRUCizBi7svNmbTEpMw==
*/


on OpenCard
   DisplaySourceList
   DisplayPackages "HyperXTalk Official"
end OpenCard


command DisplaySourceList
   local tSources, tSourceList
   put hxtpmSourceList() into tSources
   repeat for each key tIdx in tSources
      put tSources[tIdx]["name"] & return after tSourceList
   end repeat
   filter tSourceList without EMPTY
   set the text of button "repos" to tSourceList
end DisplaySourceList

command DisplayPackages pRepo
   Local tAll, tPackages, i
   put hxtpmAvailable(pRepo) into tAll
   repeat for each key tName in tAll
      add 1 to i
      put tAll[tName] into tPackages[i]
      put tName into tPackages[i]["name"]
   end repeat
   set the dgData of group "packageList" to tPackages
end DisplayPackages
