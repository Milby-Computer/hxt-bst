Script "stack_File_Attribs_card_id_1612"

/*
# Name: card "In-App Purchase" of stack "File Attribs"
# ID: card id 1612 of stack "File Attribs"
# Hash: VFBzokCdAHOdITnzmr6YDw==
*/


local sOneTimePurchase
local sRepeatPurchase

on openCard
   if the environment is mobile then
      mobileEnablePurchaseUpdates
   end if
   put empty into field "log"
end openCard

on closeCard
   if the environment is mobile then
      mobileDisablePurchaseUpdates
   end if
end closeCard

on doOneTimePurchase
   mobilePurchaseCreate "com.runrev.purchasetest.nonconsumable"
   put the result into sOneTimePurchase
   mobilePurchaseSendRequest sOneTimePurchase
end doOneTimePurchase

on doRepeatPurchase
   mobilePurchaseCreate "com.runrev.purchasetest.consumable"
   put the result into sRepeatPurchase
   mobilePurchaseSendRequest sRepeatPurchase
end doRepeatPurchase

on doRestorePurchases
   mobileRestorePurchases
end doRestorePurchases

local sMessages
local sMessageDialog = "false"

on showMessage pMsg
   if the last char of pMsg is not return then
      put return after pMsg
   end if
   put pMsg & return before field "log"
end showMessage

on purchaseStateUpdate pPurchaseID
   local tProductID, tState, tQuantity, tPurchaseDate, tTransactionID, tReceipt, tError, tOriginalDate, tOriginalID, tOriginalReceipt
   
   put mobilePurchaseGet(pPurchaseID, "productID") into tProductID
   put mobilePurchaseState(pPurchaseID) into tState
   
   local tMsg
   
   put "purchase id:" && pPurchaseID & return & \
         "product id:" && tProductID & return & \
         "state:" && tState into tMsg
   
   showMessage tMsg
   
   if tState is "paymentReceived" then
      put mobilePurchaseGet(pPurchaseID, "quantity") into tQuantity
      put mobilePurchaseGet(pPurchaseID, "purchaseDate") into tPurchaseDate
      put mobilePurchaseGet(pPurchaseID, "transactionIdentifier") into tTransactionID
      put mobilePurchaseGet(pPurchaseID, "receipt") into tReceipt
      
      put "transactionID:" && tTransactionID & return & \
            "quantity:" && tQuantity & return & \
            "purchaseDate:" && tPurchaseDate & return & \
            "receipt:" && (the number of bytes in tReceipt) && "bytes" into tMsg
      
      showMessage tMsg
      
      mobilePurchaseConfirmDelivery pPurchaseID
      
   else if tState is "restored" then
      put mobilePurchaseGet(pPurchaseID, "quantity") into tQuantity
      put mobilePurchaseGet(pPurchaseID, "purchaseDate") into tPurchaseDate
      put mobilePurchaseGet(pPurchaseID, "transactionIdentifier") into tTransactionID
      put mobilePurchaseGet(pPurchaseID, "receipt") into tReceipt
      
      put mobilePurchaseGet(pPurchaseID, "originalPurchaseDate") into tOriginalDate
      put mobilePurchaseGet(pPurchaseID, "originalTransactionIdentifier") into tOriginalID
      put mobilePurchaseGet(pPurchaseID, "originalReceipt") into tOriginalReceipt
      
      put "transactionID:" && tTransactionID & return & \
            "quantity:" && tQuantity & return & \
            "purchaseDate:" && tPurchaseDate & return & \
            "receipt:" && (the number of bytes in tReceipt) && "bytes" & return & \
            "originalTransactionID:" && tOriginalID & return & \
            "originalPurchaseDate:" && tOriginalDate & return & \
            "originalReceipt:" && (the number of bytes in tOriginalReceipt) && "bytes" into tMsg
      
      showMessage tMsg
      
      mobilePurchaseConfirmDelivery pPurchaseID
      
   else if tState is "error" then
      put mobilePurchaseError(pPurchaseID) into tError
      put mobilePurchaseGet(pPurchaseID, "quantity") into tQuantity
      put mobilePurchaseGet(pPurchaseID, "purchaseDate") into tPurchaseDate
      put mobilePurchaseGet(pPurchaseID, "transactionIdentifier") into tTransactionID
      put mobilePurchaseGet(pPurchaseID, "receipt") into tReceipt
      
      put "error:" && tError & return & \
            "transactionID:" && tTransactionID & return & \
            "quantity:" && tQuantity & return & \
            "purchaseDate:" && tPurchaseDate & return & \
            "receipt:" && (the number of bytes in tReceipt) && "bytes" into tMsg
      
      showMessage tMsg
      
   end if
end purchaseStateUpdate
