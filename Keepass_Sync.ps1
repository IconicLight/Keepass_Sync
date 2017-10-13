#File Path
$MainDropbox = "C:\Users\Kyle\Dropbox\Crypted\Main.kdbx"
$MainOneDrive = "C:\Users\Kyle\OneDrive\Main.kdbx"
$MainGoogleDrive = "C:\Users\Kyle\Google Drive\Main.kdbx"

#Create SHA512 Hash for Main File
$HashMainDropbox = (Get-FileHash -Path $MainDropbox -Algorithm SHA512).hash
$HashMainOneDrive = (Get-FileHash -Path $MainOneDrive -Algorithm SHA512).hash
$HashMainGoogleDrive = (Get-FileHash -Path $MainGoogleDrive -Algorithm SHA512).hash


    Write-Output "Results from Dropbox:"
    Write-Output "====================="
    $HashMainDropbox | Format-List
    Write-Output " "
    Write-Output "Results from OneDrive:"
    Write-Output "======================"
    $HashMainOneDrive | Format-List
    Write-Output " "
    Write-Output "Results from GoogleDrive:"
    Write-Output "========================="
    $HashMainGoogleDrive | Format-List


    Write-Output " "
    Write-Output "======================"
    Write-Output " "

    
    Write-Output "Results from OneDrive/Dropbox:"
    Write-Output "=============================="
    Compare-Object -Referenceobject $HashMainDropbox -Differenceobject $HashMainOneDrive -IncludeEqual
    Write-Output " "
    Write-Output "Results from GoogleDrive/Dropbox:"
    Write-Output "=================================="
    Compare-Object -Referenceobject $HashMainDropbox -Differenceobject $HashMainGoogleDrive -IncludeEqual

    
    Write-Output " "
    Write-Output "======================"
    Write-Output " "


    If ($HashMainDropbox -eq $HashMainOneDrive) {"Dropbox To OneDrive - No Update Needed"}
    Else {Write-Output "Updating..."($HashMainDropbox -ne $HashMainOneDrive)} 
    
        Get-Item -Path $MainDropbox
        Copy-Item -Path $MainDropbox -Destination $MainOneDrive -Force


    If ($HashMainDropbox -eq $HashMainGoogleDrive) {"Dropbox To GoogleDrive - No Update Needed"}
    Else {Write-Output "Updating..."($HashMainDropbox -ne $HashMainGoogleDrive)}
        
        Get-Item -Path $MainDropbox
        Copy-Item -Path $MainDropbox -Destination $MainGoogleDrive -Force

    Exit