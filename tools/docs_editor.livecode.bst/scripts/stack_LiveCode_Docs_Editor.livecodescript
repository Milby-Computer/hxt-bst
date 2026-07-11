Script "stack_LiveCode_Docs_Editor"

/*
# Name: stack "LiveCode Docs Editor"
# ID: stack "LiveCode Docs Editor"
# Hash: r1Xyuh1HYzU24W+pYZTl8g==
*/


function libDocumentationOldFormat pData, pFileToDirectory, pLinkLookup
   --libReplaceLinks rData, pFileToDirectory, pLinkLookup
   //if offset ("2520", rData) > 0 or offset ("2364", rData) > 0then
   //breakpoint
   //end if
   if offset ("<term>", pData) > 0 then
      // do the glossary specific stuff
   else
      // do the dictionary specific stuff
      put libUpdateSyntaxExamples(pData) into pData
      put libUpdateObjects(pData) into pData
      put libUpdateReferences(pData) into pData
      put libUpdateClassification(pData) into pData
      put libUpdateHistory(pData) into pData
      put libUpdatePlatforms(pData) into pData
      put libUpdateClasses(pData) into pData
      put libUpdateSecurity(pData) into pData
      put libUpdateExampleExamples(pData) into pData
      put libUpdateParameters(pData) into pData
      put libUpdateDescription(pData) into pData
      put libRemoveObsolete(pData) into pData
      put libUpdateGeneral(pData) into pData
   end if
   return pData
end libDocumentationOldFormat

function libUpdateSyntaxExamples pData
   // updates the <syntax><example></example></syntax> notation
   local tTextToReplace, tReplaceWith, tTextStart, tTextEnd
   put libGetTextLocation (pData, "<syntax>", "</syntax>", tTextStart, tTextEnd) into tTextToReplace
   if tTextToReplace is empty then
      breakpoint
   else
      put tTextToReplace into tReplaceWith
      replace "<example>" with "<p>" in tReplaceWith
      replace "</example>" with "</p>" in tReplaceWith
      replace "<p><p>" with "<p>" in tReplaceWith
      replace "</p></p>" with "</p>" in tReplaceWith
      replace tTextToReplace with tReplaceWith in pData
   end if
   return pData
end libUpdateSyntaxExamples

function libUpdateObjects pData
   // updates the <objects>...</objects> notation
   local tTextToReplace, tReplaceWith, tTextStart, tTextEnd
   put libGetTextLocation (pData, "<objects>", "</objects>", tTextStart, tTextEnd) into tTextToReplace
   if tTextToReplace is empty then
      breakpoint
   else
      put "<objects>--text--</objects>" into tReplaceWith
      if offset ("<card/>", tTextToReplace) > 0 then
         replace "--text--" with "card,--text--" in tReplaceWith
      end if
      if offset ("<stack/>", tTextToReplace) > 0 then
         replace "--text--" with "stack,--text--" in tReplaceWith
      end if
      if offset ("<group/>", tTextToReplace) > 0 then
         replace "--text--" with "group,--text--" in tReplaceWith
      end if
      if offset ("<field/>", tTextToReplace) > 0 then
         replace "--text--" with "field,--text--" in tReplaceWith
      end if
      if offset ("<button/>", tTextToReplace) > 0 then
         replace "--text--" with "button,--text--" in tReplaceWith
      end if
      if offset ("<graphic/>", tTextToReplace) > 0 then
         replace "--text--" with "graphic,--text--" in tReplaceWith
      end if
      if offset ("<scrollbar/>", tTextToReplace) > 0 then
         replace "--text--" with "scrollbar,--text--" in tReplaceWith
      end if
      if offset ("<player/>", tTextToReplace) > 0 then
         replace "--text--" with "player,--text--" in tReplaceWith
      end if
      if offset ("<image/>", tTextToReplace) > 0 then
         replace "--text--" with "image,--text--" in tReplaceWith
      end if
      if offset ("<iosBrowser/>", tTextToReplace) > 0 then
         replace "--text--" with "iosBrowser,--text--" in tReplaceWith
      end if
      if offset ("<iosScroller/>", tTextToReplace) > 0 then
         replace "--text--" with "iosScroller,--text--" in tReplaceWith
      end if
      if offset ("<iosPlayer/>", tTextToReplace) > 0 then
         replace "--text--" with "iosPlayer,--text--" in tReplaceWith
      end if
      if offset ("<iosTextInput/>", tTextToReplace) > 0 then
         replace "--text--" with "iosTextInput,--text--" in tReplaceWith
      end if
      if offset ("<AndroidScroller/>", tTextToReplace) > 0 then
         replace "--text--" with "AndroidScroller,--text--" in tReplaceWith
      end if
      if offset ("<AndroidBrowser/>", tTextToReplace) > 0 then
         replace "--text--" with "AndroidBrowser,--text--" in tReplaceWith
      end if
      if offset ("<AndroidPlayer/>", tTextToReplace) > 0 then
         replace "--text--" with "AndroidPlayer,--text--" in tReplaceWith
      end if
      if offset ("<androidTextInput/>", tTextToReplace) > 0 then
         replace "--text--" with "androidTextInput,--text--" in tReplaceWith
      end if
      if offset ("<androidMultiline/>", tTextToReplace) > 0 then
         replace "--text--" with "androidMultiline,--text--" in tReplaceWith
      end if
      replace ",--text--" with "" in tReplaceWith
      replace "--text--" with "" in tReplaceWith
      replace tTextToReplace with tReplaceWith in pData
   end if
   return pData
end libUpdateObjects

