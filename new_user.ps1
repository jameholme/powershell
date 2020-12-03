# Set default password
$PasswordPrompt = Read-Host -Prompt 'User Password'
$Password = (ConvertTo-SecureString $PasswordPrompt -AsPlainText -force)

# Set the Domain Name
$Domain = "the.lab"

# Gathers User Information
$FirstName = Read-Host -Prompt 'First Name'
$LastName = Read-Host -Prompt 'Last Name'
$DisplayName = $FirstName + $LastName
$FullUserName = $FirstName + "." + $LastName + "@" + $Domain
$ProxyAddress1 = "SMTP:" + $Mail
$ProxyAddress2 = "smtp:" + $MailAlias
$SAMAccountName = $LastName + "." + $FirstName
$SAMAccountLower = $SAMAccountName.ToLower()
$UserPrincipalName = $EMail

New-ADUser -SamAccountName $SamAccountLower -Name $DisplayName -DisplayName $DisplayName -GivenName $FirstName -Surname $LastName -UserPrincipalName $FullUserName -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $false -AccountPassword $Password -PassThru 
Add-ADGroupMember -Identity "RemoteUsers" -Members $SAMAccountLower
