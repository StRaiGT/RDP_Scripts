# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "IBM Installation Manager"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\IBM\Installation Manager\eclipse\launcher.exe"
Package agent_installer{
    # DependsOn = '[]'
    Name = 'IBM Installation Manager'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\ODM\agent.installer.win32.win32.x86_64_1.8.8000.20171130_1105\installc.exe"
    Arguments = 'input "\\server.domain.ru\SOFT\ODM\File\file.xml" -nosplash -s -log \\server.domain.ru\SOFT\ODM\Log\log.xml -acceptLicense'
    Ensure = 'Present'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\IBM\ODM892\eclipse.exe"
Script ODM_install{
    DependsOn = "[Package]agent_installer"
    TestScript = {
        $path_1 = 'C:\Program Files\IBM\ODM892'
        $path_2 = 'C:\Program Files\IBM\IBMIMShared'
        if ((test-path $path_1) -and (test-path $path_2)){
            Write-Verbose 'ODM - FOUND'
            $true
        }else {
            Write-Verbose 'ODM - INSTALL IN PROCESS'
            $false
        }
    }
    #
    SetScript = {
        $params = 'input "\\server.domain.ru\SOFT\ODM\File\rec.xml" -nosplash -s -log \\server.domain.ru\SOFT\ODM\Log\log.xml -acceptLicense'
        $SetupExe = "C:\Program Files\IBM\Installation Manager\eclipse\IBMIM.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
    }
    #
    GetScript = {
        # Do Nothing
    }
}
