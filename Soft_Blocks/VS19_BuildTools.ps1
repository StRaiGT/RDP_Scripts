# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = "Visual Studio Build Tools 2019"
# $SoftGuid = $null
# $SoftPath = $null
Package VS19BuildTools{
    # DependsOn = '[]'
    Name = 'Visual Studio Build Tools 2019'
    ProductId = '{6F320B93-EE3C-4826-85E0-ADF79F8D4C61}'
    Path = "\\server.domain.ru\SOFT\VisualStudio2019\vs_setup.exe"
    Arguments = "--quiet --add Microsoft.VisualStudio.Workload.ManagedDesktopBuildTools --add Microsoft.VisualStudio.Workload.WebBuildTools --add Microsoft.VisualStudio.Workload.NetCoreBuildTools --add Microsoft.VisualStudio.Component.Windows10SDK.18362 --add Microsoft.Net.Component.4.7.TargetingPack --includeRecommended --wait"
    Ensure = 'Present'
}
