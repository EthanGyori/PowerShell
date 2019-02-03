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

#replace each occurance of string in file for each file in directory
ls | %{(cat $_.name) -replace 'old string','new string'| sc $_.name}

#replace each occurance of a string in a file name for each file in directory
gci | ren -n {$_.name -replace 'old','new'}

#import every task in cd into task scheduler where extension is .xml
ls | ?{$_.Extension -eq '.xml'} | %{schtasks /create /tn $_.BaseName /xml $_.FullName}

#shutdown logs w/ device,user, and timestamp
Get-EventLog -lo system -n 1000 | ?{$_.eventid –eq ‘1074’} | Format-Table machinename, username, timegenerated –a

#creates spinning graphic for loading or in process tasks
 $a = [enum]::getvalues([system.consolecolor]);while($?){'|','/','-','\' | %{Write-Host "$_`b" -n -f ($a[(Get-Random -ma $a.length)]);sleep -m 50}}
 
