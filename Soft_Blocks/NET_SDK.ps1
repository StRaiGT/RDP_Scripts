# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Microsoft .NET SDK 6.0.201 (x64)"
# $SoftGuid = "{8f210771-5ffc-4985-9efe-a502966ff6b5}"
# $SoftPath = $null
Package NET_SDK_6{
    # DependsOn = '[]'
    Name = 'Microsoft .NET SDK 6.0.201 (x64)'
    ProductId = '{8f210771-5ffc-4985-9efe-a502966ff6b5}'
    Path = "\\server.domain.ru\SOFT\dotNET_SDK\dotnet-sdk-6.0.201-win-x64.exe"
    Arguments = '/install /quiet /norestart'
    Ensure = 'Present'
}
