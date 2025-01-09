<#
.SYNOPSIS
    This Powershell script ensures that the camera access from the lock screen is disabled.

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
# Define the registry path and property
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$propertyName = "NoLockScreenCamera"
$propertyValue = 1
$propertyType = "DWord"

# Check if the registry path exists; if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType $propertyType -Force

Write-Output "Registry key '$propertyName' set to $propertyValue at '$registryPath'."

#>

