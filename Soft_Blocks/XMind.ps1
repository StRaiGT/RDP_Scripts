# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "XMind ZEN 9.3.1"
# $SoftGuid = "fbd30ee5-8150-549e-9aed-fd9d444364fb"
# $SoftPath = $null
Package XMind_ZEN_9{
    # DependsOn = '[]'
    Name = 'XMind ZEN 9.3.1'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\XMind-ZEN-Update-2019-for-Windows-64bit-9.3.1-201909210110.exe"
    Arguments = "/allUsers /S"
    Ensure = 'Present'
}
