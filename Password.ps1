<#-------------------------
Name: Password.ps1
Author: Ethan Gyori
Use:
  $size as integer
  $a,$n,$s,$e as switch
  $a -Alpha Chars
  $n -Numeric Chars
  $s -Special Chars
  $e -Extra chars
  
Last Modified: 07/10/2018
-------------------------#>

param([int]$size, [switch]$a, [switch]$n, [switch]$s, [switch]$e)
function c{param ($x, $y)
return ([char[]]([char]$x..[char]$y))}

try{(($a,65,90),($a,97,122),($n,48,57),($s,33,47),($e,122,126)| %{if($_[0]){c $_[1] $_[2]}}|sort {Get-Random})[0..$size] -join ''}catch{}
