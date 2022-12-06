# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Foxit Reader"
# $SoftGuid = $null
# $SoftPath = $null
Package FoxitReader{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Foxit Reader"
    Path = "\\server.domain.ru\SOFT\FoxitReader901_L10N_Setup_Prom.exe"
    ProductId = ""
    Arguments = '/verysilent /norestart /closeapplications'
}
