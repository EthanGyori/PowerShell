<#good one-liners#>
#replace each occurance of string in file for each file in directory
ls | %{(cat $_.name) -replace 'old string','new string'| sc $_.name}

#replace each occurance of a string in a file name for each file in directory
gci | ren -n {$_.name -replace 'old','new'}

#import every task in cd into task scheduler where extension is .xml
ls |?{$_.Extension -eq '.xml'} | %{schtasks /create /tn $_.BaseName /xml $_.FullName}
