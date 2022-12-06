# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\CONSULTANT+.lnk"
File Consultant_lnk{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = '\\server.domain.ru\SOFT\CONSULTANT+.lnk'
    DestinationPath = 'C:\Users\Public\Desktop\CONSULTANT+.lnk'
}
