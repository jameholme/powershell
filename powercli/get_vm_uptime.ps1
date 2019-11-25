#gets vcenter vms uptimes 
#dependent upon: having powercli installed and being connected to a vcenter server
#hint: use connect-viserver -server $servername 

$stat = 'sys.osuptime.latest'
$now = Get-Date
$vms = Get-VM -name #Add your VM names here, wildcard* accepted.
Get-Stat -Entity $vms -Stat $stat -Realtime -MaxSamples 1 |
Select @{N='VM';E={$_.Entity.Name}},
    @{N='LastOSBoot';E={$now.AddSeconds(- $_.Value)}},
    @{N='UptimeDays';E={[math]::Floor($_.Value/(24*60*60))}}
