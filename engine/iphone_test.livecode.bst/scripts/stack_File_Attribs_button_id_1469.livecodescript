Script "stack_File_Attribs_button_id_1469"

/*
# Name: button "Export Images" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1469 of card id 1009 of stack "File Attribs"
# Hash: qLhWdn65ifYCsF0Wn/eh2Q==
*/


on mouseUp
   iphoneExportImageToAlbum the long id of image "JPEG Image"
   iphoneExportImageToAlbum the long id of image "GIF Image"
   iphoneExportImageToAlbum the long id of image "PNG Image"
   
   iphoneExportImageToAlbum image "JPEG Image"
   iphoneExportImageToAlbum image "GIF Image"
   iphoneExportImageToAlbum image "PNG Image"
end mouseUp
