Out-Null
if (Get-Process |Where-Object{$_.Name -match "word"}) {
    cmd /c "taskkill /im word.exe /f"
    Write-Output "The process has been killed"
}
else {
    <# Action when all if and elseif conditions are false #>
    Write-Output "process not found"
}
