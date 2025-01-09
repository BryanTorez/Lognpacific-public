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
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$keyName = "MaxSize"
$keyValue = 0x00008000  # Hexadecimal value as DWORD

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry key value
Set-ItemProperty -Path $registryPath -Name $keyName -Value $keyValue -Type DWord

# Verify the change
if ((Get-ItemProperty -Path $registryPath).$keyName -eq $keyValue) {
    Write-Host "Registry key set successfully."
} else {
    Write-Host "Failed to set the registry key."
}


#>

