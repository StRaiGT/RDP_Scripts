# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\ActiveLogic Client\alclient.exe"
Script ActiveLogic_Client_v23.40.00c10{
    # DependsOn = '[]'
    TestScript = {
        $install_path = "C:\Program Files (x86)\ActiveLogic Client\alclient.exe"
        if (Test-Path $install_path -PathType Leaf){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        Start-Process "\\server.domain.ru\SOFT\PLClient\plclient-23.40.00c10-win64.cmd" -Wait
        Copy-Item -Path "\\server.domain.ru\SOFT\PLClient\alclient.lnk" -Destination "C:\Users\Public\Desktop\alclient.lnk" -Force
    }
    GetScript = {
        # Do Nothing
    }
}
