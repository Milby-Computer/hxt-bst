Script "stack_test-template_card_id_1002"

/*
# Name: card "meta-data" of stack "test-template" of stack "livecodeTestInterface"
# ID: card id 1002 of stack "test-template" of stack "livecodeTestInterface"
# Hash: OEeqDXm2u1kO1NZoPfGYWQ==
*/


on setMetaData
   local tTestMetaData, tStandaloneData, tKey
   
   put empty into tTestMetaData
   // Uncomment the following line if you want to inherity the standalone settings as set in the IDE.
   // put the customProperties["cRevStandaloneSettings"] of this stack into tStandaloneData
   
   // The meta data that groups the tests.
   //-----------------------------
   //put "arrays," after tTestMetaData["group"]
   //put "datetime," after tTestMetaData["group"]
   //put "engine," after tTestMetaData["group"]
   //put "files," after tTestMetaData["group"]
   //put "filters," after tTestMetaData["group"]
   //put "graphics," after tTestMetaData["group"]
   //put "ide," after tTestMetaData["group"]
   //put "interface," after tTestMetaData["group"]
   //put "legacy," after tTestMetaData["group"]
   //put "logic," after tTestMetaData["group"]
   //put "math," after tTestMetaData["group"]
   //put "multimedia," after tTestMetaData["group"]
   //put "network," after tTestMetaData["group"]
   //put "pasteboard," after tTestMetaData["group"]
   //put "scripting," after tTestMetaData["group"]
   //put "security," after tTestMetaData["group"]
   //put "string," after tTestMetaData["group"]
   //put "text," after tTestMetaData["group"]
   
   // The meta data that specifies what resource files should be included.
   //------------------------------------------------------
   // put "XXXXX.livecode," after tTestMetaData["resource-stack"]
   // put "XXXXXX.livecode," after tTestMetaData["resource-stack"]
   
   // The meta data that specifies what devices a test can run on.
   //------------------------------------------------
   //put "MacOS," after tTestMetaData["platform"]
   //put "Linux," after tTestMetaData["platform"]
   //put "Win32," after tTestMetaData["platform"]
   //put "Android," after tTestMetaData["platform"]
   //put "iOS," after tTestMetaData["platform"]
   
   // The meta data that specifies what devices a test cannot run on.
   //--------------------------------------------------
   //put "MacOS," after tTestMetaData["not-platform"]
   //put "Linux," after tTestMetaData["not-platform"]
   //put "Win32," after tTestMetaData["not-platform"]
   //put "Android," after tTestMetaData["not-platform"]
   //put "iOS," after tTestMetaData["not-platform"]
   
   // The meta data that specifies what iOS standalone configuration settings are altered.
   //-------------------------------------------------------------------
   //put empty into tStandaloneData ["ios"] // true | false
   //put empty into tStandaloneData ["ios,build type"] // "Arm v6" | "Arm v7" | "Universal"
   //put empty into tStandaloneData ["ios,bundle id"] // 
   //put empty into tStandaloneData ["ios,bundle version"] // x.x.x
   //put empty into tStandaloneData ["ios,device capabilities"]["accelerometer"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["auto-focus-camera"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["camera-flash"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["front-facing-camera"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["gamekit"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["gps"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["gyroscope"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["location-services"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["magnetometer"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["microphone"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["opengles-1"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["opengles-2"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["peer-peer"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["sms"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["still-camera"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["telephony"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["video-camera"] // true | false | empty
   //put empty into tStandaloneData ["ios,device capabilities"]["wify"] // true | false | empty
   //put empty into tStandaloneData ["ios,device family"] // 1 | 2 | 3
   //put empty into tStandaloneData ["ios,display name"] // NAME TO DISPLAY
   //put empty into tStandaloneData ["ios,exits on suspend"] // 
   //put empty into tStandaloneData ["ios,file sharing"] // true | false
   //put empty into tStandaloneData ["ios,icon"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,include dbmysql"] // true | false
   //put empty into tStandaloneData ["ios,include dbsqlite"] // true | false
   //put empty into tStandaloneData ["ios,include revpdfprinter"] // true | false
   //put empty into tStandaloneData ["ios,include revxml"] // true | false
   //put empty into tStandaloneData ["ios,include revzip"] // true | false
   //put empty into tStandaloneData ["ios,initial orientation"] // "Portrait" | "Landscape"
   //put empty into tStandaloneData ["ios,interface orientations"] // 
   //put empty into tStandaloneData ["ios,ipad icon"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,ipad initial orientations"] // Portrait, | PortraitUpsideDown, | LandscapeLeft, | LandscapeRight,
   //put empty into tStandaloneData ["ios,ipad landscape splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,ipad portrait splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,ipad retina icon"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,ipad retina landscape splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,ipad retina portrait splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,iphone 4inch splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,iphone icon"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,iphone initial orientation"] // "Portrait" | "Landscape"
   //put empty into tStandaloneData ["ios,iphone splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,minimum version"] // "4.3" | "5.0" | "5.1" | "6.0" | "6.1"
   //put empty into tStandaloneData ["ios,persistent wifi"] // true | false
   //put empty into tStandaloneData ["ios,prerendered icon"] // true | false
   //put empty into tStandaloneData ["ios,profile"] // THE PROFILE ID
   //put empty into tStandaloneData ["ios,push notifications"] // true | false 
   //put empty into tStandaloneData ["ios,retina icon"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,retina splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["ios,status bar hidden"] // true | false
   //put empty into tStandaloneData ["ios,status bar style"] // "Default" | "BlackOpaque" | "BlackTranslucent"
   //put empty into tStandaloneData ["ios,url name"] // URL NAME OF THE CUSTOM URL
   
   // The meta data that specifies what android standalone configuration settings are altered.
   //----------------------------------------------------------------------
   //put empty into tStandaloneData ["android"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["ACCESS_CORE_LOCATION"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["ACCESS_FINE_LOCATION"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["AD"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["BILLING"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["CAMERA"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["INTERNET"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["READ_CONTACTS"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["VIBRATE"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["WAKE_LOCK"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["WRITE_CONTACTS"] // true | false
   //put empty into tStandaloneData ["android,application permissions"]["WRITE_EXTERNAL_STORAGE"] // true | false
   //put empty into tStandaloneData ["android,customUrlScheme"] // URL NAME OF THE CUSTOM URL
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.camera"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.camera.autofocus"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.camera.flash"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.camera.front"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.faketouch"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.sensor.accelerometer"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.telephony"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.telephony.cdma"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["hardware.telephony.gsm"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["touchscreen"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["touchscreen.multitouch"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["touchscreen.multitouch.distinct"] // true | false | empty
   //put empty into tStandaloneData ["android,device capabilities"]["touchscreen.multitouch.jazzand"] // true | false | empty
   //put empty into tStandaloneData ["android,icon"] // // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["android,identifier"] // THE APPLICATION IDENTIFIER
   //put empty into tStandaloneData ["android,include dbmysql"] // true | false
   //put empty into tStandaloneData ["android,include dbsqlite"] // true | false
   //put empty into tStandaloneData ["android,include revxml"] // true | false
   //put empty into tStandaloneData ["android,include revzip"] // true | false 
   //put empty into tStandaloneData ["android,initial orientation"] // "landscape" | "portrait"
   //put empty into tStandaloneData ["android,installLocation"] // "Internal Storage Only" | "Allow External Storage" | "Prefer External Storage"
   //put empty into tStandaloneData ["android,key"] // THE ID OF THE KEY FOR SIGNING
   //put empty into tStandaloneData ["android,label"] // 
   //put empty into tStandaloneData ["android,minimum version"] // 8 | 9 | 10 | 11 | 12
   //put empty into tStandaloneData ["android,pushSenderID"] // THE ID OF THE SENDER FOR PUSH NOTIFICATION
   //put empty into tStandaloneData ["android,signing"] // "Sign with my key" | "Sign for development only" | "Do not sign"
   //put empty into tStandaloneData ["android,splash"] // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["android,status bar hidden"] // true | false
   //put empty into tStandaloneData ["android,statusBarIcon"] //  // THE NAME OF AN IMAGE FILE
   //put empty into tStandaloneData ["android,storeKey"] // THE APPLICATION BILLING KEY
   //put empty into tStandaloneData ["android,version code"] // 
   //put empty into tStandaloneData ["android,version name"] // x.x.x 
   
   // Massage the set data a bit.
   if tTestMetaData is an array then
      repeat for each line tKey in the keys of tTestMetaData then
         if tTestMetaData [tKey] is not empty then
            put char 1 to -2 of tTestMetaData[tKey] into tTestMetaData[tKey]
         end if
      end repeat
   end if
   
   set the customProperties["cRevStandaloneSettings"] of this stack to tStandaloneData
   set the cTestMetaData of this stack to tTestMetaData
   
end setMetaData
