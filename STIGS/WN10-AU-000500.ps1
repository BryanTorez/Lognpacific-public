<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Bryan Torres
    LinkedIn        : www.linkedin.com/in/mystryzz
    GitHub          : https://github.com/BryanTorez
    Date Created    : 2025-01-09
    Last Modified   : 2025-01-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

# # Define the registry key path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Define the registry value name and data
$ValueName = "MaxSize"
$ValueData = 0x8000 # Hexadecimal value: 00008000

# Check if the registry path exists, if not, create it
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData

Write-Output "Registry value set successfully."

