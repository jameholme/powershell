#Get MAC Address information
#
#

$save_path = C:\Path\File.txt
(Get-NetAdapter | ?{$_.name -like "Ethernet"}).MacAddress  > "$save_path"
