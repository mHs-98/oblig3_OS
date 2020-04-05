#min løsning til oppgave 13.10b i opsys
#author: Mahamed H Said NTNU GJøvik Bitsec
#faar tak i alle kjørende proseser der det inneholder "chrome" og teller traader
 Get-Process chrome | ForEach-Object { Write-Output "chrome $($_.Id) $($_.Threads.Count)" }
