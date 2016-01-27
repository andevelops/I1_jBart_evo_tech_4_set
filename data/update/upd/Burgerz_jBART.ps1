$curDir = $MyInvocation.MyCommand.Definition | split-path -parent
$Url = "https://github.com/BurgerZ/jBART/archive/master.zip"
$Path = "$curDir\Downloads\Burgerz_jBART_upd.zip" 
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($url,$path)