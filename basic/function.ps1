function listprocess {
    $value=Get-Process|Where-Object{$_.Name -match $a}
    return $value
}
function processcount {
    return $output.count
}
$a=Read-Host
$output=listprocess
$processcnt=processcount
Write-Output $output
if ($processcnt -eq 1){
    Write-Output "There is $processcnt process running"
}elseif ($processcnt -eq 0) {
    Write-Output "process not found"
}else {
    Write-Output "There are $processcnt process running"
}
