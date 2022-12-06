# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Aginity Workbench for Pivotal Greenplum"
# $SoftGuid = "{C526C8EE-D28C-4B3E-8456-D776B8898C90}"
# $SoftPath = "C:\Program Files\Aginity\Aginity Workbench for Pivotal Greenplum(x64)\Aginity.GreenplumWorkbench.exe"
Script install_AginityGreenplum{
    # DependsOn = '[]'
    TestScript = {
        $Aginity_install = Get-Item 'C:\Program Files\Aginity\Aginity Workbench for Pivotal Greenplum(x64)\Aginity.GreenplumWorkbench.exe' -EA 0
        if ($Aginity_install){
            Write-Verbose 'Aginity FOUND'
            $true
        }
        else {
            Write-Verbose 'Aginity - INSTALL IN PROCESS'
            $false
        }
    }
            #
    SetScript = {
        $params = "/s"
        $SetupExe = "\\server.domain.ru\SOFT\AginityGreenplum\AginityGreenplumWorkbenchSetupx64.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
    }
    GetScript = {
        # Do Nothing
    }
}
