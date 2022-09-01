Import-Module ActiveDirectory
Clear-Host
# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "Updating attributes from CSV file.  Please stand by..." -ForegroundColor Cyan
Write-Host "$dateTime" -ForegroundColor Yellow

Import-csv -Path ".\Source - AD Users List.csv"
    ForEach-Object
    {
        $userName = $_.SamAccountName
    Get-ADUser $userName | Set-ADUser -Title $(Title) -Department $(Department) -Company $(company) -HomePhone $(company)
    Write-Host "Now updating user " + $userName + "." -ForegroundColor Cyan
    Write-Host "Updating Title to show " + $Title + "." -ForegroundColor Blue
    Write-Host "Updating Department to show " + $Department + "." -ForegroundColor Blue
    Write-Host "Updating Company to show " + $Company + "." -ForegroundColor Blue
    Write-Host "Updating Avaya phone number to show " + $HomePhone + "." -ForegroundColor Blue
    }