<#
.SYNOPSIS
Gets free drive space.
.DESCRIPTION
This commands gets all the drives percentage that have less than the amount specified.
.PARAMETER Computername
The name of the computer, either local or remote. The default is the localhost.
.PARAMETER Minimum
The minimum percent free diskspace. Left blank, it shows the free space of all drives without a minimum.
.PARAMETER DriveType
The DriveType. The default is 3. I think the options are 1-6.
.EXAMPLE
PS C:\> Get-FreeDisk -Minimum 10
PS C:\> Get-FreeDisk -ComputerName NotTheDC -Minimum 100
PS C:\> Get-FreeDisk -DriveType 3
#>

Param (
$ComputerName= $env:computername,
$Minimum=100,
$DriveType=3)

$MinPercent = $Minimum/100

Get-WmiObject -Class Win32_LogicalDisk -ComputerName $ComputerName -Filter "drivetype=$DriveType" |
Where { $_.FreeSpace / $_.Size -lt $MinPercent } |
Select -Property DeviceID,FreeSpace,Size
