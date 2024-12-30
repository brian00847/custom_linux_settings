function Copy-NLastModifiedFilesUsingSCP {
    param (
        [string]$sourceDir,
        [string]$destinationHost,
        [string]$destinationUser,
        [string]$destinationPath,
        [int]$n_files
    )

    # Get the last n_files modified files from the source directory
    $files = Get-ChildItem -Path $sourceDir -File | Sort-Object -Property LastWriteTime -Descending | Select-Object -First $n_files

    # Construct the SCP remote path
	#$remotePath = "${destinationUser}@${destinationHost}:`"$destinationPath`""
	

	#
	foreach ($file in $files) {
		$localFilePath = $file.FullName
		#$remotePath = "bh@192.168.1.181:/tmp/"
		#$remotePath = "${destinationUser}@192.168.1.181:/tmp/"
		#$remotePath = "${destinationUser}@${destinationHost}:/tmp/"
		$remotePath = "${destinationUser}@${destinationHost}:${destinationPath}"
		
		$scpCommand = "scp `"$localFilePath`" `"$remotePath`""
		Write-Host $scpCommand
		Invoke-Expression $scpCommand
		break
	}
	return
    # Copy each file to the remote destination using scp
	
    foreach ($file in $files) {
        $localFilePath = $file.FullName
        $remoteFilePath = "$remotePath/`"$($file.Name)`""

        # Construct scp command
        $scpCommand = "scp `"$localFilePath`" `"$remoteFilePath`""
        
        # Execute the scp command
        Invoke-Expression $scpCommand
        Write-Host "Copied '$localFilePath' to '$remoteFilePath'"
    }
}

function Copy-NLastModifiedFilesUsingSCP2 {
    param (
        [string]$sourceDir,
        [string]$destinationPath,
        [int]$n_files
    )

    # Get the last n_files modified files from the source directory
    $files = Get-ChildItem -Path $sourceDir -File | Sort-Object -Property LastWriteTime -Descending | Select-Object -First $n_files

    # Construct the SCP remote path
	#$remotePath = "${destinationUser}@${destinationHost}:`"$destinationPath`""
	

	#
	foreach ($file in $files) {
		$localFilePath = $file.FullName
		#$remotePath = "bh@192.168.1.181:/tmp/"
		#$remotePath = "${destinationUser}@192.168.1.181:/tmp/"
		#$remotePath = "${destinationUser}@${destinationHost}:/tmp/"
		#$remotePath = "${destinationUser}@${destinationHost}:${destinationPath}"
		Write-Host `"$destinationPath`"
		$scpCommand = "scp `"$localFilePath`" `"$destinationPath`""
		Write-Host $scpCommand
		Invoke-Expression $scpCommand
		#break
	}
	return
}
# Example usage:
# Copy-NLastModifiedFiles -sourceDir "C:\YourSourceDirectory" -destinationHost "remoteHostName" -destinationPath "SharedFolder\DestinationDirectory" -n_files 10
$srcDir = "C:\Users\brian\OneDrive\Pictures\Screenshots"
$remoteHost = "192.168.1.181"
$destinationPath = "/tmp/"

#Copy-NLastModifiedFilesUsingSCP -sourceDir $srcDir -destinationHost $remoteHost  -destinationUser "bh" $remoteHost -destinationPath $destinationPath -n_files 3 
#Copy-NLastModifiedFilesUsingSCP2 -sourceDir $srcDir -destinationPath "bh@192.168.1.181:/tmp/" -n_files 3 



# Example usage:
# Monitor-And-CopyNewFiles -sourceDir "C:\YourSourceDirectory" -scpDestination "username@remoteHost:/remote/directory/path"
#Monitor-And-CopyNewFiles -sourceDir $srcDir -destinationPath "bh@192.168.1.181:/tmp/"

function Monitor-And-ScpNewFiles {
    param (
        [string]$sourceDir,
        [string]$destinationPath
    )

    while ($true) {
        try {
            # Get all files in the directory that were modified within the last 10 seconds
            $currentDate = Get-Date
            $files = Get-ChildItem -Path $sourceDir -File | Where-Object {
                $_.LastWriteTime -gt $currentDate.AddSeconds(-10)
            }

            # Copy each file to the destination
            foreach ($file in $files) {
                $localFilePath = $file.FullName
                $scpCommand = "scp `"$localFilePath`" `"$destinationPath`""
                Write-Host "Executing: $scpCommand"
                Invoke-Expression $scpCommand
                Write-Host "Copied '$localFilePath' to '$destinationPath'"
            }
        } catch {
            Write-Error "An error occurred: $_"
        }
        
        # Wait for 5 seconds before the next check
        Start-Sleep -Seconds 5
    }
}

# Example usage:
# Monitor-And-ScpNewFiles -sourceDir "C:\Path\To\Watch" -destinationPath "username@remoteHost:/path"

Monitor-And-ScpNewFiles -sourceDir $srcDir -destinationPath "bh@192.168.1.181:/tmp/"



