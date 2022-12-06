# Скрипт предназначен для выявления аномалий в наборе программного обеспечения, установленного на хостах терминальной коллекции
# В результате будет создан файл с отчётом
# При желании, скрипт можно масштабировать на все коллекции

# Задаём начальные настройки и создаём/обнуляем файл с отчётом
$FirstBroker = "broker.domain.ru"
$Collection = "CollectionName"
$LogServerName = "LogServerName"
$LogFile = "\\$LogServerName\Logs\search_soft\$Collection.txt"
"Имя хоста`tИмя Пакета`tСтатус установки`tМесто обнаружения" > $LogFile

# Получаем список хостов коллекции
$ActiveBroker = (Get-RDConnectionBrokerHighAvailability -ConnectionBroker $FirstBroker).ActiveManagementServer
$Machine = @()
$Machine += (Get-RDSessionHost -ConnectionBroker $ActiveBroker -CollectionName $Collection).SessionHost -join "`n"
$Machine = $Machine -split "`n"
"`nHosts count: " + $Machine.Count

# Инициализируем поиск по полученным хостам (с выгрузкой в файл)
"`nStart search soft on collection $Collection"
Invoke-command -computer $Machine >> $LogFile {
#   # Наполняем библиотеку ПО
    # поиск осуществляется по трём условиям - по имени в реестре, по GUID в реестре, по пути на диске
    # если условие не используется, то указать $null
    $Library = @()

    $Library += @{
        SoftName="Package ZipInstall"; 
        SoftRegName="7-Zip 19.00 (x64 edition)"; 
        SoftGUID="{23170F69-40C1-2702-1900-000001000000}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package jdk-7u76x64"; 
        SoftRegName="Java SE Development Kit 7 Update 76 (64-bit)"; 
        SoftGUID="{64A3A4F4-B792-11D6-A78A-00B0D0170760}"; 
        SoftPath="C:\Program Files\Java\jdk1.7.0_76"
    }
    $Library += @{
        SoftName="Package jre-8u121x86"; 
        SoftRegName="Java 8 Update 121"; 
        SoftGUID="{26A24AE4-039D-4CA4-87B4-2F32180121F0}"; 
        SoftPath="C:\Program Files (x86)\Java\jre1.8.0_121"
    }
    $Library += @{
        SoftName="Package jre-8u121x64"; 
        SoftRegName="Java 8 Update 121 (64-bit)"; 
        SoftGUID="{26A24AE4-039D-4CA4-87B4-2F64180121F0}"; 
        SoftPath="C:\Program Files\Java\jre1.8.0_121"
    }
    $Library += @{
        SoftName="Package jre-8u211x32"; 
        SoftRegName="Java 8 Update 211"; 
        SoftGUID="{26A24AE4-039D-4CA4-87B4-2F32180211F0}"; 
        SoftPath="C:\Program Files (x86)\Java\jre1.8.0_211"
    }
    $Library += @{
        SoftName="Package jre-8u211x64"; 
        SoftRegName="Java 8 Update 211 (64-bit)"; 
        SoftGUID="{26A24AE4-039D-4CA4-87B4-2F64180211F0}"; 
        SoftPath="C:\Program Files\Java\jre1.8.0_211"
    }
    $Library += @{
        SoftName="Package jdk-8u121x32"; 
        SoftRegName="Java SE Development Kit 8 Update 121"; 
        SoftGUID="{32A3A4F4-B792-11D6-A78A-00B0D0180121}"; 
        SoftPath="C:\Program Files (x86)\Java\jdk1.8.0_121"
    }
    $Library += @{
        SoftName="Package jdk-8u121x64"; 
        SoftRegName="Java SE Development Kit 8 Update 121 (64-bit)"; 
        SoftGUID="{64A3A4F4-B792-11D6-A78A-00B0D0180121}"; 
        SoftPath="C:\Program Files\Java\jdk1.8.0_121"
    }
    $Library += @{
        SoftName="Package jdk-11.0.6x64"; 
        SoftRegName="Java(TM) SE Development Kit 11.0.6 (64-bit)"; 
        SoftGUID="{FB40F6A5-6A0A-5685-8579-2605295B7BFD}"; 
        SoftPath="C:\Program Files\Java\jdk-11.0.6"
    }
    $Library += @{
        SoftName="Script jdk-17.0.2x64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Java\jdk-17.0.2"   
    }
    $Library += @{
        SoftName="Script install_ora_11_32"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\app\client\product_32\11.2.0\client_1\BIN\orabase.exe"
    }
    $Library += @{
        SoftName="Script symlink_ora_11_32"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Windows\SysWOW64\ora11"
    }
    $Library += @{
        SoftName="Script install_ora_11_64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\app\client\product_64\11.2.0\client_1\BIN\orabase.exe"
    }
    $Library += @{
        SoftName="Script symlink_ora_11_64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Windows\System32\ora11"
    }
    $Library += @{
        SoftName="Script install_ora_18_32"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\app\client\product_32\18.0.0\client_1\BIN\orabase.exe"
    }
    $Library += @{
        SoftName="Script symlink_ora_18_32"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Windows\SysWOW64\ora18"
    }
    $Library += @{
        SoftName="Script install_ora_18_64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\app\client\product_64\18.0.0\client_1\BIN\orabase.exe"
    }
    $Library += @{
        SoftName="Script symlink_ora_18_64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Windows\System32\ora18"
    }
    $Library += @{
        SoftName="Script install_ora_19_32"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\app\client\product_32\19.0.0\client_1\BIN\orabase.exe"
    }
    $Library += @{
        SoftName="Script symlink_ora_19_32"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Windows\SysWOW64\ora19"
    }
    $Library += @{
        SoftName="Script install_ora_19_64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\app\client\product_64\19.0.0\client_1\BIN\orabase.exe"
    }
    $Library += @{
        SoftName="Script symlink_ora_19_64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Windows\System32\ora19"
    }
    $Library += @{
        SoftName="File tns_for_ora"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\app\tnsnames\tnsnames.ora"
    }
    $Library += @{
        SoftName="Package PlSql_12_x64"; 
        SoftRegName="PLSQL Developer 12 (64 bit)"; 
        SoftGUID="{CEB3DF70-E7A1-4613-97B9-7B9909A57056}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package PlSql_13_x32"; 
        SoftRegName="PLSQL Developer 13 (32 bit)"; 
        SoftGUID="{6151877C-5C0B-4431-9992-0D7F381C2B94}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script SQL_Developer"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\ProgramData\sqldeveloper\sqldeveloper.exe"
    }
    $Library += @{
        SoftName="Package 1C_x86_x64_8.3.20.1710"; 
        SoftRegName="1С:Предприятие 8 (x86-64) (8.3.20.1710)"; 
        SoftGUID="{8B8B203F-7C03-489E-AABD-C4EB3E39271C}"; 
        SoftPath="C:\Program Files\1cv8\8.3.20.1710\bin\1cv8.exe"
    }
    $Library += @{
        SoftName="Package DataGrip_2022.1.3"; 
        SoftRegName="DataGrip 2022.1.3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\JetBrains\DataGrip 2022.1.3\bin\datagrip64.exe"
    }
    $Library += @{
        SoftName="File DriversForPL"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\DataGrip Drivers"
    }
    $Library += @{
        SoftName="Package ideaIC_2021.3.3"; 
        SoftRegName="IntelliJ IDEA Community Edition 2021.3.3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\JetBrains\ideaIC 2021.3.3\bin\idea64.exe"
    }
    $Library += @{
        SoftName="Package ideaIU_2021.3.3"; 
        SoftRegName="IntelliJ IDEA 2021.3.3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\JetBrains\ideaIU 2021.3.3\bin\idea64.exe"
    }
    $Library += @{
        SoftName="Package PhpStorm_2021.3.3"; 
        SoftRegName="PhpStorm 2021.3.3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\JetBrains\PhpStorm 2021.3.3\bin\phpstorm64.exe"
    }
    $Library += @{
        SoftName="Package WebStorm_2021.3.3"; 
        SoftRegName="WebStorm 2021.3.3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\JetBrains\WebStorm 2021.3.3\bin\webstorm64.exe"
    }
    $Library += @{
        SoftName="Package PycharmC_2021.3.3"; 
        SoftRegName="PyCharm Community Edition 2021.3.3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\JetBrains\PycharmC 2021.3.3\bin\pycharm64.exe"
    }
    $Library += @{
        SoftName="Package PycharmP_2021.3.3"; 
        SoftRegName="PyCharm 2021.3.3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\JetBrains\PycharmP 2021.3.3\bin\pycharm64.exe"
    }
    $Library += @{
        SoftName="Package SimbaSpark_x64"; 
        SoftRegName="Simba Spark ODBC Driver 64-bit"; 
        SoftGUID="{74534B3E-7D37-4436-9C4E-2D80B45056DA}"; 
        SoftPath="C:\Program Files\Simba Spark ODBC Driver\lib\SparkODBC_sb64.dll"
    }
    $Library += @{
        SoftName="Package clickhouse_odbc_x64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\clickhouse-odbc\bin\clickhouseodbc.dll"
    }
    $Library += @{
        SoftName="Package psqlODBC_x64"; 
        SoftRegName="psqlODBC_x64"; 
        SoftGUID="{8D39D446-9952-41E4-8337-60F5AFB3361D}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script install_Progress_DataDirect_Connect_x64"; 
        SoftRegName="Progress DataDirect Connect64 ® and Connect64 XE for ODBC 7.1 SP6"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Progress\DataDirect\Connect64_for_ODBC_71\jre\bin\java.exe"
    }
    $Library += @{
        SoftName="Package DBeaver_7_x64"; 
        SoftRegName="DBeaver 7.0.0"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\DBeaver_7\dbeaver.exe"
    }
    $Library += @{
        SoftName="File DBeaver_7_x64_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\DBeaver 7.0.0.lnk"
    }
    $Library += @{
        SoftName="Package DBeaver_21_x64"; 
        SoftRegName="DBeaver 21.0.2"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\DBeaver_21\dbeaver.exe"
    }
    $Library += @{
        SoftName="File DBeaver_21_x64_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\DBeaver 21.0.2.lnk"
    }
    $Library += @{
        SoftName="Package msxml_install"; 
        SoftRegName="MSXML 4.0 SP2 Parser and SDK"; 
        SoftGUID="{716E0306-8318-4364-8B8F-0CC4E9376BAC}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script disk_X"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\disk_x.lnk"
    }
    $Library += @{
        SoftName="File Inversia_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\ЦАБС Банк XXI ВЕК.lnk"
    }
    $Library += @{
        SoftName="File Inversia_plsql"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\PLSQL_dev\plsqldev(J0.exe"
    }
    $Library += @{
        SoftName="File Inversia_plsql_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\plsqldev(J0 — ярлык.lnk"
    }
    $Library += @{
        SoftName="Package TSYS_Library_1200"; 
        SoftRegName="TSYS Card Tech Base Class Library 1.2.0.0"; 
        SoftGUID="{9A3BF1BF-6981-4458-ACCD-F8F4E85ADB54}"; 
        SoftPath="C:\Program Files (x86)\TSYS Card Tech\TSYS Card Tech Base Class Library 1.2.0.0\CTL.COM.dll"
    }
    $Library += @{
        SoftName="Package TSYS_Library_4520"; 
        SoftRegName="TSYS Card Tech Base Class Library 4.5.2.0"; 
        SoftGUID="{A67D17FD-B56D-41DE-80C2-09E9232BE0BA}"; 
        SoftPath="C:\Program Files (x86)\TSYS Card Tech\TSYS Card Tech Base Class Library 4.5.2.0\CTL.COM.dll"
    }
    $Library += @{
        SoftName="Package PJA_old_client"; 
        SoftRegName="PRIME 4 Jobs Administrator"; 
        SoftGUID="{46C88EF1-472E-4AFC-BB1A-8FF0BFE2E375}"; 
        SoftPath="C:\Program Files (x86)\TSYS Card Tech\PRIME 4\PRIME 4 Jobs Administrator\PRIME Jobs Administrator.exe"
    }
    $Library += @{
        SoftName="Script PJA_client_copy"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\TSYS Card Tech\PRIME 4\PRIME Jobs Administrator ACQ\PRIME Jobs Administrator.exe"
    }
    $Library += @{
        SoftName="Script PJA_new"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\TSYS Card Tech\PRIME 4\Prime Jobs Administrator_NEW\\PRIME Jobs Administrator.exe"
    }
    $Library += @{
        SoftName="Script PJA_user_env"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\temp\PJA_user_env.exe"
    }
    $Library += @{
        SoftName="Package MS_Office_2019_Pro_RU-RU"; 
        SoftRegName="Microsoft Office Professional Plus 2019 - ru-ru"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package MS_Office_2019_Pro_RU-EN"; 
        SoftRegName="Microsoft Office Professional Plus 2019 - en-us"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package VS_Code"; 
        SoftRegName=$null; 
        SoftGUID="{EA457B21-F73E-494C-ACAB-524FDE069978}_is1"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="File Chrome_v67_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\Google_v67\Chrome\Application\chrome_v67.exe"
    }
    $Library += @{
        SoftName="File Chrome_v67_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\chrome_v67.lnk"
    }
    $Library += @{
        SoftName="File Chrome_v78_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\Google_v78\Chrome\Application\chrome.exe"
    }
    $Library += @{
        SoftName="File Chrome_v78_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\chrome_v78.lnk"
    }
    $Library += @{
        SoftName="File Firefox_v99_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Mozilla_Firefox_v99\firefox.exe"
    }
    $Library += @{
        SoftName="File Firefox_v99_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\Firefox_v99.lnk"
    }
    $Library += @{
        SoftName="Package Opera_85"; 
        SoftRegName="Opera Stable 85.0.4341.60"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Opera\85.0.4341.60\opera.exe"
    }
    $Library += @{
        SoftName="Package MS_Edge"; 
        SoftRegName="Microsoft Edge"; 
        SoftGUID="{04D00D5B-67FB-32B4-8D2E-13BED1C029FA}"; 
        SoftPath="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    }
    $Library += @{
        SoftName="Script NICE_WFM_4_6_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\NICE_IEX_WFM\totalview\ttv40.exe"
    }
    $Library += @{
        SoftName="Script NICE_WFM_6_5_6_0_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\NICE_WFM\wfm\wfm.exe"
    }
    $Library += @{
        SoftName="Package AcroRdr_2017"; 
        SoftRegName="Adobe Acrobat Reader 2017 MUI"; 
        SoftGUID="{AC76BA86-7AD7-FFFF-7B44-AE1108756300}"; 
        SoftPath="C:\Program Files (x86)\Adobe\Acrobat Reader 2017\Reader\AcroRd32.exe"
    }
    $Library += @{
        SoftName="Package FoxitReader"; 
        SoftRegName="Foxit Reader"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package jprofiler"; 
        SoftRegName="JProfiler 10.1.2"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\jprofiler10\bin\jprofiler.exe"
    }
    $Library += @{
        SoftName="Package kafkatool_x64"; 
        SoftRegName="Kafka Tool 2 2.0.7"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\kafkatool2\kafkatool.exe"
    }
    $Library += @{
        SoftName="Package KDiff3"; 
        SoftRegName="KDiff3 (remove only)"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\KDiff3\kdiff3.exe"
    }
    $Library += @{
        SoftName="Package KeePass_2.50"; 
        SoftRegName="KeePass Password Safe 2.50"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package KeyStore_Explorer"; 
        SoftRegName="KeyStore Explorer"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package k_lite_15"; 
        SoftRegName="K-Lite Codec Pack 15.9.0 Full"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package Lightshot"; 
        SoftRegName="Lightshot-5.2.1.1"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\Skillbrains\lightshot\5.2.1.1\Lightshot.exe"
    }
    $Library += @{
        SoftName="Package mRemoteNG"; 
        SoftRegName=$null; 
        SoftGUID="{381B1560-3850-4E80-BD01-781486364F7B}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package mysql_workbench_8"; 
        SoftRegName="MySQL Workbench 8.0 CE"; 
        SoftGUID="{6129E3AD-632C-4574-8575-653D9B4FF7C8}"; 
        SoftPath="C:\Program Files\MySQL\MySQL Workbench 8.0 CE\MySQLWorkbench.exe"
    }
    $Library += @{
        SoftName="Package NetBeans_7"; 
        SoftRegName="NetBeans IDE 7.0.1 RC1"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\NetBeans 7.0.1 RC1\bin\netbeans.exe"
    }
    $Library += @{
        SoftName="Package NetBeans_8"; 
        SoftRegName="NetBeans IDE 8.2"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\NetBeans 8.2\bin\netbeans.exe"
    }
    $Library += @{
        SoftName="Package Node_js_16.14.2"; 
        SoftRegName=$null; 
        SoftGUID="{109CCDA4-00DC-440A-822B-967CCF889A25}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package Notepad_x64"; 
        SoftRegName="Notepad++ (64-bit x64)"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Notepad++\notepad++.exe"
    }
    $Library += @{
        SoftName="File Notepad_Plugin_Compare"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Notepad++\plugins\ComparePlugin\ComparePlugin.dll"
    }
    $Library += @{
        SoftName="Script install_AginityGreenplum"; 
        SoftRegName="Aginity Workbench for Pivotal Greenplum"; 
        SoftGUID="{C526C8EE-D28C-4B3E-8456-D776B8898C90}"; 
        SoftPath="C:\Program Files\Aginity\Aginity Workbench for Pivotal Greenplum(x64)\Aginity.GreenplumWorkbench.exe"
    }
    $Library += @{
        SoftName="Script Anaconda_2020.11"; 
        SoftRegName="Anaconda3 2020.11 (Python 3.8.5 64-bit)"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="File cx_Oracle_64"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Anaconda3\Scripts\cx_Oracle-8.3.0-cp38-cp38-win_amd64.whl"
    }
    $Library += @{
        SoftName="Package Archi_4.6.0"; 
        SoftRegName="Archi 4.6.0"; 
        SoftGUID="{17490178-4BB9-40A0-A9C4-F82027FF49B8}_is1"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package Avaya_Communicator"; 
        SoftRegName="Avaya one-X® Communicator"; 
        SoftGUID="{6D803607-F4C4-4FB0-8724-3CC1C90732DB}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script eKassir_Monitoring_Studio"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\eKassir\Monitoring\Studio\Monitoring.Studio.exe"
    }
    $Library += @{
        SoftName="Package FARx64"; 
        SoftRegName="Far Manager 3 x64"; 
        SoftGUID="{9285E63A-5C9E-418C-AB01-C5172C307DC3}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package FileZillax64"; 
        SoftRegName="FileZilla Client 3.38.1"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package Gitx64"; 
        SoftRegName="Git version 2.29.1"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package Groovy"; 
        SoftRegName="Groovy-2.5.5"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\Groovy\Groovy-2.5.5\bin\groovy.exe"
    }
    $Library += @{
        SoftName="Package HikCentral_distr"; 
        SoftRegName=$null; 
        SoftGUID="{D74979FF-25BB-4E43-8633-5E9D9C57FFF9}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script HikCentral_langpack"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\HikCentral\Client\lp.txt"
    }
    $Library += @{
        SoftName="File Balsamiq_Mockups_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\Balsamiq Mockups 3\Balsamiq Mockups 3.exe"
    }
    $Library += @{
        SoftName="File Balsamiq_Mockups_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\Balsamiq Mockups 3.lnk"
    }
    $Library += @{
        SoftName="Script Cyberduck"; 
        SoftRegName=$null; 
        SoftGUID="{104EBE8E-905E-48C7-995B-18D3D3CF674F}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package PaintdotNet"; 
        SoftRegName=$null; 
        SoftGUID="{6FED3D93-C0FA-4BD7-A36F-7FC53698244F}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package pgAdmin_4.30_x64"; 
        SoftRegName="pgAdmin 4 version 4.30"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package pgAdmin_4v5_x64"; 
        SoftRegName="pgAdmin 4 version 5.4"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package PuTTY_x64"; 
        SoftRegName="PuTTY release 0.74 (64-bit)"; 
        SoftGUID="{127B996B-5308-4012-865B-9446451EA326}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package RSA_SecurID_Token"; 
        SoftRegName="RSA SecurID Software Token"; 
        SoftGUID="{2F4D61A5-C336-47C8-A2D7-73C760F7EF67}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package s3browser"; 
        SoftRegName="S3 Browser version 8.9.5"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package SoapUI_5.6.0"; 
        SoftRegName="SoapUI 5.6.0"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\SmartBear\SoapUI-5.6.0\bin\SoapUI-5.6.0.exe"
    }
    $Library += @{
        SoftName="Package Sublime_Text_x64"; 
        SoftRegName="Sublime Text 3"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package TableauDesktop_2020.3"; 
        SoftRegName="Tableau 2020.3 (20203.20.0801.1333)"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Tableau\Tableau Desktop 2020.3\bin\tableau.exe"
    }
    $Library += @{
        SoftName="Package TableauReader_2020.3"; 
        SoftRegName="Tableau Reader 2020.3 (20203.20.0801.1333)"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Tableau\Tableau Reader 2020.3\bin\tabreader.exe"
    }
    $Library += @{
        SoftName="Package Jaspersoft_Studio_distr"; 
        SoftRegName="TIBCO Jaspersoft Studio 6.6.0"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\TIBCO\Jaspersoft Studio-6.6.0\Jaspersoft Studio.exe"
    }
    $Library += @{
        SoftName="File Jaspersoft_Studio_plugins"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\TIBCO\Jaspersoft Studio-6.6.0\dropins\eclipse\plugins\ElasticSearchExtension.jar"
    }
    $Library += @{
        SoftName="Package Toad_14_x86"; 
        SoftRegName="Toad for Oracle 14.0 (32-Bit)"; 
        SoftGUID="{C8AC210C-F59E-4B0B-AA52-BA105B5EE146}"; 
        SoftPath="C:\Program Files (x86)\Quest Software\Toad for Oracle 14.0\toad.exe"
    }
    $Library += @{
        SoftName="Package TortoiseGitx64"; 
        SoftRegName="TortoiseGit 2.9.0.0 (64 bit)"; 
        SoftGUID="{E607B142-63C1-4602-9EB9-C8A2B9F162D6}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package TortoiseSVN"; 
        SoftRegName="TortoiseSVN 1.12.0.28568 (64 bit)"; 
        SoftGUID="{35E59371-86FD-45FD-B318-549278DC0D0A}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package tcmdx64"; 
        SoftRegName="Total Commander 64+32-bit (Remove or Repair)"; 
        SoftGUID=$null; 
        SoftPath="C:\totalcmd\TOTALCMD.EXE"
    }
    $Library += @{
        SoftName="File Total_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\TOTALCMD.lnk"
    }
    $Library += @{
        SoftName="Package VNC_Viewer"; 
        SoftRegName="VNC Viewer 6.20.529"; 
        SoftGUID="{DCF5BBEA-3BDB-4E03-BF06-03836F320CA6}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package WinMerge"; 
        SoftRegName="WinMerge 2.16.2.0"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package WinSCPx64"; 
        SoftRegName="WinSCP 5.15.9"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package XMind_ZEN_9"; 
        SoftRegName="XMind ZEN 9.3.1"; 
        SoftGUID="fbd30ee5-8150-549e-9aed-fd9d444364fb"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script Xshell_7"; 
        SoftRegName=$null; 
        SoftGUID="{2C5F58B0-1BF6-4BD3-A665-C1B5206BDC17}"; 
        SoftPath="C:\Program Files (x86)\NetSarang\Xshell 7\xshell.exe"
    }
    $Library += @{
        SoftName="File Postman_9_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Postman\app-9.4.0\Postman.exe"
    }
    $Library += @{
        SoftName="File Postman_9_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\Postman.lnk"
    }
    $Library += @{
        SoftName="File SuperPutty_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\SuperPuTTY-1.4.0.9\SuperPutty.exe"
    }
    $Library += @{
        SoftName="File SuperPutty_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\SuperPutty.lnk"
    }
    $Library += @{
        SoftName="File kubectl"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\kubectl\kubectl.exe"
    }
    $Library += @{
        SoftName="File Gradle_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Temp\Gradle\bin\gradle"
    }
    $Library += @{
        SoftName="File Apache_Maven_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\apache-maven-3.6.1\bin\mvn"
    }
    $Library += @{
        SoftName="File Insomnia_2022.2.1"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Insomnia\app-2022.2.1\Insomnia.exe"
    }
    $Library += @{
        SoftName="File Insomnia_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\Insomnia.lnk"
    }
    $Library += @{
        SoftName="File Issuer_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Temp\Prod\Issuer\Issuer.jar"
    }
    $Library += @{
        SoftName="File Issuer_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\Issuer.lnk"
    }
    $Library += @{
        SoftName="Package BCompare_4"; 
        SoftRegName="Beyond Compare 4.2.6"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package offsetexplorer_64bit"; 
        SoftRegName="Offset Explorer 2 2.1"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="File EveryLang_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\EveryLang\EveryLang.exe"
    }
    $Library += @{
        SoftName="File Consultant_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\CONSULTANT+.lnk"
    }
    $Library += @{
        SoftName="Package XnViewMP"; 
        SoftRegName="XnViewMP 0.97.1"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script Reports_new"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Temp\reports_rdp-farm.bat"
    }
    $Library += @{
        SoftName="Package Wireshark"; 
        SoftRegName="Wireshark 3.4.3 64-bit"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Script BloomRPC"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\bloomrpc\BloomRPC.exe"
    }
    $Library += @{
        SoftName="Package ConEmu"; 
        SoftRegName="ConEmu 201124.x64"; 
        SoftGUID="{4D4317D0-E8A3-47BE-820B-D374867F6EE2}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package EmEditor_21_x64"; 
        SoftRegName=$null; 
        SoftGUID="{3D45BA74-9CCE-4EC1-8BDC-29B80BA6085A}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package Tester"; 
        SoftRegName="Tester 2.200"; 
        SoftGUID=$null; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package 010_Editor_x64"; 
        SoftRegName="010 Editor 12.0.1 (64-bit)"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\010 Editor\010Editor.exe"
    }
    $Library += @{
        SoftName="Package SaS8"; 
        SoftRegName="SAS Enterprise Guide 8.2 (64-bit)"; 
        SoftGUID="{598BCBB6-CD49-4203-BDAF-68A9E7677181}"; 
        SoftPath="C:\Program Files\SASHome\SASEnterpriseGuide\8\SEGuide.exe"
    }
    $Library += @{
        SoftName="File gpg4usb_distr"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\gpg4usb-0.3.3-2\start_windows.exe"
    }
    $Library += @{
        SoftName="File gpg4usb_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\gpg4usb-0.3.3-2.lnk"
    }
    $Library += @{
        SoftName="Package SAS_EG_DI"; 
        SoftRegName="SAS Enterprise Guide 7.1 (64-bit)"; 
        SoftGUID="{42AD9967-08E3-48FB-A5D3-E6DA0674EAB9}"; 
        SoftPath="C:\Program Files\SASHome\SASEnterpriseGuide\7.1\SEGuide.exe"
    }
    $Library += @{
        SoftName="Package Chrome_100"; 
        SoftRegName=$null; 
        SoftGUID="{B24F0A95-6C38-3CA4-AFC8-7BDD38B8C51D}"; 
        SoftPath="C:\Program Files\Google\Chrome\Application\100.0.4896.60\chrome_pwa_launcher.exe"
    }
    $Library += @{
        SoftName="Package ssms"; 
        SoftRegName="Microsoft SQL Server Management Studio - 18.8"; 
        SoftGUID="{9523f5f8-19f1-47d8-928c-358505ab129d}"; 
        SoftPath=$null
    }
    $Library += @{
        SoftName="Package Powershell_7"; 
        SoftRegName="PowerShell 7-x64"; 
        SoftGUID="{D91EDB21-FCD5-45AE-B983-CAFA80899437}"; 
        SoftPath="C:\Program Files\PowerShell\7\pwsh.exe"
    }
    $Library += @{
        SoftName="Script Kliko"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files (x86)\Common Files\Borland Shared\BDE\BDEADMIN.EXE"
    }
    $Library += @{
        SoftName="File ZebraDesigner_3_Dev"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Zebra Technologies\ZebraDesigner 3 for Developers\bin.net\ZebraDesignerForDevelopers.exe"
    }
    $Library += @{
        SoftName="File ZebraDesigner_3_Dev_lnk"; 
        SoftRegName=$null; 
        SoftGUID=$null; 
        SoftPath="C:\Users\Public\Desktop\ZebraDesigner 3 for Developers.lnk"
    }
    $Library += @{
        SoftName="ZebraDesigner_3"; 
        SoftRegName="ZebraDesigner 3"; 
        SoftGUID=$null; 
        SoftPath="C:\Program Files\Zebra Technologies\ZebraDesigner 3\bin.net\ZebraDesigner.exe"
    }

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
    foreach ($element in $Library) {
        $SearchStatus = $false
        $PlaceFind = ""
        foreach ($_ in $Registry) {
            if (($element.SoftRegName -ne $null) -and ($_.Name -eq $element.SoftRegName)) {
                $SearchStatus = $true
                $PlaceFind += " Registry"
                break
            }
            if (($element.SoftGUID -ne $null) -and ($_.GUID -eq $element.SoftGUID)) {
                $SearchStatus = $true
                $PlaceFind += " GUID"
                break
            }
        }
        if (($element.SoftPath -ne $null) -and (test-Path $element.SoftPath)) {
            $SearchStatus = $true
            $PlaceFind += " Path"
        }

        $ENV:COMPUTERNAME + "`t" + $element.SoftName + "`t" + $SearchStatus + "`t" + $PlaceFind
    }
}
"Finish scanning !`n"
#