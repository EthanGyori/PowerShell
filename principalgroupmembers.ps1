(get-aduser -f * | select -exp name) | %{$_;write "---";Get-adprincipalgroupmembership $_ -erroraction silentlycontinue | select -exp name}
