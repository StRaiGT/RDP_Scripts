# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{104EBE8E-905E-48C7-995B-18D3D3CF674F}"
# $SoftPath = $null
Script Cyberduck{
    # DependsOn = '[]'
    TestScript = {
        $test_path = 'C:\Program Files\Cyberduck'
        if (Test-Path $test_path){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        $params = "/quiet /norestart"
        $SetupExe = "\\server.domain.ru\SOFT\Cyberduck-Installer-7.3.1.32784.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
    }
    GetScript = {
        # Do Nothing
    }
}
