# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PhpStorm 2021.3.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\PhpStorm 2021.3.3\bin\phpstorm64.exe"
Package PhpStorm_2021.3.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PhpStorm 2021.3.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\PhpStorm-2021.3.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\PhpStorm 2021.3.3'
}
