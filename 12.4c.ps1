#min løsning paa oppgave 12.4c i opsys
#author: Mahamed H Said NTNU GJØVIK BITSEC
foreach ($id in $args) {
    # variabel som holder info som skal skriver til fil etterhvert
    $info
    $info += "*********** Minne info om prosess med PID $id"
    #newline
    $info+="`n"
    $info += "Virtual Memory Size: $($(Get-Process -Id $id).VM) byte(s)"
    #newline
    $info+="`n"
    $info += "Working Set Size: $($(Get-Process -Id $id).WS) byte(s)"
    # lager filnavn: mix av prosessnummer etterfulgt av ".meminfo
    $filNavn = "$($id)_$(Get-Date -format 'yyyyMMdd').meminfo"
    # skriv til fil
    $info | Out-File $filNavn
}