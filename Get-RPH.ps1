param([int]$hs = 10)

$r = @('A') + 2..9 + 'J','K','Q'
$s='C','D','H','S'

1..$hs |%{$c += @(([string]$r[(Get-Random -max $r.Length)]) + ([string]$s[(Get-Random -max $s.Length)]))}
$c | %{$_[0]} | group

rv c
