#get MAC address info

$save_path = #change your save path example: 'C:\Path\File.txt'
(Get-NetAdapter | ?{$_.name -like "Ethernet"}).MacAddress  > "$save_path"
