# Gets all AD attributes from all users in the domain.
# Warning: this can be a lengthy process.
# Returns all data to a CSV file.
Get-ADUser -Filter * -Properties * | Export-Csv "C:\Temp\Get Multiple AD Users.csv" -NoTypeInformation