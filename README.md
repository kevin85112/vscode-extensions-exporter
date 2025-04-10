# VS Code Extensions Exporter (Chocolatey Package)

A command-line tool, installable via Chocolatey, to export specific configuration files (like `extensions.json`, and `install-extensions.sh`) from a specified Visual Studio Code Profile to your current working directory.

This can be useful for backing up parts of a profile, sharing configurations, or inspecting profile settings outside of VS Code.

## Installation

You need [Chocolatey](https://chocolatey.org/install) installed first.


**Note:** This package is not currently published on the Chocolatey Community Repository. You need to install it manually from the downloaded file.

1.  **Download the Package:**
    * Go to the [**Releases**](https://github.com/kevin85112/vscode-extensions-exporter/releases) page of this project's GitHub repository.
    * Download the latest `.nupkg` file (e.g., `vscode-extensions-exporter.1.0.0.nupkg`) from the Assets section.

2.  **Install from Local File:**
    * Open your terminal (Command Prompt or PowerShell) **in the directory where you downloaded the `.nupkg` file**.
    * Run the following command, replacing `<path-to-downloaded-file.nupkg>` with the actual path or filename if you are already in the directory:

    ```powershell
    # Install the package from the downloaded .nupkg file
    choco install <path-to-downloaded-file.nupkg> -y 
    
    # Example if the file is in the current directory:
    # choco install .\vscode-extensions-exporter.1.0.0.nupkg -y 
    ```

## Usage

Open your preferred terminal (Command Prompt, PowerShell, etc.) and use the following command:

```cmd
vscode-extensions-exporter
```
