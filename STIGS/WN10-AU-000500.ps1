<#
.SYNOPSIS
    Camera access from the lock screen must be disabled.

.NOTES
    Author          : Bryan Torres
    LinkedIn        : www.linkedin.com/in/mystryzz
    GitHub          : https://github.com/BryanTorez
    Date Created    : 2025-01-09
    Last Modified   : 2025-01-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000005.ps1 
#>

# Path to the registry key
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Check if the registry key exists, create it if not
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the "NoLockScreenCamera" value
Set-ItemProperty -Path $RegPath -Name "NoLockScreenCamera" -Value 1 -PropertyType DWord

#>

