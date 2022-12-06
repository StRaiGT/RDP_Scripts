# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\eKassir\Monitoring\Studio\Monitoring.Studio.exe"

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\eKassir Monitoring Studio.lnk"

Script eKassir_Monitoring_Studio{
    # DependsOn = '[]'
    TestScript = {
        $test_path = "C:\Program Files\eKassir\Monitoring\Studio\monitor.ico"
        if (Test-Path $test_path -PathType Leaf){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        New-Item -ItemType Directory -Path 'C:\Program Files\eKassir\Monitoring\Studio' -Force
        Copy-Item -Path '\\server.domain.ru\SOFT\eKassir\Studio 4.0.20.84\*' -Destination "C:\Program Files\eKassir\Monitoring\Studio\" -force -Recurse
        Copy-Item -Path '\\server.domain.ru\SOFT\eKassir\eKassir Monitoring Studio.lnk' -Destination 'C:\Users\Public\Desktop\eKassir Monitoring Studio.lnk' -force
    }
    GetScript = {
        # Do Nothing
    }
}
