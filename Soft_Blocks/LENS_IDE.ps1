# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = "Lens 5.4.5-latest.20220405.1"
# $SoftGuid = $null
# $SoftPath = $null
Package LENS_IDE_5.4.5{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Lens 5.4.5-latest.20220405.1"
    Path = "\\server.domain.ru\SOFT\LENS_IDE\Lens+Setup+5.4.5-latest.20220405.1.exe"
    ProductId = ""
    Arguments = '/S /allusers /disableAutoUpdates'
}

##################################################################################################################################

# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = "Lens 5.4.6-latest.20220428.1"
# $SoftGuid = $null
# $SoftPath = $null
Package LENS_IDE_5.4.6{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Lens 5.4.6-latest.20220428.1"
    Path = "\\server.domain.ru\SOFT\Lens Setup 5.4.6-latest.20220428.1.exe"
    ProductId = ""
    Arguments = '/S /allusers /disableAutoUpdates'
} 
