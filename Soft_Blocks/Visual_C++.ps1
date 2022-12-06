# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Microsoft Visual C++ 2015-2022 Redistributable (x64) - 14.30.30708"
# $SoftGuid = $null
# $SoftPath = $null
Package VC_2015_2022x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Microsoft Visual C++ 2015-2022 Redistributable (x64) - 14.30.30708"
    Path = "\\server.domain.ru\SOFT\VC_redist\VC_redist_2015-2022_x64.exe"
    ProductId = "{ee198d9f-cfe1-4f8a-bf5f-7b1be355b63d}"
    Arguments = '/install /quiet /norestart'
}
