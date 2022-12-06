# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Temp\Gradle\bin\gradle"
File Gradle_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Gradle\Gradle"
    DestinationPath = "C:\Temp\Gradle"
}
