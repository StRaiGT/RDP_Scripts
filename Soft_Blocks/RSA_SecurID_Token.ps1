# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "RSA SecurID Software Token"
# $SoftGuid = "{2F4D61A5-C336-47C8-A2D7-73C760F7EF67}"
# $SoftPath = $null
Package RSA_SecurID_Token{
    # DependsOn = '[]'
    Name = 'RSA SecurID Software Token'
    ProductId = '{2F4D61A5-C336-47C8-A2D7-73C760F7EF67}'
    Path = "\\server.domain.ru\SOFT\RSASecurIDToken502x64.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}
