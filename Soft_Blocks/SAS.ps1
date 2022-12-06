# Требуется ручная установка
# Not tested
Script SAS_xml_console_map{
    # DependsOn = '[]'
    TestScript = {
        $test_path = "C:\Program Files\SASHome\SASManagementConsole\9.4\sasmc.exe"
        if (Test-Path -Path $test_path -PathType Leaf){
            $true
        }else {
            $false
        }
    }
    #
    SetScript = {
        $params = '-quiet -wait -responsefile "\\server.domain.ru\SOFT\SAS\SAS_9.4_EG_DI\sas_xml_console_map.properties"'
        $SetupExe = "\\server.domain.ru\SOFT\SAS\SAS_9.4_EG_DI\setup.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
        Start-Sleep 5
        Copy-Item -Path "\\server.domain.ru\SOFT\SAS\SAS_9.4_EG_DI\sasmc.ini" -Destination "C:\Program Files\SASHome\SASManagementConsole\9.4\sasmc.ini" -Force
    }
    #
    GetScript = {
        # Do Nothing
    }
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "c:\temp\FirefoxPortableESR\SAS MA.lnk"
File SAS_MA{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Browsers\SAS_MA\FirefoxPortableESR"
    DestinationPath = "c:\temp\FirefoxPortableESR"
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "SAS Enterprise Guide 8.2 (64-bit)"
# $SoftGuid = "{598BCBB6-CD49-4203-BDAF-68A9E7677181}"
# $SoftPath = "C:\Program Files\SASHome\SASEnterpriseGuide\8\SEGuide.exe"
Package SaS8{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "SAS Enterprise Guide 8.2 (64-bit)"
    Path = "\\server.domain.ru\SOFT\SAS\SAS_EG_8\SAS_eguide8.msi"
    ProductId = "{598BCBB6-CD49-4203-BDAF-68A9E7677181}"
    Arguments = '/qn /norestart'
}
##################################################################################################################################

# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = "SAS Enterprise Guide 7.1 (64-bit)"
# $SoftGuid = "{42AD9967-08E3-48FB-A5D3-E6DA0674EAB9}"
# $SoftPath = "C:\Program Files\SASHome\SASEnterpriseGuide\7.1\SEGuide.exe"
Package SAS_EG_DI{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "SAS Enterprise Guide 7.1 (64-bit)"
    Path = "\\server.domain.ru\SOFT\SAS\SAS_9.4_EG_DI\setup.exe"
    ProductId = ""
    Arguments = '-quiet -wait -responsefile "\\server.domain.ru\SOFT\SAS\SAS_9.4_EG_DI\sas_eg_di.properties"'
}
