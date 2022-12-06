# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Scala Programming Language Distribution"
# $SoftGuid = "{7606E6DA-E168-42B5-8345-B08BF774CB30}"
# $SoftPath = $null
Package Scala_SDK{
    # DependsOn = '[]'
    Name = 'Scala Programming Language Distribution'
    ProductId = '{7606E6DA-E168-42B5-8345-B08BF774CB30}'
    Path = "\\server.domain.ru\SOFT\scala-2.13.3.msi"
    Arguments = '/qn /norestart'
    Ensure = 'Present'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "sbt 1.6.2"
# $SoftGuid = "{CE07BE71-510D-414A-92D4-DFF47631848A}"
# $SoftPath = $null
Package Scala_SBT{
    #DependsOn = '[]'
    Name = 'sbt 1.6.2'
    ProductId = '{CE07BE71-510D-414A-92D4-DFF47631848A}'
    Path = "\\server.domain.ru\SOFT\Scala_sbt\sbt-1.6.2.msi"
    Arguments = '/qn /norestart'
    Ensure = 'Present'
} 
