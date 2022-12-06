# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Postman\app-7.13.0\Postman.exe"
File Postman_7_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Postman\Postman"
    DestinationPath = "C:\Program Files\Postman"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\Postman.lnk"
File Postman_7_lnk{
    DependsOn = '[File]Postman_7_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Postman\Postman.lnk"
    DestinationPath = "C:\Users\Public\Desktop\Postman.lnk"
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Postman\app-9.4.0\Postman.exe"
File Postman_9_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Postman\Postman9"
    DestinationPath = "C:\Program Files\Postman"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\Postman.lnk"
File Postman_9_lnk{
    DependsOn = '[File]Postman_9_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Postman\Postman.lnk"
    DestinationPath = "C:\Users\Public\Desktop\Postman.lnk"
}
