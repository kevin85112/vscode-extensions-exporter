$ErrorActionPreference = 'Stop' # Ensure script stops on first error

# Get the directory where this script is located
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Define the path to the main PowerShell script
# *** MAKE SURE THIS FILENAME MATCHES YOUR ACTUAL SCRIPT ***
$scriptPath = Join-Path $toolsDir 'vscode-extensions-exporter.ps1'

# Define the command name users will type in the terminal
$commandName = 'vscode-export-extensions' # Example command name

# Check if the main script file exists
if (-not (Test-Path $scriptPath -PathType Leaf)) {
    Write-Error "Core script file not found at '$scriptPath'. Installation cannot proceed."
    throw "Core script file not found at '$scriptPath'."
}

Write-Host "Creating shim for '$commandName' to execute '$scriptPath'"

# Use Chocolatey's helper function to create an executable shim in Chocolatey's bin directory
# This makes the script callable directly from the command line via the command name.
try {
    Install-ChocolateyPowershellCommand -CommandName $commandName -Path $scriptPath
    Write-Host "Shim for '$commandName' created successfully."
} catch {
    Write-Error "Failed to create shim for '$commandName'. Error: $($_.Exception.Message)"
    throw $_ # Re-throw the error to halt installation if shim creation fails
}

Write-Host "vscode-extensions-exporter installation script finished."