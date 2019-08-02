#gets computesr from aduc and gathers their os information
#
#

$ad_path = "OU=,OU=,OU=,DC=,DC=,DC=,DC="
$computer_list = get-adcomputer -filter * -searchbase $path #uncomment if you only want so many---> #|select -first 150
$save_path = "C:\Path\Path\file.csv"
$computer_list.name | %{ Invoke-Command -computername $_ -scriptblock {get-wmiobject win32_operatingsystem | select PSComputername, Name, OSarchitecture} | Export-Csv $save_path -Append -NoClobber -NoTypeInformation}
