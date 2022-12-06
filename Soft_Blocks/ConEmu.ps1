# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "ConEmu 201124.x64"
# $SoftGuid = "{4D4317D0-E8A3-47BE-820B-D374867F6EE2}"
# $SoftPath = $null
Package ConEmu{
    # DependsOn = '[]'
    Name = 'ConEmu 201124.x64'
    ProductId = '{4D4317D0-E8A3-47BE-820B-D374867F6EE2}'
    Path = "\\server.domain.ru\SOFT\ConEmuSetup.201124.exe"
    Arguments = '/p:x64,adm /qn /quiet /norestart'
    Ensure = 'Present'
}
