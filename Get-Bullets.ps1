<#
.SYNOPSIS
        Use this script to generate your five bullets for the previous weeks achievements.
.DESCRIPTION
        This PowerShell script will take a text document containing a list of bullet achievements as input and will randomly pick 5 to use as your previous weeks achievements.
.EXAMPLE
        PS C:\>Get-Bullets.ps1 -Bullets <bullets list>.txt
.LINK
        https://www.github.com/rubbishBear/Get-Bullets
.NOTES
        Author: rubbishBear
#>

param (
    [array]$Bullets
)

if (-Not (Test-Path -Path $Bullets)) {
    Write-Host "The file does not exist: $Bullets"
    exit
}

if (-Not ($Bullets -match '\.txt$')) {
    Write-Host "File format not recognized."
    exit
}

$randomFive = Get-Content $Bullets | Get-Random -Count 5

[int]$bulletNumber = "1"

Write-Host "Your achievements for the past week: "
foreach ($bullet in $randomFive) {
     Write-Host "$bulletNumber. $bullet"
     $bulletNumber++
}
