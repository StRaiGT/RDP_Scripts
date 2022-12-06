# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{2C5F58B0-1BF6-4BD3-A665-C1B5206BDC17}"
# $SoftPath = "C:\Program Files (x86)\NetSarang\Xshell 7\xshell.exe"
Script Xshell_7{
    # DependsOn = '[]'
    TestScript = {
        $path_install = 'C:\Program Files (x86)\NetSarang\Xshell 7\'
        if (test-path $path_install){
            Write-Verbose 'Xshell FOUND'
            $true
        }else {
            Write-Verbose 'Xshell - INSTALL IN PROCESS'
            $false
        }
    }
    #
    SetScript = {
        Copy-Item -Path '\\server.domain.ru\SOFT\XShell\xinstall.iss' -Destination 'c:\temp\xinstall.iss'
        $params = "-s -f1c:\temp\xinstall.iss"
        $SetupExe = "\\server.domain.ru\SOFT\XShell\Xshell-7.0.0049r.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
    }
    #
    GetScript = {
        # Do Nothing
    }
} 
