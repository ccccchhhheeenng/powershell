$prompt=New-Object -ComObject WScript.Shell
$value=$prompt.popup("Tap the button to answer",5,"Are you happy now?",4+32)
switch ($value) {
    6{$msg="Good"}
    7{$msg="Cheer Up"}
    -1{$msg="Anyone here?"}
}
$prompt.Popup($msg)
