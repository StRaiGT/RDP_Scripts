# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Total Commander 64+32-bit (Remove or Repair)"
# $SoftGuid = $null
# $SoftPath = "C:\totalcmd\TOTALCMD.EXE"
Package tcmdx64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Total Commander 64+32-bit (Remove or Repair)"
    Path = "\\server.domain.ru\SOFT\Total Commander\tcmd922ax32_64.exe"
    ProductId = ""
    Arguments = '/AHMGDU'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\TOTALCMD.lnk"
File Total_lnk{
    DependsOn = '[Package]tcmdx64'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Total Commander\TOTALCMD.lnk"
    DestinationPath = "C:\Users\Public\Desktop\TOTALCMD.lnk"
}
