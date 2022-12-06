# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "SoapUI 5.6.0"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\SmartBear\SoapUI-5.6.0\bin\SoapUI-5.6.0.exe"
Package SoapUI{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "SoapUI 5.6.0"
    Path = "\\server.domain.ru\SOFT\SoapUI-x64-5.6.0.exe"
    ProductId = ""
    Arguments = '-q'
}
