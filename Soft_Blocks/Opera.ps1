# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Opera Stable 85.0.4341.60"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Opera\85.0.4341.60\opera.exe"
Package Opera_85{
    # DependsOn = '[]'
    Name = 'Opera Stable 85.0.4341.60'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\Browsers\Opera\Opera_85.0.4341.60_Setup_x64.exe"
    Arguments = "/silent /allusers=1 /launchopera=0 /setdefaultbrowser=0"
    Ensure = 'Present'
}
