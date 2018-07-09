<#------------------------------
Name: NetStat-Established.ps1
Author: Ethan Gyori
Use:
  shows newly ESTABLISHED
   connectoins within netstat 
   '-ano' arguments
Last Modified: 07/09/2018
------------------------------#>

function gns{
return ((netstat -ano) | find "ESTABLISHED ")
}

$a = gns
while($?){
    $c = @()
    $b = gns
    $b | %{if(!($a.Contains($_))){$c+="`n$_"; $a = $b}}
    "New connections:$c"
    sleep 5
    rv c
}
