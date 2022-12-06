# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "JProfiler 10.1.2"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\jprofiler10\bin\jprofiler.exe"
Package jprofiler{
    # DependsOn = '[]'
    Name = 'JProfiler 10.1.2'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\jprofiler_windows-x64_10_1_2.exe"
    Arguments = "-q"
    Ensure = 'Present'
}
