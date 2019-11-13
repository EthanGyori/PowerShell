function Get-IP{
    $ip = Get-NetIPConfiguration | Where-Object{
            $_.IPv4DefaultGateway -ne $null;
        } | %{
            $_.Ipv4address.IPAddress; 
            $_.IPv4DefaultGateway.NextHop;
        }  

    [PSCustomObject]@{
        "IPv4Address"=$ip[0];
        "DefaultGateway"=$ip[1];
        }
    }
