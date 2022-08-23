Import-Module ActiveDirectory
Remove-Item "C:\Temp\Results - AD User from Source File.csv"

$userList = import-csv "C:\Temp\Source - AD Users List.csv"
ForEach($User in $userList){
     Get-ADUser -Identity $user.UserName -Properties * | Select-Object SamAccountName, Mail, CN, EmployeeID | Export-Csv -Append "C:\Temp\Results - AD User from Source File.csv" -NoTypeInformation
}