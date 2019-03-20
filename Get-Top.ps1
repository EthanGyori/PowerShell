#takes top 5 heavy processes and gets associated items in netstat
$n = netstat -ano; ps | sort ws -d |  select -f 5 Name,@{Name='WS(MB)';Expression={[math]::round(($_.ws / 1024kb),3)}},@{Name='CPU';expression={[math]::round($_.cpu,3)}},@{Name='Local Host'; expression={(($n | sls $_.id -a)  -split '\s\s*')[2]}},@{Name='Foreign Host'; expression={(($n | sls $_.id -a)  -split '\s\s*')[3]}} | ft -a 
