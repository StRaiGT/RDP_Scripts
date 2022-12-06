# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{0240359E-6A4C-4884-9E94-B397A02D893C}"
# $SoftPath = $null
Package rdcman{
    # DependsOn = '[]'
    Name = 'Remote Desktop Connection Manager'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\rdcman.msi"
    Arguments = '/qn /norestart ALLUSERS=2 LAUNCHPROGRAM=0 LAUNCHREADME=0'
    Ensure = 'Present'
}
