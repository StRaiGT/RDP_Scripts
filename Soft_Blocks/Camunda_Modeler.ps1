# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Camunda_Modeler\camunda-modeler-4.5.0-win-x64\Camunda Modeler.exe"
File Camunda_Modeler_distr{
    #DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Camunda_Modeler\camunda-modeler-4.5.0-win-x64"
    DestinationPath = "C:\Program Files\Camunda_Modeler\camunda-modeler-4.5.0-win-x64"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\Camunda Modeler.lnk"
File Camunda_Modeler_lnk{
    DependsOn = '[File]Camunda_Modeler_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Camunda_Modeler\Camunda Modeler.lnk"
    DestinationPath = "C:\Users\Public\Desktop\Camunda Modeler.lnk"
}
