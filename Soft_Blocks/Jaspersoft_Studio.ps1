# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "TIBCO Jaspersoft Studio 6.6.0"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\TIBCO\Jaspersoft Studio-6.6.0\Jaspersoft Studio.exe"
Package Jaspersoft_Studio_distr_6_6_0{
    # DependsOn = '[]'
    Name = 'TIBCO Jaspersoft Studio 6.6.0'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\TIBCO Jaspersoft Studio\TIB_js-studiocomm_6.6.0_windows_x86_64.exe"
    Arguments = "/S /D='C:\Program Files\TIBCO\Jaspersoft Studio-6.6.0'"
    Ensure = 'Present'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\TIBCO\Jaspersoft Studio-6.6.0\dropins\eclipse\plugins\ElasticSearchExtension.jar"
File Jaspersoft_Studio_plugins_6_6_0{
    DependsOn = '[Package]Jaspersoft_Studio_distr'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\TIBCO Jaspersoft Studio\dropins"
    DestinationPath = "C:\Program Files\TIBCO\Jaspersoft Studio-6.6.0\dropins"
}

# $SoftRegName = "TIBCO Jaspersoft Studio 6.19.1"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\TIBCO\Jaspersoft Studio-6.19.1\Jaspersoft Studio.exe"
Package Jaspersoft_Studio_distr_6_19_1{
    # DependsOn = '[]'
    Name = 'TIBCO Jaspersoft Studio 6.19.1'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\TIBCO Jaspersoft Studio\TIB_js-studiocomm_6.19.1_windows_x86_64.exe"
    Arguments = "/S /D='C:\Program Files\TIBCO\Jaspersoft Studio-6.19.1'"
    Ensure = 'Present'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\TIBCO\Jaspersoft Studio-6.19.1\dropins\eclipse\plugins\ElasticSearchExtension.jar"
File Jaspersoft_Studio_plugins_6_19_1{
    DependsOn = '[Package]Jaspersoft_Studio_distr_6_19_1'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\TIBCO Jaspersoft Studio\dropins"
    DestinationPath = "C:\Program Files\TIBCO\Jaspersoft Studio-6.19.1\dropins"
}

