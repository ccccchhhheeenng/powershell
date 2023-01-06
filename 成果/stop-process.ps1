#power by ccccchhhheeenng
#2023/01/05 22:52
#                                      @+      +@       :#.      +@
#                                      @+      +@       :#.      +@
#                                      @+      +@       :#.      +@
#    -+.    -+=    .+-     +=.   .=+.  @+ ==   +@  +-   :#.:+.   +@  +:     :+.     :+-      +-       ==       +-     :+.
#  :#%@%  -#@@@+  *%@@=  ##@@=  *%@@%  @@#@@#  +@=#@%-  :#=%@%#  +@##@%-   #%@%#   =%@@+   ##@%#:  ###@@#  =#:#@%+   #%@%+#+
#  @*.   :@@- .= +@.    #@*    :@#  :  @#: @@: +@@  +@: :@+  @@  +@@ :@@: %%: +@. =@- .@+ *@= :%=  @%: @@= +@@  =@: .@*  @@#
# =@=    :@=    =@:     #@     @@      @+   @# +@   =@: :@+  %@  +@   =@: @#...@@:%+..:@+ #@...*@  @+   @# +@.  =@: @#    @#
# @#     :@=    =@:    -%:     @@      @+   @# +@   =@: :#.  =@  +@   =@: @@@@@@@:@@@@@@+ #@@@@@@  @+   @# +@   =@: @#    @#
# @#     :@=    =@:    -%=     @@      @+   @# +@   =@: :#.  =@  +@   =@: @%++++=:@#++++- #@+++++  @+   @# +@   =@: @#    @#
# -@=    :@=    :%#     #@     @@-     @+   @# +@   =@: :#.  =@  +@   =@: @#      *%.     #@       @+   @# +@   =@: @@-  *@#
#  @@%%%  +@%%%* *@%%%+ -@%%%- .@@%%%  @+   @# +@   =@: :#.  =@  +@   =@: :@%%%%  =@%%%%+ .@%%%%:  @+   @# +@   =@: :@@%%#@#
#   =@@%   +@@%   -@@%=   @@@=   %@@-  @+   @# +@   =@: :#.  =%  +@   =@:  :@@@.   :%@@*    @@@=   @+   @# +@   =@:  :@@= @#
#                                                                                                                        -@-
#                                                                                                                    ====@#
#                                                                                                                    @@@@=:
#                                                                                                                    ::::
#--------------------
function show-processmatch {
    $q=$(Get-Process|Where-Object{$_.Name -match $a})
    return $q
}
function stop-all-process {
    $q=show-processmatch
    Stop-Process -InputObject $q
}
function get-processmatch {
    $n=(Get-Process |Where-Object{($_.Name) -match $a}).count
    return $n
}
function write-killed {
    Get-Process | Where-Object {$_.HasExited}
}
function promptout {
    $prompt=New-Object -ComObject WScript.Shell
    $rt=$prompt.popup("There are $cnt process running",0,"Are Tou Sure?",1+48)
    return $rt
}
#--------------------
Out-Null
$a=Read-Host -Prompt "processname"
$q=show-processmatch
$cnt=get-processmatch
if ($cnt -ne 0) {
    if($cnt -eq 1){
        Stop-Process -Name $a
        write-killed
        Write-Output "The process has been killed"
    }else{
        write-output $q
        Write-Output "Choose the process you want to kill,input a to kill all"
        $id=Read-Host -Prompt "pid"
        if ($id -eq "a"){
            $tof=promptout
            switch ($tof) {
                1{
                    stop-all-process
                    Write-Output "All of the process has been killed"}
                2{
                    Write-Output canceld
                    continue
                }
            }

        }else{
        Stop-Process -id $id
        Write-Output "The process has been killed"
        }
    }
}else{
    Write-Output "Process not found"
}
