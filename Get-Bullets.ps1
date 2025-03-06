<#
.SYNOPSIS
        Use this script to generate your five bullets for the previous weeks achievements.
.DESCRIPTION
        This PowerShell will take a text document containing a list of bullet achievements as input and will randomly pick 5 to use as your previous weeks achievements.
.EXAMPLE
        PS> Gen-Bullets.ps1 -Bullets <bullets list>.txt
.LINK
        https://www.github.com/rubbishBear/Gen-Bullets
.NOTES
        Author: rubbishBear
#>

param (
    [array]$bullets
)

if (-Not (Test-Path -Path $bullets)) {
    Write-Host "The file does not exist: $bullets"
    exit
}

if (-Not ($bullets -match '\.txt$')) {
    Write-Host "File format not recognized."
    exit
}

$randomFive = Get-Content $bullets | Get-Random -Count 5

[int]$bulletNumber = "1"

Write-Host "Your achievements for the past week: "
foreach ($bullet in $randomFive) {
     Write-Host "$bulletNumber. $bullet"
     $bulletNumber++
}
