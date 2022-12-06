# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{381B1560-3850-4E80-BD01-781486364F7B}"
# $SoftPath = $null
Package mRemoteNG{
    # DependsOn = '[]'
    Name = 'mRemoteNG'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\mRemoteNG-Installer-1.76.20.24615.msi"
    Arguments = '/qn'
    Ensure = 'Present'
}
