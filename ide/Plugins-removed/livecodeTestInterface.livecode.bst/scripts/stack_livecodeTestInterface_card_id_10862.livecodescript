Script "stack_livecodeTestInterface_card_id_10862"

/*
# Name: card "settings" of stack "livecodeTestInterface"
# ID: card id 10862 of stack "livecodeTestInterface"
# Hash: 8TlH9MsWfZ7Mk8xe0eTVPw==
*/


on preOpenCard
   put the cTestFolder of stack "revPreferences" into field "test stacks"
   put the cLiveCodeInstallFolder of stack "revPreferences" into field "lc install"
   put the cTestCache of stack "revPreferences" into field "test output"
   put the cGitHubPath of stack "revPreferences" into field "github"
   put the cTestIncludeFolder of stack "revPreferences" into field "include"
   put the cLiveCodeTestDbFolder of stack "revPreferences" into field "eval database"
   set the label of button "testMode" to the cTestMode of stack "revPreferences"
   if the platform is "MacOS" then
      enable field "fruitstrap location"
      enable button "ChooseFruitstrap"
      enable field "automation template location"
      enable button "ChooseAutomation"
      put the cFruitStrap of stack "revPreferences" into field "fruitstrap location"
      put the cAutomationTemplate of stack "revPreferences" into field "automation template location"  
   else
      disable field "fruitstrap location"
      disable button "ChooseFruitstrap"
      disable field "automation template location"
      disable button "ChooseAutomation"
      put empty into field "fruitstrap location"
      put empty into field "automation template location"      
   end if   
end preOpenCard

on closeCard
   set the cTestFolder of stack "revPreferences" to field "test stacks"
   set the cLiveCodeInstallFolder of stack "revPreferences" to field "lc install"
   set the cTestCache of stack "revPreferences" to field "test output"
   set the cFruitStrap of stack "revPreferences" to field "fruitstrap location"
   set the cAutomationTemplate of stack "revPreferences" to field "automation template location"
   set the cGitHubPath of stack "revPreferences" to field "github"
   set the cTestMode of stack "revPreferences" to the label of button "testMode"
   set the cTestIncludeFolder of stack "revPreferences" to field "include"
   set the cLiveCodeTestDbFolder of stack "revPreferences" to field "eval database"
   save stack "revPreferences"
end closeCard
