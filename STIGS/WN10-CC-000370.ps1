<#
.SYNOPSIS
    This Powershell script ensures that the convenience PIN for Windows 10 is disabled.

.NOTES
    Author          : Bryan Torres
    LinkedIn        : www.linkedin.com/in/mystryzz
    GitHub          : https://github.com/BryanTorez
    Date Created    : 2025-01-09
    Last Modified   : 2025-01-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000370.ps1 
#>

# Define the registry path and key details
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$propertyName = "AllowDomainPINLogon"
$propertyValue = 0

# Ensure the registry path exists, create it if it doesn't
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry key value
Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -PropertyType DWord

# Verify the change
Get-ItemProperty -Path $registryPath -Name $propertyName


#>

