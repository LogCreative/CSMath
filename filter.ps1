Get-ChildItem . '*.tex' -Force -Recurse | ForEach-Object -Process {
    $file = [io.Path]::Combine($_.DirectoryName, $_.FullName)

    (Get-Content $file)|
        ForEach-Object { $_ -replace 'Zilong Li','Log Creative'} |  # Change Name
        ForEach-Object { $_ -replace '518070910095',''} | # Change Number
        Out-File $file -Force
}

Get-ChildItem .\ -recurse *ZilongLi* | ForEach-Object {
    $file = [io.Path]::Combine($_.DirectoryName, $_.FullName)
    Remove-Item $file
}

Get-ChildItem .\ -recurse P*.tex | ForEach-Object -Parallel {
    $file = [io.Path]::Combine($_.DirectoryName, $_.FullName)
    Set-Location $_.DirectoryName
    latexmk -pdf $file -interaction=nonstopmode
}