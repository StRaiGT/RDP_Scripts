# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PLSQL Developer 12 (64 bit)"
# $SoftGuid = "{CEB3DF70-E7A1-4613-97B9-7B9909A57056}"
# $SoftPath = $null
Package PlSql_12_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PLSQL Developer 12 (64 bit)"
    Path = "\\server.domain.ru\SOFT\PL-SQL Developer\plsqldev1205x64.msi"
    ProductId = "{CEB3DF70-E7A1-4613-97B9-7B9909A57056}"
    Arguments = 'INSTALLDIR="C:\PLSQL_dev\PLSQL Developer 12 x64" REGISTEROPTION=2 PRODUCTCODE="" SERIALNUMBER="" PASSWORD=""'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PLSQL Developer 13 (32 bit)"
# $SoftGuid = "{6151877C-5C0B-4431-9992-0D7F381C2B94}"
# $SoftPath = $null
Package PlSql_13_x32{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PLSQL Developer 13 (32 bit)"
    Path = "\\server.domain.ru\SOFT\PL-SQL Developer\plsqldev1306x32.msi"
    ProductId = ""
    Arguments = 'INSTALLDIR="C:\PLSQL_dev\" REGISTEROPTION=2 PRODUCTCODE="" SERIALNUMBER="" PASSWORD=""'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PLSQL Developer 14 (32 bit)"
# $SoftGuid = "{1BFF7CBD-C9F0-44F4-8AC0-B3A7122B6687}"
# $SoftPath = $null
Package PlSql_14_x32{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PLSQL Developer 14 (32 bit)"
    Path = "\\server.domain.ru\SOFT\PL-SQL Developer\plsqldev1401x32.msi"
    ProductId = "{1BFF7CBD-C9F0-44F4-8AC0-B3A7122B6687}"
    Arguments = 'installpath="C:\PLSQL_dev\PLSQL Developer 14 x32" REGISTEROPTION=2 productcode="" serialnumber="" password=""'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PLSQL Developer 14 (64 bit)"
# $SoftGuid = "{3B546A4D-71AF-4906-8EAE-A702564FBFEA}"
# $SoftPath = $null
Package PlSql_14_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PLSQL Developer 14 (64 bit)"
    Path = "\\server.domain.ru\SOFT\PL-SQL Developer\plsqldev1401x64.msi"
    ProductId = "{3B546A4D-71AF-4906-8EAE-A702564FBFEA}"
    Arguments = 'installpath="C:\PLSQL_dev\PLSQL Developer 14 x64" REGISTEROPTION=2 productcode="" serialnumber="" password=""'
}