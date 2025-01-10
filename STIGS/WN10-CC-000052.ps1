<#
.SYNOPSIS
    This Powershell script ensures that Windows 10 must be configured to prioritize ECC Curves with longer key lengths first.

.NOTES
    Author          : Bryan Torres
    LinkedIn        : www.linkedin.com/in/mystryzz
    GitHub          : https://github.com/BryanTorez
    Date Created    : 2025-01-09
    Last Modified   : 2025-01-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000803

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000803.ps1 
#>

# Define the registry path and value details
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"
$regName = "EccCurves"
$regType = "Binary"
$regData = [byte[]](
    0x4E, 0x00, 0x69, 0x00, 0x73, 0x00, 0x74, 0x00, 0x50, 0x00, 0x33, 0x00,
    0x38, 0x00, 0x34, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x69, 0x00, 0x73, 0x00,
    0x74, 0x00, 0x50, 0x00, 0x32, 0x00, 0x35, 0x00, 0x36, 0x00, 0x00, 0x00,
    0x00, 0x00
)

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $regName -Value $regData -PropertyType $regType

Write-Host "Registry value set successfully."

#>
