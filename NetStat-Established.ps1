<#------------------------------
Name: NetStat-Established.ps1
Author: Ethan Gyori
Use:
  shows newly ESTABLISHED
   connectoins within netstat 
   '-ano' arguments
Last Modified: 01/26/2019
------------------------------#>

function gns{
return ((netstat -ano) | find "ESTABLISHED ")
}

$a = gns
"Proto`tLocal`t`t`t`t`tForeign`t`t`t`t`tState`t`t`tPID"
netstat -ano | find "ESTABLISHED "
while($?){
    $c = @()
    $b = gns
    $b | %{if(!($a.Contains($_))){$c+="`n$_"; $a = $b}}
    "New connections:$c"
    sleep 5
    rv c
}
