<#
.SYNOPSIS
    This Powershell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

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

# Define the registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Ensure the parent keys exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the MaxSize value
$PropertyName = "MaxSize"
$PropertyValue = 0x8000 # 32768 in decimal

New-ItemProperty -Path $RegistryPath -Name $PropertyName -Value $PropertyValue -PropertyType DWord -Force

#>

