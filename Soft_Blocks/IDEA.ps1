# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "IntelliJ IDEA Community Edition 2021.3.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\ideaIC 2021.3.3\bin\idea64.exe"
Package ideaIC_2021.3.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "IntelliJ IDEA Community Edition 2021.3.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Idea\ideaIC-2021.3.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\ideaIC 2021.3.3'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "IntelliJ IDEA 2021.3.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\ideaIU 2021.3.3\bin\idea64.exe"
Package ideaIU_2021.3.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "IntelliJ IDEA 2021.3.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Idea\ideaIU-2021.3.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\ideaIU 2021.3.3'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "IntelliJ IDEA Community Edition 2022.1.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\ideaIC 2022.1.3\bin\idea64.exe"
Package ideaIC_2021.3.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "IntelliJ IDEA Community Edition 2022.1.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Idea\ideaIC-2022.1.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\ideaIC 2022.1.3'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "IntelliJ IDEA 2022.1.3"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\ideaIU 2022.1.3\bin\idea64.exe"
Package ideaIU_2022.1.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "IntelliJ IDEA 2022.1.3"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Idea\ideaIU-2022.1.3.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\ideaIU 2022.1.3'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\PluginForIdea"
File Plugin_for_idea{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Jetbrains\PluginForIdea\Ext"
    DestinationPath = "C:\PluginForIdea"
}
