# Check if foreman is installed, if not, prompt to install
if (-not (Get-Command foreman -ErrorAction SilentlyContinue)) {
    Write-Host "Foreman could not be found. Please install it with: gem install foreman"
    exit
}

# Run the development environment using foreman
& foreman start -f Procfile.dev