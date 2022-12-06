# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Temp\Prod\Issuer\Issuer.jar"
File Issuer_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Issuer\Prod"
    DestinationPath = "C:\Temp\Prod"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\Issuer.lnk"
File Issuer_lnk{
    DependsOn = '[File]Issuer_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Issuer\Issuer.lnk"
    DestinationPath = "C:\Users\Public\Desktop\Issuer.lnk"
}
