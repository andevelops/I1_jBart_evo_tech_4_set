$curDir = $MyInvocation.MyCommand.Definition | split-path -parent
$Url = "https://github.com/I1PABIJJA/I1_jBart_evo_tech_4_set/archive/master.zip"
$Path = "$curDir\Downloads\I1_jBART_SET_evo_tech_4_upd.zip" 
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($url,$path)