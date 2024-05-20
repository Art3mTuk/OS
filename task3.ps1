param(
    [string]$oldWord = Read-Host "Введите слово для замены",
    [string]$newWord = Read-Host "Введите новое слово",
    [string]$directory = Read-Host "Введите путь к папке с текстовыми файлами"
)

$modifiedFiles = @()

Get-ChildItem -Path $directory -Filter *.txt | ForEach-Object {
    $fileContent = Get-Content $_.FullName
    if ($fileContent -match $oldWord) {
        $fileContent = $fileContent -replace $oldWord, $newWord
        Set-Content -Path $_.FullName -Value $fileContent
        $modifiedFiles += $_.FullName
    }
}

$modifiedFiles | Out-File modified_files.txt

Write-Host "Замена слова '$oldWord' на '$newWord' выполнена."
Write-Host "Список измененных файлов сохранен в файле 'modified_files.txt'."
