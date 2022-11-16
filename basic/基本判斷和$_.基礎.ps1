Out-Null
$a=Read-Host -Prompt "processname"
if (Get-Process |Where-Object{($_.Name) -match $a}) {
    if((Get-Process |Where-Object{$_.Name -match $a}).count -eq 1){
        Stop-Process -Name $a -Confirm
        Write-Output "The process has been killed"
    }else{
        Get-Process |Where-Object{$_.Name -match $a}
        Write-Output "Choose the process you want to kill"
        $id=Read-Host -Prompt "pid"
        Stop-Process -id $id -Confirm
        Write-Output "The process has been killed"
    }
}else{
    Write-Output "Process not found"
}
