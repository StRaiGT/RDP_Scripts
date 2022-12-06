# Пример скрипта для заливки через Desire State Configuration

# Задаём список хостов
$Machine = "host1.domain.ru
host2.domain.ru
host3.domain.ru"
$Machine = $Machine -split "`n"

# Конфигурируем параметры установки
Configuration LCMConfig{
    param(
        [Parameter(Mandatory)]  $Machine
        )
    Import-DscResource -ModuleName PsDesiredStateConfiguration
    Node $Machine{
        LocalConfigurationManager{
            ConfigurationMode   =  "ApplyAndAutoCorrect"
            ConfigurationModeFrequencyMins = 15
            RefreshMode    = "Push"
            RebootNodeIfNeeded    = $true
        }
    }
}
# Создаём индивидуальные конфиги для каждого хоста
$Machine | %{LCMConfig -Machine $_ -OutputPath C:\MOF\Example_Prod\lcm}
# Отправляем конфиги на эти хосты
$machine | %{Set-DscLocalConfigurationManager -Path C:\MOF\Example_Prod\LCM -Verbose -ComputerName $_ -Force}


# Блок создание конфигов установки софта
Configuration Example_Prod_config{
    param(
        [Parameter(Mandatory)]  $Machine
        )
    Import-DscResource -ModuleName 'PsDesiredStateConfiguration'
    #
    Node $Machine{
    ######################################### INITIAL BLOCK ##########################################
        Script Tmp_Clear{
            TestScript = {
                $false
            }
            #
            SetScript = {
                Get-ChildItem "C:\Windows\Temp\"|Remove-Item -Recurse -Confirm:$false -EA 0
            }
            #
            GetScript = {
                # Do Nothing
            }
        }    
        Script InitialSetup{
            DependsOn = '[Script]Tmp_Clear'
            SetScript = {
                ipconfig /registerdns
                powercfg -h off
                Set-Service -Name 'WSearch' -startuptype Automatic -status Running
                Set-Service -Name 'RemoteRegistry' -startuptype Automatic -status Running
                Set-Service -Name 'Audiosrv' -startuptype Automatic -status Running
                #fix acl temp
                $name = (Get-LocalGroup -SID S-1-5-32-545).name
                $check_tmp = Test-Path 'c:\temp'
                if ($check_tmp -ne 'True'){
                    New-Item -ItemType Directory -Path 'c:\Temp' -Force
                }
                $Obj = Get-Item 'c:\temp\'
                $acl = Get-Acl $Obj
                if ($Obj.Mode -like 'd*----'){
                    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name", "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
                }
                if ($Obj.Mode -like '-*****'){
                    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name","Modify","Allow")
                }
                $acl.SetAccessRule($accessRule)
                $Fullname = $Obj.FullName
                Set-Acl $Fullname $acl
                # Chat start message
                New-Item -ItemType Directory 'C:\Temp\dsc_mon' -Force | Out-Null
                Stop-Process -Name 'dsc_monitoring' -EA 0 -Confirm:$false -Force
                if(!(Test-Path 'C:\temp\dsc_mon\message_ts.txt' -PathType Leaf)){
                    $pc_name = $env:computername
                    $dsc_conf_name = "Example-Prod_config"
                    #
                    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                    $PSDefaultParameterValues['Invoke-RestMethod:ErrorAction'] = 'SilentlyContinue'
                    # Указать токен бота
                    $token = 'token_id'
                    # Указать адрес API
                    $mattermost = 'api.domain.ru'
                    # Эндпоинт для отправки поста
                    $url_message = "https://$mattermost/api/v4/posts"
                    # Эндпоинт для получения id канала
                    $url_ch_id = "https://$mattermost/api/v4/teams/name/{0}/channels/name/{1}"
                    # Указать имя канала
                    $ch_name = 'channel_name'
                    # Указать имя пространства
                    $team_name = 'SpaceName'
                    $invokeParam = @{
                        Headers = @{Authorization = "Bearer $token"}
                        # Указать прокси
                        Proxy = 'http://proxy.domain.ru:8080'
                        UseBasicParsing = $true
                        ContentType = 'application/json;charset=utf-8'
                        UserAgent = 'dsc_manifest'
                    }
                    try {
                        $ch_id = (Invoke-RestMethod -Uri $($url_ch_id -f $team_name, $ch_name) -Method GET @invokeParam -ErrorAction Stop).id
                    }
                    catch {
                        Write-Verbose "`n`nTiMe error!`n$($_.Exception.Message)`n"
                    }
                    if ($ch_id) {
                        # message
                        $msg = "``[$dsc_conf_name] on $pc_name ``"
                        $body = @{channel_id=$ch_id;message=$msg} | ConvertTo-Json
                        $resp_message = Invoke-RestMethod -Uri $url_message -Method POST -Body $body @invokeParam
                        # message ts
                        $message_ts = $resp_message.id
                        $message_ts > 'C:\temp\dsc_mon\message_ts.txt'
                    }
                }
            }
            TestScript = {
                $false
            }
            GetScript = {
                # Do Nothing
            }
        }
        Script MUI_install{
            DependsOn = '[Script]InitialSetup'
            TestScript = {
                if(Test-Path 'HKLM:\SYSTEM\DSC_Config\MUI'){
                    $true
                }else{
                    $false
                }
            }
            #
            SetScript = {
                Copy-Item -Path '\\server.domain.ru\SOFT\MUI\MUI.exe' -Destination 'C:\Temp\MUI.exe' -Force
                Start-Process -FilePath "C:\Temp\MUI.exe" -Wait
                New-Item -Path 'HKLM:\SYSTEM\DSC_Config\MUI' -Force | Out-Null
                Get-ChildItem -Path 'C:\temp' -Filter "MUI.*" | Remove-Item -Force -Confirm:$false
                $global:DSCMachineStatus = 1
            }
            #
            GetScript = {
                # Do Nothing
            }
        }
        Script InstallUpdates_initial{
            DependsOn = '[Script]MUI_install'
            GetScript = {
                # Sets the criteria for the updates to be installed.
                $Criteria = "IsInstalled=0 and Type='Software'"
                # Search for relevant updates.
                $Searcher = New-Object -ComObject Microsoft.Update.Searcher
                $SearchResult = $Searcher.Search($Criteria).Updates
                Write-Verbose 'Number of patches to install is $SearchResult.Count'
                # Sets the number of patches remaining to the count from the search.
                $NumberOfPatches = $SearchResult.Count
                # Return the amount of patches remaining.
                Return @{
                    'Result' = "Currently there are $NumberOfPatches patches to install."
                }
            }
            TestScript = {
                $false
                # Sets the criteria for the updates to be installed.
                $Criteria = "IsInstalled=0 and Type='Software'"
                # Search for relevant updates.
                $Searcher = New-Object -ComObject Microsoft.Update.Searcher
                $SearchResult = $Searcher.Search($Criteria).Updates
                If($SearchResult.count -eq 0){
                    Write-Verbose 'No patches waiting to install'
                    Return $true
                }else{
                    Write-Verbose 'Patches are still waiting to install'
                    Return $false
                }
            }
            SetScript = {
                # Sets the criteria for the updates to be installed.
                $Criteria = "IsInstalled=0 and Type='Software'"
                # Search for relevant updates.
                $Searcher = New-Object -ComObject Microsoft.Update.Searcher
                $SearchResult = $Searcher.Search($Criteria).Updates
                # Download updates.
                $Session = New-Object -ComObject Microsoft.Update.Session
                $Downloader = $Session.CreateUpdateDownloader()
                $Downloader.Updates = $SearchResult
                $Downloader.Download()
                # Install updates.
                $Installer = New-Object -ComObject Microsoft.Update.Installer
                $Installer.Updates = $SearchResult
                $Result = $Installer.Install()
                # If the machine needs a reboot, the DSC resource sets it to reboot.
                If($Result.rebootRequired){
                    $global:DSCMachineStatus = 1
                }
            }
        }
        Registry EnablePhotoviewe-Step1{
            DependsOn = '[Script]InstallUpdates_initial'
            Ensure = "Present"
            Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open"
            ValueName = "MuiVerb"
            ValueData = "@photoviewer.dll,-3043"
            ValueType = "String"
            Force = $true
        }
        Registry EnablePhotoviewe-Step2{
            DependsOn = '[Registry]EnablePhotoviewe-Step1'
            Ensure = "Present"
            Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget"
            ValueName = "Clsid"
            ValueData = "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
            ValueType = "String"
            Force = $true
        }
        Registry EnablePhotoviewe-Step3{
            DependsOn = '[Registry]EnablePhotoviewe-Step2'
            Ensure = "Present"
            Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command"
            ValueName = ""
            ValueData = '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
            ValueType = "ExpandString"
            Force = $true
        }
        Registry EnablePhotoviewe-Step4{
            DependsOn = '[Registry]EnablePhotoviewe-Step3'
            Ensure = "Present"
            Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\DropTarget"
            ValueName = "Clsid"
            ValueData = '{60fd46de-f830-4894-a628-6fa81bc0190d}'
            ValueType = "String"
            Force = $true
        }
        WindowsFeature InstallTelnet-Client{
            DependsOn = '[Registry]EnablePhotoviewe-Step4'
            Name = "Telnet-Client"
            Ensure = "Present"
            IncludeAllSubFeature = $true
        }
        WindowsFeature InstallSNMP{
            DependsOn = '[WindowsFeature]InstallTelnet-Client'
            Name = "SNMP-Service"
            Ensure = "Present"
            IncludeAllSubFeature = $true
        }
        WindowsFeature InstallNET_3_5{
            DependsOn = '[WindowsFeature]InstallSNMP'
            Name = "Net-Framework-Core"
            Ensure = "Present"
            Source = "\\server.domain.ru\SOFT\Nsclient++\net3_5\sxs"
            IncludeAllSubFeature = $true
        }
    ######################################### START SOFT BLOCK #######################################
        #
        Package ZipInstall{
            DependsOn = '[WindowsFeature]InstallNET_3_5'
            Ensure = "Present"
            Name = "7-Zip 19.00 (x64 edition)"
            Path = "\\server.domain.ru\SOFT\Archivators\7z1900-x64.msi"
            ProductId = "23170F69-40C1-2702-1900-000001000000"
            Arguments = '/norestart'
        }
        #
        Package jre-8u121x86{
            DependsOn = '[Package]ZipInstall'
            Ensure = "Present"
            Name = "Java 8 Update 121"
            Path = "\\server.domain.ru\SOFT\java\jre-8u121-windows-i586.exe"
            ProductId = "{26A24AE4-039D-4CA4-87B4-2F32180121F0}"
            Arguments = 'INSTALL_SILENT=Enable'
        }
        #
        Package jre-8u121x64{
            DependsOn = '[Package]jre-8u121x86'
            Ensure = "Present"
            Name = "Java 8 Update 121 (64-bit)"
            Path = "\\server.domain.ru\SOFT\java\jre-8u121-windows-x64.exe"
            ProductId = "{26A24AE4-039D-4CA4-87B4-2F64180121F0}"
            Arguments = 'INSTALL_SILENT=Enable'
        }
        #
        Package AcroRdr_2017{
            DependsOn = '[Package]jre-8u121x64'
            Name = 'Adobe Acrobat Reader 2017 MUI'
            ProductId = '{AC76BA86-7AD7-FFFF-7B44-AE1108756300}'
            Path = "\\server.domain.ru\SOFT\AcroRdr20171700830051_MUI.exe"
            Arguments = "/sAll /rs /msi EULA_ACCEPT=YES"
            Ensure = 'Present'
        }
        #
        Package Notepad_x64{
            DependsOn = '[Package]AcroRdr_2017'
            Ensure = "Present"
            Name = "Notepad++ (64-bit x64)"
            Path = "\\server.domain.ru\SOFT\npp.8.4.4.Installer.x64.exe"
            ProductId = ""
            Arguments = '/S'
        }
        #
        ################################ THIS SOFT STOPPED NEXT INSTALL #################################
        #
        Package Chrome_100{
            DependsOn = '[Package]Notepad_x64'
            Ensure = "Present"
            Name = "Google Chrome"
            Path = "\\server.domain.ru\SOFT\Browsers\Chrome_new\googlechromestandaloneenterprise64_100.msi"
            ProductId = "{B24F0A95-6C38-3CA4-AFC8-7BDD38B8C51D}"
            Arguments = '/norestart'
        }
        #
    ################################# HAND INSTALL (SOFT STOP DSC) ###################################
        <#
        Package Powershell_7{
            # DependsOn = '[]'
            Ensure = 'Present'
            Name = 'PowerShell 7-x64'
            Path = "\\server.domain.ru\SOFT\Powershell 7\PowerShell-7.2.0-win-x64.msi"
            ProductId = ''
            Arguments = "/quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1"
        }
        #>
    ######################################### END SOFT BLOCK #########################################
        Script Defender{
            DependsOn = '[Package]Chrome_100'
            TestScript = {
                $test_path = 'C:\Windows\Test_defender'
                if (test-path $test_path){
                    $true
                }else {
                    $false
                }
            }
            SetScript = {
                Start-Process "\\server.domain.ru\SOFT\Defender\WindowsDefenderATPLocalOnboardingScript.cmd" -Wait -NoNewWindow
                Start-Process -Filepath "\\server.domain.ru\SOFT\Defender\netsh.cmd" -Wait
            }
            GetScript = {
                # Do Nothing
            }
        }
        Package Windows_exporter{
            DependsOn = '[Script]Defender'
            Name = 'windows_exporter'
            ProductId = '{D6F05276-350B-4E3B-A608-19D8B00A8396}'
            Path = "\\server.domain.ru\SOFT\Windows_exporter\windows_exporter-0.16.0-amd64.msi"
            Arguments = 'EXTRA_FLAGS="--config.file=""\\server.domain.ru\SOFT\Windows_exporter\config.yml"""'
            Ensure = 'Present'
        }
        File Windows_exporter_config{
            DependsOn = '[Package]Windows_exporter'
            Ensure = "Present" # Ensure the directory is Present on the target node.
            Type = "File" # The default is File
            SourcePath = "\\server.domain.ru\SOFT\Windows_exporter\config.yml"
            DestinationPath = "C:\Program Files\windows_exporter\config.yml"
        }
        Script InstallUpdates_finish{
            DependsOn = '[File]Windows_exporter_config'
            GetScript = {
                # Sets the criteria for the updates to be installed.
                $Criteria = "IsInstalled=0 and Type='Software'"
                # Search for relevant updates.
                $Searcher = New-Object -ComObject Microsoft.Update.Searcher
                $SearchResult = $Searcher.Search($Criteria).Updates
                Write-Verbose 'Number of patches to install is $SearchResult.Count'
                # Sets the number of patches remaining to the count from the search.
                $NumberOfPatches = $SearchResult.Count
                # Return the amount of patches remaining.
                Return @{
                    'Result' = "Currently there are $NumberOfPatches patches to install."
                }
            }
            TestScript = {
                $false
                # Sets the criteria for the updates to be installed.
                $Criteria = "IsInstalled=0 and Type='Software'"
                # Search for relevant updates.
                $Searcher = New-Object -ComObject Microsoft.Update.Searcher
                $SearchResult = $Searcher.Search($Criteria).Updates
                If($SearchResult.count -eq 0){
                    Write-Verbose 'No patches waiting to install'
                    Return $true
                }else{
                    Write-Verbose 'Patches are still waiting to install'
                    Return $false
                }
            }
            SetScript = {
                # Sets the criteria for the updates to be installed.
                $Criteria = "IsInstalled=0 and Type='Software'"
                # Search for relevant updates.
                $Searcher = New-Object -ComObject Microsoft.Update.Searcher
                $SearchResult = $Searcher.Search($Criteria).Updates
                # Download updates.
                $Session = New-Object -ComObject Microsoft.Update.Session
                $Downloader = $Session.CreateUpdateDownloader()
                $Downloader.Updates = $SearchResult
                $Downloader.Download()
                # Install updates.
                $Installer = New-Object -ComObject Microsoft.Update.Installer
                $Installer.Updates = $SearchResult
                $Result = $Installer.Install()
                # If the machine needs a reboot, the DSC resource sets it to reboot.
                If($Result.rebootRequired){
                    $global:DSCMachineStatus = 1
                }
            }
        }
        Script Finish{
            DependsOn = '[Script]InstallUpdates_finish'
            TestScript = {
                $false
            }
            #
            SetScript = {
                Set-Service -Name 'gupdatem' -startuptype Disabled -status Stopped -EA 0
                Set-Service -Name 'gupdate' -startuptype Disabled -status Stopped -EA 0
                Get-ChildItem "C:\Windows\Temp\"|Remove-Item -Recurse -Confirm:$false -EA 0
                $pc_name = $env:computername
                $date = Get-Date -format dd_MM_yyyy
                New-Item -ItemType File "\\server.domain.ru\Logs\Complete\$date\$pc_name`_DSC_COMPLETE.txt" -Force | Out-Null
                # Chat end block
                [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                $PSDefaultParameterValues['Invoke-RestMethod:ErrorAction'] = 'SilentlyContinue'
                # Указать токен бота
                $token = 'token_id'
                # Указать адрес API
                $mattermost = 'api.domain.ru'
                # Эндпоинт для отправки поста
                $url_message = "https://$mattermost/api/v4/posts"
                # Эндпоинт для получения id канала
                $url_ch_id = "https://$mattermost/api/v4/teams/name/{0}/channels/name/{1}"
                # Указать имя канала
                $ch_name = 'channel_name'
                # Указать имя пространства
                $team_name = 'SpaceName'
                $invokeParam = @{
                        Headers = @{Authorization = "Bearer $token"}
                        # Указать прокси
                        Proxy = 'http://proxy.domain.ru:8080'
                        UseBasicParsing = $true
                        ContentType = 'application/json;charset=utf-8'
                        UserAgent = 'dsc_manifest'
                }
                try {
                    $ch_id = (Invoke-RestMethod -Uri $($url_ch_id -f $team_name, $ch_name) -Method GET @invokeParam -ErrorAction Stop).id
                }
                catch {
                    Write-Verbose "`n`nTiMe error!`n$($_.Exception.Message)`n"
                }
                if ($ch_id) {
                    # message
                    $msg = "``DSC config on [$pc_name] complete``"
                    $body = @{channel_id=$ch_id;message=$msg} | ConvertTo-Json
                    Invoke-RestMethod -Uri $url_message -Method POST -Body $body @invokeParam
                }
            }
            #
            GetScript = {
                # Do Nothing
            }
        }
    }
}
$Machine | %{Example_Prod_config -Machine $_ -OutputPath C:\MOF\Example_Prod}
Start-DscConfiguration -Path C:\MOF\Example_Prod\ -Wait -verbose -Force

# Выключаем автоматическую перезагрузку хостов
Configuration LCMConfig{
    param(
        [Parameter(Mandatory)]  $Machine
        )
    Import-DscResource -ModuleName PsDesiredStateConfiguration
    Node $Machine{
        LocalConfigurationManager{
            ConfigurationMode   =  "ApplyAndAutoCorrect"
            ConfigurationModeFrequencyMins = 15
            RefreshMode    = "Push"
            RebootNodeIfNeeded    = $false
        }
    }
}
# Перезаписываем индивидуальные конфиги для каждого хоста
$Machine | %{LCMConfig -Machine $_ -OutputPath C:\MOF\Example_Prod\LCM}
# Отправляем обновленные конфиги на эти хосты
$machine | %{Set-DscLocalConfigurationManager -Path C:\MOF\Example_Prod\LCM -Verbose -ComputerName $_ -Force}


# Чистим хвосты после установки
foreach($a In $Machine){
    $Session = New-CimSession -ComputerName "$a"
    Stop-DscConfiguration -CimSession $Session
}
foreach($a In $Machine){
    $Session = New-CimSession -ComputerName "$a"
    Remove-DscConfigurationDocument -Stage Current, Pending, Previous -CimSession $Session
}
# Удаляем конфиги с заливочного хоста
Get-ChildItem -Recurse "C:\MOF\Example_Prod\" -Filter "*.mof" | Remove-Item -Force -Confirm:$false