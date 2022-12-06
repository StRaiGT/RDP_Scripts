# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\DataGrip Drivers"
File DriversForPL{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Drivers\PSD\DataGrip Drivers"
    DestinationPath = "C:\DataGrip Drivers"
}
