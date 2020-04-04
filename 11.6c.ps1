#løsning til oppgave 11.6c i opsys
#author: Mahamed H Said NTNU GJØVIK BITSEC

function menu(){

    Write-Output "
    1 - Hvem er jeg og hva er navnet på dette scriptet? `n
    2 - Hvor lenge er det siden siste boot? `n
    3 - Hvor mange prosesser og tråder finnes? `n
    4 - Hvor mange context switcer fant sted siste sekund? `n
    5 - Hvor stor andel av CPU-tiden ble benyttet i kernelmode og i usermode siste sekund? `n
    6 - Hvor mange interrupts fant sted siste sekund? `n
    9 - Avslutt dette scriptet `n
    Velg en funksjon: "
}
        function hvemerJeg(){
        $bruker=$env:bruker
    $scriptNavn = $MyInvocation.MyCommand.ScriptName
    Write-Output"Jeg er $bruker, og navnet paa dette scriptet er $scriptNavn" 
   }           
 function oppeTid(){
    $os=Get-CimInstance win32_operatingsystem
	$uptime=(Get-Date) - $os.lastbootuptime
	Write-Output "Oppetid: $($uptime.Days) dager, $($uptime.Hours) timer, $($uptime.Minutes) minutter"
 }
 function prosseser(){
    $antProsesser = (get-process).Count
	$antTraader = (Get-Process).Threads.Count
     Write-Output"Det finnes $antProsesser prosseser og $antTraader tråder" }
 function context(){
    $context=(Get-Counter "\System\Context Switches/sec").CounterSamples.CookedValue
    Write-Output "Det var $context context switches siste sekund"
 }

 function cpuTid() {
    $kernelMode = (Get-Counter -Counter "\Processor(_total)\% Privileged Time").CounterSamples.CookedValue
    $userMode = (Get-Counter -Counter "\Processor(_total)\% User Time").CounterSamples.CookedValue
    Write-Output "Av den totale CPU tiden ble $kernelMode % av tiden brukt i kernelmode og $userMode % av tiden brukt i usermode"

 }

 function interrupts(){
    $antInterupts = (Get-Counter "\Processor(_total)\Interrupts/sec").CounterSamples.CookedValue
    Write-Output "Det var $antInterupts interrupts siste sekund"
 }

 do {
    menu
    $cmd = Read-Host
    switch($cmd) {
        1 { hvemerJeg;break }
        2 { oppeTid; break }
        3 { prosseser; break }
        4 { context; break}
        5 { cpuTime; break}
        6 { interrupts; break}
        9 { break }
    }
    } while ($cmd -ne 9)
