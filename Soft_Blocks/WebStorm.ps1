# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "WebStorm 2021.3.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\WebStorm 2021.3.3\bin\webstorm64.exe"
Package WebStorm_2021.3.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "WebStorm 2021.3.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\WebStorm\WebStorm-2021.3.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\WebStorm 2021.3.3'
}
