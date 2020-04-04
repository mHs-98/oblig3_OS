#min løsning til oppagve 13_10c
#author: Mahamed H Said NTNU GJØVIK BITSEC

$driveletter=$((Get-Item $args[0]).PSDrive.Name + ':') # Finner driveletter for bruk i freespace og disksize senere
# Teller antall filer i folderen. Går ut fra at det ikke er noe subdirectorier
$files=$(Get-ChildItem $args[0] | Measure-Object | %{$_.Count}) 
          # Finner fult barnenavn og filstørrelse på den største filen
         #sorterer synkende rekkefølge, og velger ut(select) den først-->den største!
$filesize=$("{0:n2}" -f (Get-ChildItem -Recurse $args[0] | Sort Length -desc | Select -First 1 | Select-Object Fullname, @{Name="Mbytes";Expression={$_.Length / 1Mb}})) 
        # Finner gjennomsnittlig filstørrelse i den gitten folderen + subfolders
        #gci->Get-ChildItem (alias)
$averagefileSize=$("{0:n2}" -f ((gci $args[0] -Recurse | Measure-Object -property length -sum).sum /1mb) + "MB") 
                # Finner ledig plass på disken ved å differensen mellom 
$freespace=$("{0:n2}" -f (( Get-WmiObject Win32_logicaldisk | Where-Object { $_.DeviceID -eq $driveletter } | Measure-Object -property Freespace -sum).sum /1gb) + "GB") 
            # Finner total plass på disken
$disksize=$("{0:n2}" -f (( Get-WmiObject Win32_logicaldisk | Where-Object { $_.DeviceID -eq $driveletter } | Measure-Object -property Size -sum).sum /1gb) + "GB") 


Write-Output " "
Write-Output "Mappen finnes paa $($driveletter). Det er $freespace ledig av totalt $($disksize)"
Write-Output "Det finnes $($files) filer."
Write-Output "Den stoerste filen er $filesize."
Write-Output "Gjennomsnittlig filstoerrelse er: $averagefileSize."
