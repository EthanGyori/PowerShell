#foreach AD User, get Member of
Get-ADuser -f * | %{"Name: " + $_.name + " `tEnabled: " +  $_.Enabled; "`n"; Get-ADPrincipalGroupMembership $_.Name | select -ExpandProperty Name; "`n" }
