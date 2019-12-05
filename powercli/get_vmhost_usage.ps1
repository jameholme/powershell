#gets vcenter host usage stats
#dependent upon: having powercli installed and being connected to a vcenter server
#hint: use connect-viserver -server $servername 
#hint2: play around with the add days range and interval

$path = #your save path example: C:\Users\You\Desktop\Filename.csv
Get-VMHost | Where {$_.PowerState -eq "PoweredOn"} | Select Name, Host, NumCpu, MemoryTotalGB, `
@{N="CPU Usage (Average), Mhz" ; E={[Math]::Round((($_ | Get-Stat -Stat cpu.usagemhz.average -Start (Get-Date).AddDays(-30) -IntervalMins 120 | Measure-Object Value -Average).Average),2)}}, `
@{N="Memory Usage (Average), %" ; E={[Math]::Round((($_ | Get-Stat -Stat mem.usage.average -Start (Get-Date).AddDays(-30) -IntervalMins 120 | Measure-Object Value -Average).Average),2)}} , `
@{N="Network Usage (Average), KBps" ; E={[Math]::Round((($_ | Get-Stat -Stat net.usage.average -Start (Get-Date).AddDays(-30) -IntervalMins 120 | Measure-Object Value -Average).Average),2)}} , `
@{N="Disk Usage (Average), KBps" ; E={[Math]::Round((($_ | Get-Stat -Stat disk.usage.average -Start (Get-Date).AddDays(-30) -IntervalMins 120 | Measure-Object Value -Average).Average),2)}} |`
Export-Csv -Path $Path
