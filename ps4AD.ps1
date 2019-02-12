#Disable psversion2 
Disable-WindowsOptionalFeature -online -FeatureName MicrosoftWindowsPowerShellv2
	#this only works if psversion 3 or later is installed

#check startup, delete all
<# rm "$env:USERPROFILE\start menu\programs\startup\*" -Force -Recurse #>
	 #proof of concept, better to run shell:startup

#taskkill by app name
ps | Where-Object{$_.Name -like "slack"} | ForEach-Object{taskkill /f /im $_.ID}
	#this works if multiple app id’s or association is broken
  
#delete alias list
Remove-Item alias:\* -Force
  #replaced by remove-alias cmdlet in later version of powershell
    #current session

#recent files path
%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\	
	#windows explorer path for all recent files, current user
  
#curl equivalent for psversion2 
(New-Object System.Net.WebClient).DownloadFile("http://exampleuri.com","filename.ext")
	#psversion2 does not come with curl
  
#foreach aduser, member of
Get-ADuser -f * | %{"Name: " + $_.name + " `tEnabled: " + $_.Enabled; "`n"; Get-ADPrincipalGroupMembership $_.Name | select -ExpandProperty Name; "`n" }
