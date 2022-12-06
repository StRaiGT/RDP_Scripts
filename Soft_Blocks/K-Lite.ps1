# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "K-Lite Codec Pack 15.9.0 Full"
# $SoftGuid = $null
# $SoftPath = $null
Package k_lite_15{
    # DependsOn = '[]'
    Name = 'K-Lite Codec Pack 15.9.0 Full'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\K-Lite_Codec_Pack_1590_Full.exe"
    Arguments = '/VERYSILENT /NORESTART'
    Ensure = 'Present'
}
