<#
.SYNOPSIS
    This Powershell script ensures that Windows 10 systems must use a BitLocker PIN with a minimum length of six digits for pre-boot authentication.

.NOTES
    Author          : Bryan Torres
    LinkedIn        : www.linkedin.com/in/mystryzz
    GitHub          : https://github.com/BryanTorez
    Date Created    : 2025-01-09
    Last Modified   : 2025-01-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000032

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-00-000032.ps1 
#>
# Define the registry path and key-value pair
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$ValueName = "MinimumPIN"
$ValueData = 6
$ValueType = "DWORD"

# Check if the registry path exists, create it if not
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the registry key value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type $ValueType

# Confirm the change
Write-Host "Registry key '$RegistryPath' with value '$ValueName=$ValueData' has been set successfully."

#>
