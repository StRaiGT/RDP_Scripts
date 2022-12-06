# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PyCharm Community Edition 2021.3.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\PycharmC 2021.3.3\bin\pycharm64.exe"
Package PycharmC_2021.3.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PyCharm Community Edition 2021.3.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Pycharm\pycharm-community-2021.3.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\PycharmC 2021.3.3'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PyCharm 2021.3.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\PycharmP 2021.3.3\bin\pycharm64.exe"
Package PycharmP_2021.3.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PyCharm 2021.3.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Pycharm\pycharm-professional-2021.3.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\PycharmP 2021.3.3'
}
