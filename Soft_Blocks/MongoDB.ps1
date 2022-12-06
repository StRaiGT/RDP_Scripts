# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\nosqlbooster4mongo\NoSQLBooster for MongoDB.exe"
File nosqlbooster4mongo_distr{
    #DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\nosqlbooster4mongo\nosqlbooster4mongo"
    DestinationPath = "C:\Program Files\nosqlbooster4mongo"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\NoSQLBooster for MongoDB.lnk"
File nosqlbooster4mongo_lnk{
    DependsOn = '[File]nosqlbooster4mongo_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\nosqlbooster4mongo\NoSQLBooster for MongoDB.lnk"
    DestinationPath = "C:\Users\Public\Desktop\NoSQLBooster for MongoDB.lnk"
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "mongodb-compass"
# $SoftGuid = "{0F8BD3E9-3D79-4DB4-8C46-3BC972CD34F4}"
# $SoftPath = "C:\Program Files\MongoDB Compass\MongoDBCompass.exe"
Package mongodb_compass{
    # DependsOn = '[]'
    Name = 'mongodb-compass'
    ProductId = '{0F8BD3E9-3D79-4DB4-8C46-3BC972CD34F4}'
    Path = "\\server.domain.ru\SOFT\mongodb-compass_sib.msi"
    Arguments = '/norestart'
    Ensure = 'Present'
}
