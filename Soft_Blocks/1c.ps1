# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "1С:Предприятие 8 (x86-64) (8.3.20.1710)"
# $SoftGuid = "{8B8B203F-7C03-489E-AABD-C4EB3E39271C}"
# $SoftPath = "C:\Program Files\1cv8\8.3.20.1710\bin\1cv8.exe"
Package 1C_x86_x64_8.3.20.1710{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "1С:Предприятие 8 (x86-64) (8.3.20.1710)"
    Path = "\\server.domain.ru\SOFT\1C\windows64full_8_3_20_1710\setup.exe"
    ProductId = "{8B8B203F-7C03-489E-AABD-C4EB3E39271C}"
    Arguments = '/S'
}
