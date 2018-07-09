<#-------------------------
Name: DataIntegrity.ps1
Author: Ethan Gyori
Use:
  $pA as original path
  $pB as backup path
  when $pA becomes corrupt,
    replace $pA with $pB
Last Modified: 07/09/2018
-------------------------#>

$pA = "C:\path\to\original"
$pB = "C:\path\to\backup"

function gfh{
    param($p)
    ls $p | %{$c += (Get-FileHash -a MD5 -pa $_.FullName | select -exp 'Hash')[0..10]}
    return $c 
}

while($?){
    $a = (gfh -p $pA)
    $b = (gfh -p $pB)
    if(!($a -eq $b)){
    ls $pA -r | del -fo
    ls $pB -r | cpi -fo -des $pA}
    sleep -s 5
    rv a,b
}
