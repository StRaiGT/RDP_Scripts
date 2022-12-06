# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "WinMerge 2.16.2.0"
# $SoftGuid = $null
# $SoftPath = $null
Package WinMerge{
    # DependsOn = '[]'
    Name = 'WinMerge 2.16.2.0'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\WinMerge-2.16.2-Setup.exe"
    Arguments = '/VERYSILENT /NORESTART'
    Ensure = 'Present'
}
