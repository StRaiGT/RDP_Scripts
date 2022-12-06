# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\bloomrpc\BloomRPC.exe"
Script BloomRPC{
    # DependsOn = '[]'
    TestScript = {
        $test_path = 'C:\Program Files (x86)\bloomrpc\BloomRPC.exe'
        if (Test-Path $test_path -PathType Leaf){
            $true
        }else{
            $false
        }
    }
    #
    SetScript = {
        New-Item -ItemType Directory -force "C:\Program Files (x86)\bloomrpc"
        Copy-Item -Path "\\server.domain.ru\SOFT\bloomrpc\bloomrpc\*" -Destination "C:\Program Files (x86)\bloomrpc\" -Force -Recurse
        Copy-Item -Path "\\server.domain.ru\SOFT\bloomrpc\BloomRPC.lnk" -Destination "C:\Users\Public\Desktop\BloomRPC.lnk" -Force
    }
    #
    GetScript = {
        # Do Nothing
    }
}