function libUpdateReferences pData
   // updates the <references></references> notation
   replace "<references>" with "<related>" in pData
   replace "</references>" with "</related>" in pData
   return pData
end libUpdateReferences

function libUpdateClassification pData
   // updates the <classification></classification> notation
   replace "<classification>" with "<categories>" in pData
   replace "</classification>" with "</categories>" in pData
   return pData
end libUpdateClassification

function libUpdateHistory pData
   // updates the <histroy></history> notation
   replace "<history>" with "" in pData
   replace "</history>" with "" in pData
   return pData
end libUpdateHistory

function libUpdatePlatforms pData
   // updates the <platforms>...</platforms> notation
   replace "<platforms>" with "" in pData
   replace "</platforms>" with "" in pData
   replace "<mac/>" with "<osx support=" & quote & "true" & quote & "/>" in pData
   replace "<windows/>" with "<win32 support=" & quote & "true" & quote & "/>" in pData
   replace "<linux/>" with "<unix support=" & quote & "true" & quote & "/>" in pData
   replace "<ios/>" with "<ios support=" & quote & "true" & quote & "/>" in pData
   replace "<android/>" with "<android support=" & quote & "true" & quote & "/>" in pData
   return pData
end libUpdatePlatforms

function libUpdateClasses pData
   // updates the <classes>...</classes> notation
   local tTextToReplace, tReplaceWith, tTextStart, tTextEnd
   put libGetTextLocation (pData, "<classes>", "</classes>", tTextStart, tTextEnd) into tTextToReplace
   if tTextToReplace is empty then
      breakpoint
   else
      put "<class>--and----text--</class>" into tReplaceWith
      if offset ("<desktop/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Desktop--text--" in tReplaceWith
      end if
      if offset ("<server/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Server--text--" in tReplaceWith
      end if
      if offset ("<web/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Web--text--" in tReplaceWith
      end if
      
      if offset ("<mobile/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Mobile--text--" in tReplaceWith
      end if
      
      replace ", , " with "" in tReplaceWith
      replace "--and----text--" with "" in tReplaceWith
      replace "--text--" with "" in tReplaceWith
      replace ", --and--" with "" in tReplaceWith
      replace "--and--" with " and " in tReplaceWith
      replace tTextToReplace with tReplaceWith in pData
   end if
   return pData
end libUpdateClasses

function libUpdateExampleExamples pData
   // updates the <examples><example></example></examples> notation
   local tTextToReplace, tReplaceWith, tTextStart, tTextEnd, tCurrentExampleToReplace, tCurrentExampleToReplaceWith, tDoubleLineSpace, tExampleFound, tFirstExample
   put true into tFirstExample
   put true into tExampleFound
   put libGetTextLocation (pData, "<examples>", "</examples>", tTextStart, tTextEnd) into tTextToReplace
   if tTextToReplace is empty then
      breakpoint
   else
      if offset ("</p><p>", tTextToReplace) > 0 then
         put true into tDoubleLineSpace
      else
         put false into tDoubleLineSpace
      end if
      put tTextToReplace into tReplaceWith
      
      repeat while true
         put libGetTextLocation (tReplaceWith, "<example>", "</example>", tTextStart, tTextEnd) into tCurrentExampleToReplace
         if tCurrentExampleToReplace is empty then
            exit repeat
         end if
         put tCurrentExampleToReplace into tCurrentExampleToReplaceWith
         
         if tDoubleLineSpace is true and tFirstExample is false then
            replace "<example>" with "<p/><p>" in tCurrentExampleToReplaceWith
         else
            replace "<example>" with "<p>" in tCurrentExampleToReplaceWith
         end if
         replace "</example>" with "</p>" in tCurrentExampleToReplaceWith
         replace tCurrentExampleToReplace with tCurrentExampleToReplaceWith in tReplaceWith
         if tFirstExample is true then
            put false into tFirstExample
         end if
      end repeat
      
      replace "<examples>" with "<example>" in tReplaceWith
      replace "</examples>" with "</example>" in tReplaceWith
      replace "<p><p>" with "<p>" in tReplaceWith
      replace "</p></p>" with "</p>" in tReplaceWith
      replace tTextToReplace with tReplaceWith in pData
   end if
   return pData
end libUpdateExampleExamples

function libUpdateParametersA pData
   // updates the
   //    <parmeters>
   //        <parameter>
   //            <name></name>
   //            <description></description>
   //            <options title="">
   //                <option>
   //                    <value></value>
   //                    <description></description>
   //                </option>
   //            </options>
   //        </parameter>
   //  </parameters>
   local tTextToReplace , tTextToReplaceWith, tCurrentParameterToReplace, tCurrentParameterToReplaceWith, tCurrentParameterNameToReplace, tCurrentParameterNameToReplaceWith
   local tCurrentParameterDescriptionToReplace, tCurrentParameterDescriptionToReplaceWith, tCurrentParameterOptionsToReplace, tCurrentParameterOptionsToReplaceWith
   local tCurrentParameterOptionsOptionToReplace, tCurrentParameterOptionsOptionToReplaceWith
   local tCurrentParameterOptionsOptionItemToReplace, tCurrentParameterOptionsOptionItemToReplaceWith
   local tCurrentParameterOptionsOptionDescriptionToReplace, tCurrentParameterOptionsOptionDescriptionToReplaceWith
   local tCurrentParameterOptionsOptionValuesToReplace, tCurrentParameterOptionsOptionValuesToReplaceWith
   local tCurrentParameterOptionsOptionValuesValueToReplace, tCurrentParameterOptionsOptionValuesValueToReplaceWith
   local tCurrentParameterOptionsOptionValuesValueNameToReplace, tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
   local tCurrentParameterOptionsOptionValuesValueDescriptionToReplace, tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
   local tTextStart, tTextEnd, tStrip, tOptionsTitle, tOptionsTitleWith
   put libGetTextLocation (pData, "<parameters>", "</parameters>", tTextStart, tTextEnd) into tTextToReplace
   if the number of lines in tTextToReplace <= 2 and the number of characters in tTextToReplace < 30 then
      replace tTextToReplace with "" in pData
   else
      put tTextToReplace into tTextToReplaceWith
      // HANDLE THE PARAMETERS
      repeat while true
         put libGetTextLocation (tTextToReplaceWith, "<parameter>", "</parameter>", tTextStart, tTextEnd) into tCurrentParameterToReplace
         if tCurrentParameterToReplace is empty then
            exit repeat
         end if
         put tCurrentParameterToReplace into tCurrentParameterToReplaceWith
         put libGetTextLocation (tCurrentParameterToReplaceWith, "<name>", "</name>", tTextStart, tTextEnd) into tCurrentParameterNameToReplace
         if tCurrentParameterNameToReplace is not empty then
            put tCurrentParameterNameToReplace into tCurrentParameterNameToReplaceWith
            replace "<name>" with "<i>" in tCurrentParameterNameToReplaceWith
            replace "</name>" with "</i><#S#><#S#>" in tCurrentParameterNameToReplaceWith
            replace tCurrentParameterNameToReplace with tCurrentParameterNameToReplaceWith in tCurrentParameterToReplaceWith
         end if
         put libGetTextLocation (tCurrentParameterToReplaceWith, "<description>", "</description>", tTextStart, tTextEnd) into tCurrentParameterDescriptionToReplace
         if tCurrentParameterDescriptionToReplace is not empty then
            put tCurrentParameterDescriptionToReplace into tCurrentParameterDescriptionToReplaceWith
            replace "<description>" with "<#E#><#E#> - " in tCurrentParameterDescriptionToReplaceWith
            replace "</description>" with "" in tCurrentParameterDescriptionToReplaceWith
            replace tCurrentParameterDescriptionToReplace with tCurrentParameterDescriptionToReplaceWith in tCurrentParameterToReplaceWith
         end if
         // HANDLE OPTIONS
         repeat while true
            put libGetTextLocation (tCurrentParameterToReplaceWith, "<options", "</options>", tTextStart, tTextEnd) into tCurrentParameterOptionsToReplace
            if tCurrentParameterOptionsToReplace is empty then
               exit repeat
            end if
            put tCurrentParameterOptionsToReplace into tCurrentParameterOptionsToReplaceWith
            // HANDLE THE OPTIONS TITLE
            put libGetTextLocation (tCurrentParameterOptionsToReplaceWith, "title=" & quote, quote & ">", tTextStart, tTextEnd) into tOptionsTitle
            put tOptionsTitle into tOptionsTitleWith
            replace "title=" & quote with "<p><u>" in tOptionsTitleWith
            replace quote & ">" with "</u></p>" in tOptionsTitleWith
            replace tOptionsTitle with tOptionsTitleWith in tCurrentParameterOptionsToReplaceWith
            repeat while true
               put libGetTextLocation (tCurrentParameterOptionsToReplaceWith, "<option>", "</option>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionToReplace
               if tCurrentParameterOptionsOptionToReplace is empty then
                  exit repeat
               end if
               put tCurrentParameterOptionsOptionToReplace into tCurrentParameterOptionsOptionToReplaceWith
               put libGetTextLocation (tCurrentParameterOptionsOptionToReplaceWith, "<item>", "</item>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionItemToReplace
               if tCurrentParameterOptionsOptionItemToReplace is not empty then
                  put tCurrentParameterOptionsOptionItemToReplace into tCurrentParameterOptionsOptionItemToReplaceWith
                  replace "<item>" with "<p>        * " in tCurrentParameterOptionsOptionItemToReplaceWith
                  replace "</item>" with "<#S#><#S#>" in tCurrentParameterOptionsOptionItemToReplaceWith
                  replace tCurrentParameterOptionsOptionItemToReplace with tCurrentParameterOptionsOptionItemToReplaceWith in tCurrentParameterOptionsOptionToReplaceWith
               end if
               put libGetTextLocation (tCurrentParameterOptionsOptionToReplaceWith, "<description>", "</description>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionDescriptionToReplace
               if tCurrentParameterOptionsOptionDescriptionToReplace is not empty then
                  put tCurrentParameterOptionsOptionDescriptionToReplace into tCurrentParameterOptionsOptionDescriptionToReplaceWith
                  replace "<description>" with "<#E#><#E#> - " in tCurrentParameterOptionsOptionDescriptionToReplaceWith
                  replace "</description>" with "</p>" in tCurrentParameterOptionsOptionDescriptionToReplaceWith
                  replace tCurrentParameterOptionsOptionDescriptionToReplace with tCurrentParameterOptionsOptionDescriptionToReplaceWith in tCurrentParameterOptionsOptionToReplaceWith
               end if
               // HANDLE VALUES
               put libGetTextLocation (tCurrentParameterOptionsOptionToReplaceWith, "<values>", "</values>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesToReplace
               if tCurrentParameterOptionsOptionValuesToReplace is not empty then
                  put tCurrentParameterOptionsOptionValuesToReplace into tCurrentParameterOptionsOptionValuesToReplaceWith
                  repeat while true
                     put libGetTextLocation (tCurrentParameterOptionsOptionValuesToReplaceWith, "<value>", "</value>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesValueToReplace
                     if tCurrentParameterOptionsOptionValuesValueToReplace is empty then
                        exit repeat
                     end if
                     put tCurrentParameterOptionsOptionValuesValueToReplace into tCurrentParameterOptionsOptionValuesValueToReplaceWith
                     put libGetTextLocation (tCurrentParameterOptionsOptionValuesValueToReplaceWith, "<name>", "</name>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesValueNameToReplace
                     if offset ("<description/>", tCurrentParameterOptionsOptionValuesValueToReplaceWith) > 0
                     then
                        replace "<description/>" with "" in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        if tCurrentParameterOptionsOptionValuesValueNameToReplace is not empty then
                           put tCurrentParameterOptionsOptionValuesValueNameToReplace into tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "<name>" with "<p>            * " in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "</name>" with "</p>" in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace tCurrentParameterOptionsOptionValuesValueNameToReplace with tCurrentParameterOptionsOptionValuesValueNameToReplaceWith in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        end if
                     else
                        if tCurrentParameterOptionsOptionValuesValueNameToReplace is not empty then
                           put tCurrentParameterOptionsOptionValuesValueNameToReplace into tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "<name>" with "<p>            * " in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "</name>" with "<#S#><#S#>" in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace tCurrentParameterOptionsOptionValuesValueNameToReplace with tCurrentParameterOptionsOptionValuesValueNameToReplaceWith in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        end if
                        put libGetTextLocation (tCurrentParameterOptionsOptionValuesValueToReplaceWith, "<description>", "</description>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesValueDescriptionToReplace
                        if tCurrentParameterOptionsOptionValuesValueDescriptionToReplace is not empty then
                           put tCurrentParameterOptionsOptionValuesValueDescriptionToReplace into tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
                           replace "<description>" with "<#E#><#E#> - " in tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
                           replace "</description>" with "</p>" in tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
                           replace tCurrentParameterOptionsOptionValuesValueDescriptionToReplace with tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        end if
                     end if
                     replace "<value>" with "<p>" in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                     replace "</value>" with "</p>" in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                     replace tCurrentParameterOptionsOptionValuesValueToReplace with tCurrentParameterOptionsOptionValuesValueToReplaceWith in tCurrentParameterOptionsOptionValuesToReplaceWith
                  end repeat
                  replace "<values>" with "<p>" in tCurrentParameterOptionsOptionValuesToReplaceWith
                  replace "</values>" with "</p>" in tCurrentParameterOptionsOptionValuesToReplaceWith
                  replace tCurrentParameterOptionsOptionValuesToReplace with tCurrentParameterOptionsOptionValuesToReplaceWith in tCurrentParameterOptionsToReplaceWith
               end if               
               replace "<option>" with "<p>" in tCurrentParameterOptionsOptionToReplaceWith
               replace "</option>" with "</p>" in tCurrentParameterOptionsOptionToReplaceWith
               replace tCurrentParameterOptionsOptionToReplace with tCurrentParameterOptionsOptionToReplaceWith in tCurrentParameterOptionsToReplaceWith
            end repeat
            replace "<options" with "<p>" in tCurrentParameterOptionsToReplaceWith
            replace "</options>" with "</p>" in tCurrentParameterOptionsToReplaceWith
            replace tCurrentParameterOptionsToReplace with tCurrentParameterOptionsToReplaceWith in tCurrentParameterToReplaceWith
         end repeat
         replace "<parameter>" with "<p>" in tCurrentParameterToReplaceWith
         replace "</parameter>" with "</p>" in tCurrentParameterToReplaceWith
         replace tCurrentParameterToReplace with tCurrentParameterToReplaceWith in tTextToReplaceWith
      end repeat
      
      replace "<parameters>" with "<p>" in tTextToReplaceWith
      replace "</parameters>" with "</p>" in tTextToReplaceWith
      // STRIP OUT ALL MARKED BREAKS
      repeat while true
         put libGetTextLocation (tTextToReplaceWith, "<#S#><#S#>", "<#E#><#E#>", tTextStart, tTextEnd) into tStrip
         if tStrip is empty then
            exit repeat
         end if
         replace tStrip with "" in tTextToReplaceWith
      end repeat
      // STRIP OUT THE <description/> tags
      replace tTextToReplace with tTextToReplaceWith in pData
   end if
   return pData
end libUpdateParametersA

function libUpdateParameters pData
   // updates the
   //    <parmeters>
   //        <parameter>
   //            <name></name>
   //            <description></description>
   //            <options title="">
   //                <option>
   //                    <value></value>
   //                    <description></description>
   //                </option>
   //            </options>
   //        </parameter>
   //  </parameters>
   local tTextToReplace , tTextToReplaceWith, tCurrentParameterToReplace, tCurrentParameterToReplaceWith, tCurrentParameterNameToReplace, tCurrentParameterNameToReplaceWith
   local tCurrentParameterDescriptionToReplace, tCurrentParameterDescriptionToReplaceWith, tCurrentParameterOptionsToReplace, tCurrentParameterOptionsToReplaceWith
   local tCurrentParameterOptionsOptionToReplace, tCurrentParameterOptionsOptionToReplaceWith
   local tCurrentParameterOptionsOptionItemToReplace, tCurrentParameterOptionsOptionItemToReplaceWith
   local tCurrentParameterOptionsOptionDescriptionToReplace, tCurrentParameterOptionsOptionDescriptionToReplaceWith
   local tCurrentParameterOptionsOptionValuesToReplace, tCurrentParameterOptionsOptionValuesToReplaceWith
   local tCurrentParameterOptionsOptionValuesValueToReplace, tCurrentParameterOptionsOptionValuesValueToReplaceWith
   local tCurrentParameterOptionsOptionValuesValueNameToReplace, tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
   local tCurrentParameterOptionsOptionValuesValueDescriptionToReplace, tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
   local tTextStart, tTextEnd, tStrip, tOptionsTitle, tOptionsTitleWith
   put libGetTextLocation (pData, "<parameters>", "</parameters>", tTextStart, tTextEnd) into tTextToReplace
   if the number of lines in tTextToReplace <= 2 and the number of characters in tTextToReplace < 30 then
      if tTextToReplace is not empty then
         replace tTextToReplace with "" in pData
      end if
   else
      put tTextToReplace into tTextToReplaceWith
      // HANDLE THE PARAMETERS
      repeat while true
         put libGetTextLocation (tTextToReplaceWith, "<parameter>", "</parameter>", tTextStart, tTextEnd) into tCurrentParameterToReplace
         if tCurrentParameterToReplace is empty then
            exit repeat
         end if
         put tCurrentParameterToReplace into tCurrentParameterToReplaceWith
         put libGetTextLocation (tCurrentParameterToReplaceWith, "<name>", "</name>", tTextStart, tTextEnd) into tCurrentParameterNameToReplace
         if tCurrentParameterNameToReplace is not empty then
            put tCurrentParameterNameToReplace into tCurrentParameterNameToReplaceWith
            replace "<name>" with "<i>" in tCurrentParameterNameToReplaceWith
            replace "</name>" with "</i><#S#><#S#>" in tCurrentParameterNameToReplaceWith
            replace tCurrentParameterNameToReplace with tCurrentParameterNameToReplaceWith in tCurrentParameterToReplaceWith
         end if
         put libGetTextLocation (tCurrentParameterToReplaceWith, "<description>", "</description>", tTextStart, tTextEnd) into tCurrentParameterDescriptionToReplace
         if tCurrentParameterDescriptionToReplace is not empty then
            put tCurrentParameterDescriptionToReplace into tCurrentParameterDescriptionToReplaceWith
            replace "<description>" with "<#E#><#E#> - " in tCurrentParameterDescriptionToReplaceWith
            replace "</description>" with "" in tCurrentParameterDescriptionToReplaceWith
            replace tCurrentParameterDescriptionToReplace with tCurrentParameterDescriptionToReplaceWith in tCurrentParameterToReplaceWith
         end if
         
         // HANDLE OPTIONS
         repeat while true
            put libGetTextLocation (tCurrentParameterToReplaceWith, "<options", "</options>", tTextStart, tTextEnd) into tCurrentParameterOptionsToReplace
            if tCurrentParameterOptionsToReplace is empty then
               exit repeat
            end if
            put tCurrentParameterOptionsToReplace into tCurrentParameterOptionsToReplaceWith
            // HANDLE THE OPTIONS TITLE
            put libGetTextLocation (tCurrentParameterOptionsToReplaceWith, "title=" & quote, quote & ">", tTextStart, tTextEnd) into tOptionsTitle
            put tOptionsTitle into tOptionsTitleWith
            
            if tOptionsTitleWith is not ("title="&quote&quote&">") and tOptionsTitleWith is not empty then
               replace "title=" & quote with ("<p><u>") in tOptionsTitleWith
               replace quote & ">" with "</u></p><ul>" in tOptionsTitleWith
               replace tOptionsTitle with tOptionsTitleWith in tCurrentParameterOptionsToReplaceWith
            else
               replace tOptionsTitle with "<ul>"  in tCurrentParameterOptionsToReplaceWith
            end if
            repeat while true
               put libGetTextLocation (tCurrentParameterOptionsToReplaceWith, "<option>", "</option>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionToReplace
               if tCurrentParameterOptionsOptionToReplace is empty then
                  exit repeat
               end if
               put tCurrentParameterOptionsOptionToReplace into tCurrentParameterOptionsOptionToReplaceWith
               put libGetTextLocation (tCurrentParameterOptionsOptionToReplaceWith, "<item>", "</item>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionItemToReplace
               if tCurrentParameterOptionsOptionItemToReplace is not empty then
                  put tCurrentParameterOptionsOptionItemToReplace into tCurrentParameterOptionsOptionItemToReplaceWith
                  replace "<item>" with "<li><b>" in tCurrentParameterOptionsOptionItemToReplaceWith
                  replace "</item>" with "</b><#S#><#S#></li>" in tCurrentParameterOptionsOptionItemToReplaceWith
                  replace tCurrentParameterOptionsOptionItemToReplace with tCurrentParameterOptionsOptionItemToReplaceWith in tCurrentParameterOptionsOptionToReplaceWith
               end if
               put libGetTextLocation (tCurrentParameterOptionsOptionToReplaceWith, "<description>", "</description>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionDescriptionToReplace
               if tCurrentParameterOptionsOptionDescriptionToReplace is not empty then
                  put tCurrentParameterOptionsOptionDescriptionToReplace into tCurrentParameterOptionsOptionDescriptionToReplaceWith
                  replace "<description>" with "<#E#><#E#> - " in tCurrentParameterOptionsOptionDescriptionToReplaceWith
                  replace "</description>" with "" in tCurrentParameterOptionsOptionDescriptionToReplaceWith
                  replace tCurrentParameterOptionsOptionDescriptionToReplace with tCurrentParameterOptionsOptionDescriptionToReplaceWith in tCurrentParameterOptionsOptionToReplaceWith
               else
                  if offset ("<description/>", tCurrentParameterOptionsOptionToReplaceWith) > 0 then
                     replace "<description/>" with "<#E#><#E#>" in tCurrentParameterOptionsOptionToReplaceWith
                  end if
               end if
               
               // HANDLE VALUES
               put libGetTextLocation (tCurrentParameterOptionsOptionToReplaceWith, "<values>", "</values>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesToReplace
               if tCurrentParameterOptionsOptionValuesToReplace is not empty then
                  put tCurrentParameterOptionsOptionValuesToReplace into tCurrentParameterOptionsOptionValuesToReplaceWith
                  repeat while true
                     put libGetTextLocation (tCurrentParameterOptionsOptionValuesToReplaceWith, "<value>", "</value>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesValueToReplace
                     if tCurrentParameterOptionsOptionValuesValueToReplace is empty then
                        exit repeat
                     end if
                     put tCurrentParameterOptionsOptionValuesValueToReplace into tCurrentParameterOptionsOptionValuesValueToReplaceWith
                     put libGetTextLocation (tCurrentParameterOptionsOptionValuesValueToReplaceWith, "<name>", "</name>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesValueNameToReplace
                     if offset ("<description/>", tCurrentParameterOptionsOptionValuesValueToReplaceWith) > 0
                     then
                        replace "<description/>" with "" in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        if tCurrentParameterOptionsOptionValuesValueNameToReplace is not empty then
                           put tCurrentParameterOptionsOptionValuesValueNameToReplace into tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "<name>" with "" in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "</name>" with "" in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace tCurrentParameterOptionsOptionValuesValueNameToReplace with tCurrentParameterOptionsOptionValuesValueNameToReplaceWith in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        end if
                     else
                        if tCurrentParameterOptionsOptionValuesValueNameToReplace is not empty then
                           put tCurrentParameterOptionsOptionValuesValueNameToReplace into tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "<name>" with "" in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace "</name>" with "<#S#><#S#>" in tCurrentParameterOptionsOptionValuesValueNameToReplaceWith
                           replace tCurrentParameterOptionsOptionValuesValueNameToReplace with tCurrentParameterOptionsOptionValuesValueNameToReplaceWith in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        end if
                        put libGetTextLocation (tCurrentParameterOptionsOptionValuesValueToReplaceWith, "<description>", "</description>", tTextStart, tTextEnd) into tCurrentParameterOptionsOptionValuesValueDescriptionToReplace
                        if tCurrentParameterOptionsOptionValuesValueDescriptionToReplace is not empty then
                           put tCurrentParameterOptionsOptionValuesValueDescriptionToReplace into tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
                           replace "<description>" with "<#E#><#E#> - " in tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
                           replace "</description>" with "" in tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith
                           replace tCurrentParameterOptionsOptionValuesValueDescriptionToReplace with tCurrentParameterOptionsOptionValuesValueDescriptionToReplaceWith in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                        end if
                     end if
                     replace "<value>" with "<li>" in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                     replace "</value>" with "</li>" in tCurrentParameterOptionsOptionValuesValueToReplaceWith
                     replace tCurrentParameterOptionsOptionValuesValueToReplace with tCurrentParameterOptionsOptionValuesValueToReplaceWith in tCurrentParameterOptionsOptionValuesToReplaceWith
                  end repeat
                  replace "<values>" with "<ul type="&quote&"circle"&quote&">" in tCurrentParameterOptionsOptionValuesToReplaceWith
                  replace "</values>" with "</ul>" in tCurrentParameterOptionsOptionValuesToReplaceWith
                  replace tCurrentParameterOptionsOptionValuesToReplace with tCurrentParameterOptionsOptionValuesToReplaceWith in tCurrentParameterOptionsToReplaceWith
               end if               
               replace "<option>" with "" in tCurrentParameterOptionsOptionToReplaceWith
               replace "</option>" with "</ul>" in tCurrentParameterOptionsOptionToReplaceWith
               replace tCurrentParameterOptionsOptionToReplace with tCurrentParameterOptionsOptionToReplaceWith in tCurrentParameterOptionsToReplaceWith
            end repeat
            replace "<options" with "" in tCurrentParameterOptionsToReplaceWith
            replace "</options>" with "</ul>" in tCurrentParameterOptionsToReplaceWith
            replace tCurrentParameterOptionsToReplace with tCurrentParameterOptionsToReplaceWith in tCurrentParameterToReplaceWith
         end repeat
         replace "<parameter>" with "<p>" in tCurrentParameterToReplaceWith
         replace "</parameter>" with "</p>" in tCurrentParameterToReplaceWith
         replace tCurrentParameterToReplace with tCurrentParameterToReplaceWith in tTextToReplaceWith
      end repeat
      
      replace "<parameters>" with "<p><b>Parameters:</b></p>" in tTextToReplaceWith
      replace "</parameters>" with "" in tTextToReplaceWith
      // STRIP OUT ALL MARKED BREAKS
      repeat while true
         put libGetTextLocation (tTextToReplaceWith, "<#S#><#S#>", "<#E#><#E#>", tTextStart, tTextEnd) into tStrip
         if tStrip is empty then
            exit repeat
         end if
         replace tStrip with "" in tTextToReplaceWith
      end repeat
      // STRIP OUT THE <description/> tags
      replace tTextToReplace with tTextToReplaceWith in pData
   end if
   replace "    " with "" in pData
   return pData
end libUpdateParameters

function libUpdateDescription pData
   local tTemp
   // strip the overview, parameters, value and comments tags out of the description tags 
   local tTextToReplace, tTextToReplaceSub, tReplaceWith, tTextStart, tTextEnd, tTextStartSub, tTextEndSub, tPTagRequired
   put false into tPTagRequired
   put libGetTextLocation (pData, "<description>", "</description>", tTextStart, tTextEnd) into tTextToReplace
   if tTextToReplace is empty then
      breakpoint
   else
      put tTextToReplace into tReplaceWith
      // process the overview tags
      put libGetTextLocation (tReplaceWith, "<overview>", "</overview>", tTextStartSub, tTextEndSub) into tTextToReplaceSub
      if tTextToReplaceSub is not empty then
         put the number of characters in tTextToReplaceSub into tTemp
         if the number of lines in tTextToReplaceSub <= 2 and the number of characters in tTextToReplaceSub < 26 then
            replace tTextToReplaceSub with "" in tReplaceWith
         else
            replace "<overview>" with "<p>" in tReplaceWith
            replace "</overview>" with "</p>" in tReplaceWith
            put true into tPTagRequired
         end if
      end if
      // process the parameter tags
      /*
      put libGetTextLocation (tReplaceWith, "<parameters>", "</parameters>", tTextStartSub, tTextEndSub) into tTextToReplaceSub
      if tTextToReplaceSub is not empty then
         put the number of characters in tTextToReplaceSub into tTemp
         if the number of lines in tTextToReplaceSub <= 2 and the number of characters in tTextToReplaceSub < 30 then
            replace tTextToReplaceSub with "" in tReplaceWith
         else
            if tPTagRequired is true then
               replace "<parameters>" with "<p/><p><b>Parameters:</b></p><p>" in tReplaceWith
            else
               replace "<parameters>" with "<p><b>Parameters:</b></p><p>" in tReplaceWith
               put true into tPTagRequired
            end if
            replace "</parameters>" with "</p>" in tReplaceWith
            replace "<parameter>" with "<p>" in tReplaceWith
            replace "</parameter>" with "</p>" in tReplaceWith
         end if
      end if
      */
      // process the value tags
      put libGetTextLocation (tReplaceWith, "<value>", "</value>", tTextStartSub, tTextEndSub) into tTextToReplaceSub
      if tTextToReplaceSub is not empty then
         put the number of characters in tTextToReplaceSub into tTemp
         if the number of lines in tTextToReplaceSub <= 2 and the number of characters in tTextToReplaceSub < 20 then
            replace tTextToReplaceSub with "" in tReplaceWith
         else
            if tPTagRequired is true then
               replace "<value>" with "<p/><p><b>Value:</b></p><p>" in tReplaceWith
            else
               replace "<value>" with "<p><b>Value:</b></p><p>" in tReplaceWith
               put true into tPTagRequired
            end if
            replace "</value>" with "</p>" in tReplaceWith
         end if
      end if
      // process the comments tags
      put libGetTextLocation (tReplaceWith, "<comments>", "</comments>", tTextStartSub, tTextEndSub) into tTextToReplaceSub
      if tTextToReplaceSub is not empty then
         put the number of characters in tTextToReplaceSub into tTemp
         if the number of lines in tTextToReplaceSub <= 2 and the number of characters in tTextToReplaceSub < 26 then
            replace tTextToReplaceSub with "" in tReplaceWith
         else
            if tPTagRequired is true then
               replace "<comments>" with "<p/><p><b>Comments:</b></p><p>" in tReplaceWith
            else
               replace "<comments>" with "<p><b>Comments:</b></p><p>" in tReplaceWith
               put true into tPTagRequired
            end if
            replace "</comments>" with "</p>" in tReplaceWith
         end if
      end if
      replace tTextToReplace with tReplaceWith in pData
   end if
   return pData
end libUpdateDescription

function libRemoveObsolete pData
   // removes XML tags that contain no data
   // this is needed to suppress referring headings
   local tTextToReplace, tReplaceWith, tTextStart, tTextEnd
   replace "<library></library>" with "" in pData
   put libGetTextLocation (pData, "<objects>", "</objects>", tTextStart, tTextEnd) into tTextToReplace
   if the number of lines in tTextToReplace is 2 then
      replace tTextToReplace with "" in pData
   end if
   put libGetTextLocation (pData, "<synonyms>", "</synonyms>", tTextStart, tTextEnd) into tTextToReplace
   if the number of lines in tTextToReplace is 2 then
      replace tTextToReplace with "" in pData
   end if
   put libGetTextLocation (pData, "<security>", "</security>", tTextStart, tTextEnd) into tTextToReplace
   if the number of lines in tTextToReplace is 2 then
      replace tTextToReplace with "" in pData
   end if
   put libGetTextLocation (pData, "<syntax>", "</syntax>", tTextStart, tTextEnd) into tTextToReplace
   if the number of lines in tTextToReplace is 2 then
      replace tTextToReplace with "" in pData
   end if   
   return pData
end libRemoveObsolete

--function libUpdateGeneral pData
--   // updates the <warning></warning> notation
--   // updates the <note></note> notation
--   // updates the <cp_note></cp_note> notation
--   // updates the <change></change> notation
--   // updates the <tip></tip> notation
--   // updates the <important></important> notation
--   replace "<warning>" with "" in pData
--   replace "</warning>" with "" in pData
--   replace "<note>" with "" in pData
--   replace "</note>" with "" in pData
--   replace "<cp_note>" with "" in pData
--   replace "</cp_note>" with "" in pData
--   replace "<change>" with "" in pData
--   replace "</change>" with "" in pData
--   replace "<tip>" with "" in pData
--   replace "</tip>" with "" in pData
--   replace "<important>" with "" in pData
--   replace "</important>" with "" in pData
--   return pData
--end libUpdateGeneral

function libUpdateGeneral pData
   local tTextStart, tTextEnd, tTextToUpdate
   // updates the <warning></warning> notation
   put libGetTextLocation (pData, "<warning>", "</warning>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<warning>" with "<b>Warning: </b>" in pData
      replace "</warning>" with "" in pData
   end if
   // updates the <note></note> notation
   put libGetTextLocation (pData, "<note>", "</note>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<note>" with "<b>Note: </b>" in pData
      replace "</note>" with "" in pData
   end if
   // updates the <cp_note></cp_note> notation
   put libGetTextLocation (pData, "<cp_note>", "</cp_note>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<cp_note>" with "<b>Cross-platform note: </b>" in pData
      replace "</cp_note>" with "" in pData
   end if   
   // updates the <caution></caution> notation
   put libGetTextLocation (pData, "<caution>", "</caution>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<caution>" with "<b><img src=" & quote & "202650" & quote & "/> Caution! </b>" in pData
      replace "</caution>" with "" in pData
   end if
   // updates the <cp_caution></cp_caution> notation
   put libGetTextLocation (pData, "<cp_caution>", "</cp_caution>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<cp_caution>" with "<b><img src=" & quote & "202654" & quote & "/> Cross-platform caution! </b>" in pData
      replace "</cp_caution>" with "" in pData
   end if   
   // updates the <change></change> notation
   put libGetTextLocation (pData, "<change>", "</change>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<change>" with "<b>Changes: </b>" in pData
      replace "</change>" with "" in pData
   end if
   // updates the <tip></tip> notation
   put libGetTextLocation (pData, "<tip>", "</tip>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<tip>" with "<b>Tip: </b>" in pData
      replace "</tip>" with "" in pData
   end if
   // updates the <important></important> notation
   put libGetTextLocation (pData, "<important>", "</important>", tTextStart, tTextEnd) into tTextToUpdate
   if tTextToUpdate is not empty then
      replace "<important>" with "<b>Important! </b>" in pData
      replace "</important>" with "" in pData
   end if
   
   // strip out caution images
   replace "<img src=" & quote & "202650" & quote & "/> " with "" in pData 
   replace "<img src=" & quote & "202650" & quote & "/>" with "" in pData 
   // strip out tip images
   replace "<img src=" & quote & "202651" & quote & "/> " with "" in pData 
   replace "<img src=" & quote & "202651" & quote & "/>" with "" in pData 
   // strip out cross-platform note images
   replace "<img src=" & quote & "202652" & quote & "/> " with "" in pData 
   replace "<img src=" & quote & "202652" & quote & "/>" with "" in pData 
   // strip out important and gotcha images
   replace "<img src=" & quote & "202653" & quote & "/> " with "" in pData 
   replace "<img src=" & quote & "202653" & quote & "/>" with "" in pData 
   // strip out cross-platform note images
   replace "<img src=" & quote & "202654" & quote & "/> " with "" in pData 
   replace "<img src=" & quote & "202654" & quote & "/>" with "" in pData 
   return pData
end libUpdateGeneral

private function libGetTextLocation, pData, pStartToken, pEndToken, @rStart, @rEnd
   local tTextFound
   put empty into tTextFound
   put offset (pStartToken, pData) into rStart
   put offset (pEndToken, pData) into rEnd
   if rStart > rEnd then
      exit libGetTextLocation
      breakpoint
   end if
   if rStart is not 0 and rEnd is not 0 then
      put rEnd + the length of pEndToken - 1 into rEnd
      put char rStart to rEnd of pData into tTextFound
   end if
   return tTextFound
end libGetTextLocation

function libUpdateSecurity pData
   // updates the <security>...</security> notation
   local tTextToReplace, tReplaceWith, tTextStart, tTextEnd, tTempReplaceWith
   put libGetTextLocation (pData, "<security>", "</security>", tTextStart, tTextEnd) into tTextToReplace
   if tTextToReplace is empty then
      breakpoint
   else
      put "<security>--and----text--</security>" into tReplaceWith
      if offset ("<disk access=" & quote & "???" & quote & "/>", tTextToReplace)  > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Disk--text--" in tReplaceWith
      end if
      if offset ("<disk/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Disk--text--" in tReplaceWith
      end if
      if offset ("<network/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Network--text--" in tReplaceWith
      end if
      if offset ("<process/>", tTextToReplace) > 0 then 
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Process--text--" in tReplaceWith
      end if
      if offset ("<registry access=" & quote & "read-only" & quote & "/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--RegistryRead--text--" in tReplaceWith
      end if
      if offset ("<registry access=" & quote & "read-write" & quote & "/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--RegistryWrite--text--" in tReplaceWith
      end if
      if offset ("<stack/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Stack--text--" in tReplaceWith
      end if
      if offset ("<printing/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Printing--text--" in tReplaceWith
      end if
      if offset ("<privacy/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--Privacy--text--" in tReplaceWith
      end if
      if offset ("<applescript/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--AppleScript--text--" in tReplaceWith
      end if
      if offset ("<doalternate/>", tTextToReplace) > 0 then
         replace "--and--" with", " in tReplaceWith
         replace "--text--" with "--and--DoAlternate--text--" in tReplaceWith
      end if
      replace ", , " with "" in tReplaceWith
      replace "--and----text--" with "" in tReplaceWith
      replace "--text--" with "" in tReplaceWith
      replace ", --and--" with "" in tReplaceWith
      replace "--and--" with " and " in tReplaceWith
      replace tTextToReplace with tReplaceWith in pData
   end if
   return pData
end libUpdateSecurity
