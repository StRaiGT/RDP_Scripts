# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "010 Editor 12.0.1 (64-bit)"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\010 Editor\010Editor.exe"
Package 010_Editor_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "010 Editor 12.0.1 (64-bit)"
    Path = "\\server.domain.ru\SOFT\010_Editor\010EditorWin64Installer12.0.1.exe"
    ProductId = ""
    Arguments = '/verysilent /norestart'
}
