# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "VNC Viewer 6.20.529"
# $SoftGuid = "{DCF5BBEA-3BDB-4E03-BF06-03836F320CA6}"
# $SoftPath = $null
Package VNC_Viewer{
    # DependsOn = '[]'
    Name = 'VNC Viewer 6.20.529'
    ProductId = '{DCF5BBEA-3BDB-4E03-BF06-03836F320CA6}'
    Path = "\\server.domain.ru\SOFT\VNC-Viewer-6.20.529-Windows.exe"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}
