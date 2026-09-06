$inactivePeriod = New-TimeSpan -Days 30

$inactiveUsers = Search-ADAccount -AccountInactive `
				 -TimeSpan $inactivePeriod `
				 -UsersOnly

$noExpirePasswd = Get-ADUser -Filter {PasswordNeverExpires -eq $true} -Properties PasswordNeverExpires

$domainAdmins = Get-ADGroupMember -Identity "Domain Admins"

$inactiveUsers | Get-Member

$htmlInactive = $inactiveUsers | ConvertTo-Html -Property Name, LastLogonDate -Fragment -PreContent "<h2>Useri inactivi</h2>"
$htmlNoExpire = $noExpirePassword | ConvertTo-Html -Property Name, SamAccountName -Fragment -PreContent "<h2>Parole care nu expira</h2>"
$htmlAdmins = $domainAdmins | ConvertTo-Html -Property Name, SamAccountName -Fragment -PreContent "<h2>Membri Domain Admins</h2>"

$fullReport = ConvertTo-Html -Body "$htmlInactive $htmlNoExpire $htmlAdmins" -Title "report"
$fullReport | Out-File "C:\Users\Administrator\Desktop\Report.html"
