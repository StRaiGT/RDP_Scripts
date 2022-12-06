# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "MySQL Workbench 8.0 CE"
# $SoftGuid = "{6129E3AD-632C-4574-8575-653D9B4FF7C8}"
# $SoftPath = "C:\Program Files\MySQL\MySQL Workbench 8.0 CE\MySQLWorkbench.exe"
Package mysql_workbench_8{
    # DependsOn = '[]'
    Name = 'MySQL Workbench 8.0 CE'
    ProductId = '{6129E3AD-632C-4574-8575-653D9B4FF7C8}'
    Path = "\\server.domain.ru\SOFT\mysql-workbench-community-8.0.18-winx64.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}
