# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Confluent_Platform\confluent-7.0.1\libexec\cli\windows_amd64\confluent.exe"
File Confluent_Platform{
    # 7.0.1
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Confluent_Platform\confluent-7.0.1"
    DestinationPath = "C:\Confluent_Platform\confluent-7.0.1"
}
