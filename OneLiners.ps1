<#         
         /////////////////
  |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|//////
  |Good One-Liners|/////
  |  Written by:  |////
  |  Ethan Gyori  |///
  | ~ ~ ~ ~ ~ ~ ~ |//
  |   e n j o y   |/
  |_______________|
         |:|//
         |:|/
         |:|
          ‾
#>

#replace each occurrence of string in file for each file in directory
ls | %{(cat $_.name) -replace 'old string','new string'| sc $_.name}

#replace each occurrence of a string in a file name for each file in directory
gci | ren -n {$_.name -replace 'old','new'}

#import every task in cd into task scheduler where extension is .xml
ls | ?{$_.Extension -eq '.xml'} | %{schtasks /create /tn $_.BaseName /xml $_.FullName}

#shutdown logs w/ device,user, and timestamp
 get-eventlog -list| %{get-eventlog -LogName $_.Log -n 100 -ErrorAction SilentlyContinue} | ?{$_.EventID -in
 $id} | Format-Table machinename, username, timegenerated,eventid –a
         # $id = 1074   shutdown
         # 7001   login
         # 7002   logout
         # 4728, 4732, 4756         privlage escalation

#creates spinning graphic for loading or in process tasks
 $a = [enum]::getvalues([system.consolecolor]);while($?){'|','/','-','\' | %{Write-Host "$_`b" -n -f ($a[(Get-Random -ma $a.length)]);sleep -m 50}}
 
