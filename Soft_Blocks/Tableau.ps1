# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Tableau 2020.3 (20203.20.0801.1333)"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Tableau\Tableau Desktop 2020.3\bin\tableau.exe"
Package TableauDesktop_2020.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Tableau 2020.3 (20203.20.0801.1333)"
    Path = "\\server.domain.ru\SOFT\Tableau\TableauDesktop\TableauDesktop-64bit-2020-3-0.exe"
    ProductId = ""
    Arguments = '/install /quiet /norestart ACCEPTEULA=1 AUTOUPDATE=0 DESKTOPSHORTCUT=1 STARTMENUSHORTCUT=1 INSTALLDIR="C:\Program Files\Tableau\Tableau Desktop 2020.3"'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Tableau 2021.2 (20212.21.0712.0907)"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Tableau\TableauDesktop-2021.2.1\bin\bin\tableau.exe"
Package TableauDesktop_2021.2{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Tableau 2021.2 (20212.21.0712.0907)"
    Path = "\\server.domain.ru\SOFT\Tableau\TableauDesktop\TableauDesktop-64bit-2021-2-1.exe"
    ProductId = ""
    Arguments = '/install /quiet /norestart ACCEPTEULA=1 AUTOUPDATE=0 DESKTOPSHORTCUT=1 STARTMENUSHORTCUT=1 INSTALLDIR="C:\Program Files\Tableau\TableauDesktop-2021.2.1"'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Tableau Reader 2020.3 (20203.20.0801.1333)"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Tableau\Tableau Reader 2020.3\bin\tabreader.exe"
Package TableauReader_2020.3{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Tableau Reader 2020.3 (20203.20.0801.1333)"
    Path = "\\server.domain.ru\SOFT\Tableau\TableauReader\TableauReader-64bit-2020-3-0.exe"
    ProductId = ""
    Arguments = '/install /quiet /norestart ACCEPTEULA=1 AUTOUPDATE=0 DESKTOPSHORTCUT=1 STARTMENUSHORTCUT=1 INSTALLDIR="C:\Program Files\Tableau\Tableau Reader 2020.3"'
}
