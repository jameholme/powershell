#gets group members displayname/email and exports to csv file

$group =  #change your group name 'group name'
$path = #change your save path 'C:\Path\File.csv'
$domain = #change your domain 'domain.local'
Get-adgroupmember -Identity $group -recursive -server $domain |
Get-aduser -properties * | select-object displayName, Mail | Export-CSV $path
