# Snippets for PowerShell

## Add date and time to exported file

    $filenameFormat = "Results - " + (Get-Date -Format "MM-dd-yyyy HH-mm-ss") + " - All Users and Only Specified Fields in Domain.csv"
    Rename-Item "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NewName $filenameFormat

## Insert a start date and timestamp

    $dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
    Write-Host "$dateTime" -ForegroundColor Yellow

## Insert an end date and timestamp

    $dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
    Write-Host "$dateTime" -ForegroundColor Green

## Add a date and timestamp to every single command you enter

    function prompt {
        $dateTime = get-date -Format "dd.MM.yyyy HH:mm:ss"
        $currentDirectory = $(Get-Location)
        write-host "$dateTime" -ForegroundColor White
        write-host "PS $(Convert-Path $currentDirectory)>" -NoNewline
        return " "
    }