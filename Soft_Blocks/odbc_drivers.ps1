# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Simba Spark ODBC Driver 64-bit"
# $SoftGuid = "{74534B3E-7D37-4436-9C4E-2D80B45056DA}"
# $SoftPath = "C:\Program Files\Simba Spark ODBC Driver\lib\SparkODBC_sb64.dll"
Package SimbaSpark_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Simba Spark ODBC Driver 64-bit"
    Path = "\\server.domain.ru\SOFT\Tableau\Tableau_drivers\SimbaSpark1.2-64-bit.msi"
    ProductId = ""
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\clickhouse-odbc\bin\clickhouseodbc.dll"
Package clickhouse_odbc_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "clickhouse-odbc"
    Path = "\\server.domain.ru\SOFT\Tableau\Tableau_drivers\clickhouse-odbc-1.1.8-win64.msi"
    ProductId = ""
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "psqlODBC_x64"
# $SoftGuid = "{8D39D446-9952-41E4-8337-60F5AFB3361D}"
# $SoftPath = $null
Package psqlODBC_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "psqlODBC_x64"
    Path = "\\server.domain.ru\SOFT\psqlodbc_10_03_0000-x64\psqlodbc_x64.msi"
    ProductId = "{8D39D446-9952-41E4-8337-60F5AFB3361D}"
    Arguments = '/quiet /norestart'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Progress DataDirect Connect64 ® and Connect64 XE for ODBC 7.1 SP6"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Progress\DataDirect\Connect64_for_ODBC_71\jre\bin\java.exe"
Script install_Progress_DataDirect_Connect_x64{
    # DependsOn = '[]'
    TestScript = {
        $DataDirectinstall = Get-Item "C:\Program Files\Progress\DataDirect\Connect64_for_ODBC_71\jre" -EA 0
        if($DataDirectinstall){
            Write-Verbose 'FOUND'
            $true
        }else{
            Write-Verbose 'INSTALL IN PROCESS'
            $false
        }
    }
    SetScript = {
        Start-Process "\\server.domain.ru\SOFT\Tableau\Tableau_drivers\PROGRESS_DATADIRECT_CONNECT64_ODBC_7.1.6.HOTFIX_WIN_64\install.cmd" -Wait -NoNewWindow
    }
    GetScript = {
        # Do Nothing
    }
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\Greenplum\greenplum-connectivity-4.3.25.0\drivers\odbc"
Script install_greenplum_connectivity{
    # DependsOn = '[]'
    TestScript = {
        $greeninstall = Get-Item "C:\Program Files (x86)\Greenplum\greenplum-connectivity-4.3.25.0\drivers\odbc\" -EA 0
        if($greeninstall){
            Write-Verbose 'greenplum-connectivity FOUND'
            $true
        }else{
            Write-Verbose 'greenplum-connectivity - INSTALL IN PROCESS'
            $false
        }
    }
    SetScript = {
        Start-Process "\\server.domain.ru\SOFT\AginityGreenplum\install.cmd" -Wait -NoNewWindow
    }
    GetScript = {
        # Do Nothing
    }
}
