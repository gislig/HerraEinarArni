function main(){
    if(!(Test-Path users.csv)){
        Write-Host "Cannot find the file users.csv, are you in the directory where the file is located"
    }
    $Users = Import-Csv users.csv -Delimiter ","
    foreach ($User in $Users) {
        New-LocalUser -Name $User.notendanafn -Fullname $User.nafn
        Add-LocalGroupMember -Group $User.hopur -Member $User.notendanafn
    }
}

main