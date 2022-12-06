# Автоматическая установка
# Останавливает конвейер full_config (dsc вешается, помогает ручная перезагрузка)

# $SoftRegName = "PowerShell 7-x64"
# $SoftGuid = "{D91EDB21-FCD5-45AE-B983-CAFA80899437}"
# $SoftPath = "C:\Program Files\PowerShell\7\pwsh.exe"
Package Powershell_7{
    # DependsOn = '[]'
    Ensure = 'Present'
    Name = 'PowerShell 7-x64'
    Path = "\\server.domain.ru\SOFT\Powershell 7\PowerShell-7.2.0-win-x64.msi"
    ProductId = ''
    Arguments = "/quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1"
}
