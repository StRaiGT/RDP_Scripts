# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Mozilla_Firefox_v99\firefox.exe"
File Firefox_v99_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Browsers\Firefox\Mozilla_Firefox_v99"
    DestinationPath = "C:\Program Files\Mozilla_Firefox_v99"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\Firefox_v99.lnk"
File Firefox_v99_lnk{
    DependsOn = '[File]Firefox_v99_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Browsers\Firefox\Firefox_v99.lnk"
    DestinationPath = "C:\Users\Public\Desktop\Firefox_v99.lnk"
}
