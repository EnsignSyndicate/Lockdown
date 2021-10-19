# This program will assist in hardening a Windows machine before being attacked by a red team.

# TODO
# -Add option to change user passwords
# -Then disable guest and default admin
# -Add option to change fire
# -Change User and administrator permissions (group membership)
# -File permissions
# -Close open ports
# -Firewall rules (along with ports)
#
#==================================================================

Write-Host "Welcome to the Windows Lockdown Script!"
Write-Host ""
Write-Host "First step, lets deal with users."

Get-LocalUser
sleep 1

Write-Output ""
$answer = Read-Host -Prompt "Would you like to change all user passwords? (y/n):"

if ($answer -eq "y"){
    $newPass = Read-Host -AsSecureString "Please enter secure string for password: "
    Write-Output "Thank you. Now changing passwords..."

    $users = @()
    Get-LocalUser | Set-LocalUser -Password $newPass


} elseif($answer -eq "n") {

} else {
    Write-Output "Invalid answer. Continuing."
    exit
}

$answer = Read-Host -Prompt "Would you like to disable the Administrator and Guest accounts? (y/n):"

if ($answer -eq "y"){
    Disable-LocalUser -Name "Administrator"
    Disable-LocalUser -Name "Guest"

} elseif($answer -eq "n") {

} else {
    Write-Output "Invalid answer. Continuing."
    exit
}

