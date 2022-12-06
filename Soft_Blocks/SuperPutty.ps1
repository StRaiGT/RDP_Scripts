# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\SuperPuTTY-1.4.0.9\SuperPutty.exe"
File SuperPutty_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\SuperPuTTY\SuperPuTTY-1.4.0.9"
    DestinationPath = "C:\SuperPuTTY-1.4.0.9"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\SuperPutty.lnk"
File SuperPutty_lnk{
    DependsOn = '[File]SuperPutty_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\SuperPuTTY\SuperPutty.lnk"
    DestinationPath = "C:\Users\Public\Desktop\SuperPutty.lnk"
}
