# Ручная установка

# $SoftRegName = "PostgreSQL 12"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\PostgreSQL\12\bin\initdb.exe"
Script PostgreSql_12_x64{
    # Ручная установка
    # 12.10.1
    # распаковывается в C:\Users\k.baturin\AppData\Local\Temp\2 и это никак не изменить
    ## Need Microsoft Visual C++ 2015-2022 Redistributable (x64) - 14.30.30708 ##
    ## pgAdmin include ## xs374ca
    $SetupExe = "\\server.domain.ru\SOFT\PostgreSQL\postgresql-12.10-1-windows-x64.exe"
    $params = '--mode unattended --unattendedmodeui none --disable-components stackbuilder --superpassword pass'
    Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
}
