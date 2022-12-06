# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{EA457B21-F73E-494C-ACAB-524FDE069978}_is1"
# $SoftPath = $null
Package VS_Code{
    # DependsOn = '[]'
    Name = 'Microsoft Visual Studio Code'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\VSCode\VSCodeSetup-x64-1.64.2.exe"
    Arguments = '/VERYSILENT /NORESTART /MERGETASKS=!runcode'
    Ensure = 'Present'
}
