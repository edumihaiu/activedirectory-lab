param(
	[string]$Username
)

Add-Type -AssemblyName System.Web
$rngpassword = [System.Web.Security.Membership]::GeneratePassword(12, 2)
Write-Host "parola pt $Username este $rngpassword"
$securePass = ConvertTo-SecureString $rngpassword -AsPlainText -Force
Set-ADAccountPassword -Identity $Username -NewPassword $securePass -Reset
Unlock-ADAccount -Identity $Username


$logEntry = "$(Get-Date) - Password reset + unlock for user: $Username - performed by: $env:USERNAME"
Add-Content -Path "C:\Users\Administrator\Desktop\password-resets.log" -Value $logEntry
