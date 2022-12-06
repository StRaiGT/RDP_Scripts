# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Kafka Tool 2 2.0.7"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\kafkatool2\kafkatool.exe"
Package kafkatool_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Kafka Tool 2 2.0.7"
    Path = "\\server.domain.ru\SOFT\kafkatool_64bit_2.2.0.7.exe"
    ProductId = ""
    Arguments = '-q'
}
