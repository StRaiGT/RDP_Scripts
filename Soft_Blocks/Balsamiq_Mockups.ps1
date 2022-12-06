# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\Balsamiq Mockups 3\Balsamiq Mockups 3.exe"
File Balsamiq_Mockups_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Balsamiq Mockups 3"
    DestinationPath = "C:\Program Files (x86)\Balsamiq Mockups 3"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\Balsamiq Mockups 3.lnk"
File Balsamiq_Mockups_lnk{
    DependsOn = '[File]Balsamiq_Mockups_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Balsamiq Mockups 3\Balsamiq Mockups 3.lnk"
    DestinationPath = "C:\Users\Public\Desktop\Balsamiq Mockups 3.lnk"
}
