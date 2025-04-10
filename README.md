# VS Code Extensions Exporter (Chocolatey Package)

A command-line tool, installable via Chocolatey, to export specific configuration files (like `extensions.json`, and `install-extensions.sh`) from a specified Visual Studio Code Profile to your current working directory.

This can be useful for backing up parts of a profile, sharing configurations, or inspecting profile settings outside of VS Code.

## Installation

You need [Chocolatey](https://chocolatey.org/install) installed first.

```cmd
# Install the package from the Chocolatey Community Repository
choco install vscode-extensions-exporter -y
```

## Usage

Open your preferred terminal (Command Prompt, PowerShell, etc.) and use the following command:

```cmd
vscode-extensions-exporter
```
