# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Wireshark 3.4.3 64-bit"
# $SoftGuid = $null
# $SoftPath = $null
Package Wireshark{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Wireshark 3.4.3 64-bit"
    Path = "\\server.domain.ru\SOFT\Wireshark-win64-3.4.3.exe"
    ProductId = ""
    Arguments = '/S'
}
