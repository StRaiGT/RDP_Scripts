# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "MobaXterm"
# $SoftGuid = "{AE9308FB-0A16-4496-89F7-07CB198572F4}"
# $SoftPath = $null
Package MobaXterm{
    # DependsOn = '[]'
    Name = 'MobaXterm'
    ProductId = '{AE9308FB-0A16-4496-89F7-07CB198572F4}'
    Path = "\\server.domain.ru\SOFT\MobaXterm_Installer_v20.6\MobaXterm_installer_20.6.msi"
    Arguments = '/qn'
    Ensure = 'Present'
}
