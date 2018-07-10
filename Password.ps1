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
if($a){rv a;$a = [char[]]([char]65..[char]90) + [char[]]([char]97..[char]122)}
else{rv a; $a}
if($n){rv n;$n = [char[]]([char]48..[char]57)}
else{rv n; $n}
if($s){rv s;$s = [char[]]([char]33..[char]47)}
else{rv s; $s}
if($e){rv e;$e = [char[]]([char]122..[char]126)}
else{rv e; $e}
(''+$a+$n+$s+$e | sort {Get-Random})[0..$size] -join ''  
