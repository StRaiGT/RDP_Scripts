# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Python310\python.exe"
Script Python_3{
    #DependsOn = '[]'
    TestScript = {
        $test_path = "C:\Program Files\Python310\python.exe"
        if (Test-Path -PathType Leaf $test_path){
            $true
        }else{
            $false
        }
    }
    #
    SetScript = {
        $params = "/quiet InstallAllUsers=1 PrependPath=1"
        $SetupExe = "\\server.domain.ru\SOFT\Python\python-3.10.1-amd64.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
        New-Item -ItemType Directory "C:\ProgramData\pip" -Force | out-null
        Copy-Item -Path '\\server.domain.ru\SOFT\Anaconda\pip.ini' -Destination 'C:\ProgramData\pip\pip.ini' -force
    }
    #
    GetScript = {
        # Do Nothing
    }
}
