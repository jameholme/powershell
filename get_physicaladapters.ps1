# Get_PhysicalAdapters.ps1

<#
.SYNOPSIS
This Script gathers the physical network adapters on the host.
.DESCRIPTION
Displays all the physical network adapters from the WIN32_NETWORKADAPTER class.
.PARAMETER ComputerName
The name of the local, or remote computer to check the physical network adapters of.
.EXAMPLE
PS C:\> .\Get-NetAdapter.ps1 -ComputerName COMPUTER01
#>

[cmdletbinding()]
Param (
[Parameter(Mandatory=$True,HelpMessage="Enter a ComputerName to query")]
[alias('hostname')]
[string]$ComputerName
)

Write-Verbose "Getting physical network adapters from $ComputerName"

Get-WmiObject -class Win32_NetworkAdapter -ComputerName $ComputerName |
Where { $_.PhysicalAdapter } |
Select MACAddress,AdapterType,DeviceID,Name,Speed

Write-Verbose "Complete."
