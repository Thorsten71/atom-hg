hg init $args[0]
set-location $args[0]

("clean_file", "modified_file", "removed_file", "missing_file") | foreach-object {
  new-item -type File $_
  hg add $_
}

new-item -type File "untracked_file"
new-item -type File "ignored_file"

Set-Content -Path "modified_file" -Value @"






"@
hg commit -m "Commit 1 without ignore" -u "Tester <test@test.com>"

Set-Content -Path ".hgignore" -Value @"
syntax:glob
ignored_file
"@
hg add ".hgignore"

Set-Content -Path "modified_file" -Value "Some text."

hg commit -m "Commit 2 with ignore" -u "Tester <test@test.com>"
Set-Content -Path "modified_file" -Value "Changes!"
hg remove "removed_file"
Remove-Item "missing_file"
