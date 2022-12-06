# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "DataGrip 2022.1.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\DataGrip 2022.1.3\bin\datagrip64.exe"
Package DataGrip_2022.1.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "DataGrip 2022.1.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Datagrip\datagrip-2022.1.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\DataGrip 2022.1.3'
}
