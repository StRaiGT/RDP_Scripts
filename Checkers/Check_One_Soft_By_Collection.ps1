# Скрипт предназначен для проверки наличия одной программы на хостах терминальной коллекции
# В результате отчёт будет выведен в консоль

# Задаём начальные настройки
$FirstBroker = "broker.domain.ru"
$Collection = "CollectionName"

# Задаём критерии поиска
# поиск осуществляется по трём условиям - по имени в реестре, по GUID в реестре, по пути на диске
# если условие не используется, то указать $null
$SoftName = "Package ideaIU_2022.1.3"
$SoftRegName = "IntelliJ IDEA 2022.1.3"
$SoftGuid = $null
$SoftPath = "C:\Program Files\JetBrains\ideaIU 2022.1.3\bin\idea64.exe"

# Получаем список хостов коллекции
$ActiveBroker = (Get-RDConnectionBrokerHighAvailability -ConnectionBroker $FirstBroker).ActiveManagementServer
$Machine = @()
$Machine += (Get-RDSessionHost -ConnectionBroker $ActiveBroker -CollectionName $Collection).SessionHost -join "`n"
$Machine = $Machine -split "`n"
"`nHosts count: " + $Machine.Count

# Инициализируем поиск по полученным хостам (с выгрузкой в консоль)
"`nStart search soft on hosts of collection $Collection"
"Имя хоста`tИмя Пакета`tСтатус установки`tМесто обнаружения"
Invoke-command -computer $Machine -ArgumentList $SoftName, $SoftRegName, $SoftGuid, $SoftPath {
    param($SoftName, $SoftRegName, $SoftGuid, $SoftPath)
#   # Выгружаем реестр
    $ExportRegistry = {
        $UninstallKeys = “HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall”, “HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall”
        New-PSDrive -Name HKU -PSProvider Registry -Root Registry::HKEY_USERS | Out-Null
        $UninstallKeys += Get-ChildItem HKU: -ErrorAction SilentlyContinue | Where-Object { $_.Name -match ‘S-\d-\d+-(\d+-){1,14}\d+$’ } | ForEach-Object { “HKU:\$($_.PSChildName)\Software\Microsoft\Windows\CurrentVersion\Uninstall” }
        if (-not $UninstallKeys) {
            Write-Warning -Message ‘No software registry keys found’ -LogLevel ‘2’
        } 
        else {
            foreach ($UninstallKey in $UninstallKeys) {
                $friendlyNames = @{
                    ‘DisplayName’   = ‘Name’
                    ‘DisplayVersion’ = ‘Version’
                }
                if ($Name) {
                    $WhereBlock = { $_.GetValue(‘DisplayName’) -match $Name }
                } elseif ($Guid) {
                    $WhereBlock = { $_.PsChildName -eq $Guid }
                } else {
                    $WhereBlock = { $_.GetValue(‘DisplayName’) }
                }
                $SwKeys = Get-ChildItem -Path $UninstallKey -ErrorAction SilentlyContinue | Where-Object $WhereBlock
                foreach ($SwKey in $SwKeys) {
                    try {
                        $output = @{ }
                        foreach ($ValName in $SwKey.GetValueNames() | Where-Object { $_ }) {
                            if ($ValName -ne ‘Version’) {
                                Write-Verbose -Message $ValName
                                $output.InstallLocation = ‘’
                                if ($ValName -eq ‘InstallLocation’ -and ($SwKey.GetValue($ValName)) -and (@(‘C:’, ‘C:\Windows’, ‘C:\Windows\System32’, ‘C:\Windows\SysWOW64’) -notcontains $SwKey.GetValue($ValName).TrimEnd(‘\’))) {
                                    $output.InstallLocation = $SwKey.GetValue($ValName).TrimEnd(‘\’)
                                }
                                [string]$ValData = $SwKey.GetValue($ValName)
                                if ($friendlyNames[$ValName]) {
                                    $output[$friendlyNames[$ValName]] = $ValData.Trim()
                                } else {
                                    $output[$ValName] = $ValData.Trim()
                                }
                            }
                        }
                        $output.GUID = ‘’
                        if ($SwKey.PSChildName -match ‘\b[A-F0-9]{8}(?:-[A-F0-9]{4}){3}-[A-F0-9]{12}\b’) {
                            $output.GUID = $SwKey.PSChildName
                        }
                        New-Object –TypeName PSObject -Property $output
                        Write-Output “----------------”
                        Write-Output “”
                    } catch {
                        Write-Error -Message $_.Exception.Message
                    }
                }
            }
        }
    }
    $Registry = Invoke-Command -ScriptBlock $ExportRegistry
    sleep(1)

#   # Поиск и вывод результата
    $SearchStatus = $false
    $PlaceFind = ""  
    foreach ($_ in $Registry) {
        if (($SoftRegName -ne $null) -and ($_.Name -eq $SoftRegName)) {
            $SearchStatus = $true
            $PlaceFind += " Registry"
            break
        }
        if (($SoftGuid -ne $null) -and ($_.GUID -eq $SoftGuid)) {
            $SearchStatus = $true
            $PlaceFind += " GUID"
            break
        }
    }
    if (($SoftPath -ne $null) -and (test-Path $SoftPath)) {
        $SearchStatus = $true
        $PlaceFind += " Path"
    }

    $ENV:COMPUTERNAME + "`t" + $SoftName + "`t" + $SearchStatus + "`t" + $PlaceFind
}
"Finish scanning !`n"
