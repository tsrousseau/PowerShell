foreach($aduser in (import-csv ".\Source - Get SamAccountName.csv"))
    {
        Get-ADUser -filter "givenname -eq '$($aduser.'first name')' -and surname -eq '$($aduser.'last name')'" -properties SamAccountName | Export-Csv "C:\Temp\Results - AD Usernames.csv" -NoTypeInformation -Append
    }