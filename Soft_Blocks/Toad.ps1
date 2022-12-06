# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Toad for Oracle 14.0 (32-Bit)"
# $SoftGuid = "{C8AC210C-F59E-4B0B-AA52-BA105B5EE146}"
# $SoftPath = "C:\Program Files (x86)\Quest Software\Toad for Oracle 14.0\toad.exe"
Package Toad_14_x86{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Toad for Oracle 14.0 (32-Bit)"
    Path = "\\server.domain.ru\SOFT\ToadforOracle_GA_14.0.75.662_x86_En.msi"
    ProductId = "{C8AC210C-F59E-4B0B-AA52-BA105B5EE146}"
    Arguments = '/quiet /norestart'
}
