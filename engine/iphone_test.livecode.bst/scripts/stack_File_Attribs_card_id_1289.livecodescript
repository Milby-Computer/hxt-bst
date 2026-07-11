Script "stack_File_Attribs_card_id_1289"

/*
# Name: card "Snapshot" of stack "File Attribs"
# ID: card id 1289 of stack "File Attribs"
# Hash: Lax3x6mxpvMr1WajYW94Wg==
*/


local sBrowser

on openCard
   if the environment is "mobile" then
      iphoneControlCreate "browser", "snapshotbrowser"
      iphoneControlSet "snapshotbrowser", "rect", the rect of graphic "browserplaceholder"
      iphoneControlSet "snapshotbrowser", "url", "http://www.google.co.uk"
   end if
end openCard
