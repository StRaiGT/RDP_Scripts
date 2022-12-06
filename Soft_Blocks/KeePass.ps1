# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "KeePass Password Safe 2.50"
# $SoftGuid = $null
# $SoftPath = $null
Package KeePass_2.50{
    # DependsOn = '[]'
    Name = 'KeePass Password Safe 2.50'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\KeePass-2.50-Setup.exe"
    Arguments = '/VERYSILENT /NORESTART'
    Ensure = 'Present'
}
