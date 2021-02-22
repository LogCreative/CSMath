Get-ChildItem . 'P*.tex' -Force -Recurse | ForEach-Object -Process {

    $file = [io.Path]::Combine($_.DirectoryName, $_.FullName)

    (Get-Content $file)|
        ForEach-Object { $_ -replace '−','-'} |      # Change MINUS symbol
        Out-File $file -Force                        # Output the file

}