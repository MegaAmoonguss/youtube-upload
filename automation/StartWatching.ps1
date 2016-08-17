### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "%USERPROFILE%\Videos\YoutubeUpload"
    $watcher.Filter = "*.mp4"
    $watcher.IncludeSubdirectories = $false
    $watcher.EnableRaisingEvents = $true  

### DEFINE ACTIONS AFTER A EVENT IS DETECTED
    $action = { $path = $Event.SourceEventArgs.FullPath
				cmd.exe /c "%USERPROFILE%\Desktop\youtube-upload-master\bin\youtube-upload --title=`"Automated test $(Get-Date)`" $path"
              }    
### DECIDE WHICH EVENTS SHOULD BE WATCHED + SET CHECK FREQUENCY  
    $created = Register-ObjectEvent $watcher "Created" -Action $action
    while ($true) {sleep 5}