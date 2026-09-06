$users = Import-Csv -Path "C:\Users\Administrator\Downloads\employees.csv"

foreach ($angajat in $users) {
	$username = $angajat.FirstName.Substring(0,1).ToLower() + $angajat.LastName.ToLower()
	$angajat | Add-Member -NotePropertyName "Username" -NotePropertyValue $username
	Write-Host $angajat.username

	Add-Type -AssemblyName System.Web
	$rngpassword = [System.Web.Security.Membership]::GeneratePassword(12, 2)
	$securePass = ConvertTo-SecureString $rngpassword -AsPlainText -Force
	Write-Host "parola pt $username este $rngpassword"

	New-ADUser `
	-Name "$($angajat.FirstName) $($user.LastName)" `
	-GivenName $angajat.FirstName `
	-Surname $angajat.LastName `
	-SamAccountName $username `
	-UserPrincipalName "$username@labcorp.com" `
	-Path $angajat.OU `
	-AccountPassword $securePass `
	-Enabled $true `
	-ChangePasswordAtLogon $true
}
