Import-Module ActiveDirectory

$Date = Get-Date -UFormat "%Y%m%d"

#Pull all Generic user accounts
$UserList = Get-ADUser -filter * -Properties * | Where-Object {($_.employeeid -eq $null)-and ($_.department -ne $null) -and ($_.distinguishedName -notlike "*Vendors*")-and ($_.distinguishedName -notlike "*Clients*")-and ($_.distinguishedName -notlike "*EmailOnlyAccounts*")-and ($_.distinguishedName -notlike "*RoomResources*")} |
Select-Object SamAccountName, DisplayName, Description, Department, LastLogonDate, WhenCreated, Enabled
$UserFile = "C:\Temp\Results - Priv User Groups - " + $Date + ".csv"
$UserList | Export-Csv -Path $UserFile -NoTypeInformation -Encoding UTF8


#Finds all Service and Generic System Accounts
$Accounts = Get-ADUser -filter * -Properties * | Where-Object {($_.employeeid -eq $null)-and ($_.distinguishedName -notlike "*Vendors*")-and ($_.distinguishedName -notlike "*Clients*")-and ($_.distinguishedName -notlike "*EmailOnlyAccounts*")-and ($_.distinguishedName -notlike "*RoomResources*")} |
    ForEach-Object {
        $User = $_
        $User.memberof |
            ForEach-Object {
	            [PSCustomObject]@{
                    SamAccountName = $User.SamAccountName
		            DisplayName = $User.DisplayName
                    Description = $user.Description
                    Department = $User.Department
                    LastLogonDate = $user.LastLogonDate
                    WhenCreated = $user.WhenCreated
                    Enabled = $user.Enabled
                    # Group = Get-ADGroup -Identity $_ -Properties * | Select-Object -ExpandProperty Name
                    # GroupDescription = Get-ADGroup -Identity $_ -Properties * | Select-Object -ExpandProperty Description
	            }  # end of PSCustomObject
            }  # end of Foreach-Object #2
    }  # end of Foreach-Object #1


#Sets the save location for the file
$FileName = "C:\Temp\Results - Priv User Groups - " + $Date + ".csv"

#Exports the results in CSV format
$Accounts | Export-Csv -Path $FileName -NoTypeInformation -Encoding UTF8