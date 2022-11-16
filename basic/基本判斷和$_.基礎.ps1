if (Get-Process |where{$_.Name -match "excel"}) {
    cmd /c "taskkill /im excel.exe /f"
    echo "The process has been killed"
}
else {
    <# Action when all if and elseif conditions are false #>
    echo "process not found"
}
