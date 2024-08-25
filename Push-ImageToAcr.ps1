param(
    [Parameter(Mandatory=$true)]
    [string]$DockerfilePath,

    [Parameter(Mandatory=$true)]
    [string]$RepositoryName,

    [Parameter(Mandatory=$true)]
    [string]$AcrName,

    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,

    [string]$ImageName = $(Split-Path -Leaf $PWD),
    
    [string]$Tag = "{{.Run.ID}}"
)

# Log in to Azure
az login

# Set variables
$fullImageName = $ImageName + ":" + $Tag

# Build Docker image in ACR using local context
Write-Host "Building Docker image in Azure..."
az acr build `
    --registry $AcrName `
    --resource-group $ResourceGroupName `
    --image $fullImageName `
    --file $DockerfilePath `
    $PWD

Write-Host "Build task submitted."