# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Beyond Compare 4.2.6"
# $SoftGuid = $null
# $SoftPath = $null
Package BCompare_4{
    # DependsOn = '[]'
    Name = 'Beyond Compare 4.2.6'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\BCompare-4.2.6.23150.exe"
    Arguments = "/VERYSILENT /NORESTART"
    Ensure = 'Present'
}
