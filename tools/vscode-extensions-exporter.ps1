param (
    [string]$ProfileName = ""
)

# Prompt for profile name if not provided
if ([string]::IsNullOrEmpty($ProfileName)) {
    $ProfileName = Read-Host "Enter the VSCode profile name (leave blank for default)"
}

# Prepare .vscode folder
$vscodeFolder = ".vscode"
if (!(Test-Path $vscodeFolder)) {
    New-Item -ItemType Directory -Path $vscodeFolder | Out-Null
}

# Build command based on whether profile is specified
if ([string]::IsNullOrEmpty($ProfileName)) {
    $extensions = code --list-extensions
    $ProfileName = "default"
} else {
    $extensions = code --profile "$ProfileName" --list-extensions
}

# Check if extensions were retrieved
if (!$extensions -or $extensions.Count -eq 0) {
    Write-Host "Failed to retrieve extensions for the specified profile. Please check the profile name." -ForegroundColor Yellow
    exit
}

# Create extensions.json
$json = @{
    recommendations = $extensions
} | ConvertTo-Json -Depth 2

$extensionsJsonPath = Join-Path $vscodeFolder "extensions.json"
$json | Set-Content -Path $extensionsJsonPath -Encoding utf8

# Create install-extensions.sh (Linux-compatible install script)
$installScriptPath = Join-Path $vscodeFolder "install-extensions.sh"
$installCommands = $extensions | ForEach-Object { "code --install-extension $_" }
$scriptLines = @("#!/bin/bash") + $installCommands

$utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($false)
$writer = New-Object System.IO.StreamWriter($installScriptPath, $false, $utf8NoBomEncoding)
foreach ($line in $scriptLines) {
    $writer.Write($line + "`n")
}
$writer.Close()

Write-Host "Extensions for profile [$ProfileName] have been exported to:"
Write-Host " - $extensionsJsonPath"
Write-Host " - $installScriptPath"
