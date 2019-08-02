#gets computers from aduc and gets their name and mac address information
#
#

$path = "OU=,OU=,OU=,DC=,DC=,DC=,DC="
$computer_list = get-adcomputer -filter * -searchbase $path #uncomment this if you only want so many#|select -first 150
$save_path = "C:\Path\File.csv

$computer_list.name | %{

    [pscustomobject]@{
        
        Name = $_       
        MacAddress = Invoke-Command -computername $_ -scriptblock {(Get-NetAdapter | ?{$_.name -like "Ethernet"}).MacAddress}

    
    } | Export-Csv -Append -NoClobber -NoTypeInformation -Path $save_path

}

