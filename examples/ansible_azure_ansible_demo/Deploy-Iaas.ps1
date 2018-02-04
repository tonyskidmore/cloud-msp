<#
Script block to test deployment via PowerShell

#>

{

if(-not $cred) { $cred = Get-Credential -Message "Supply Azure Subscription Details" }

$azureAccount = Add-AzureRmAccount -Credential $cred

}


### Define Deployment Variables
{

$location = 'UK West'
$resourceGroupName = 'ansible-demo'
$resourceDeploymentName = 'ansible-demo-deployment'
$templatePath = 'files'
$templateFile = 'azuredeploy.json'
$template = Join-Path -Path $pwd -ChildPath "files\$templateFile"
$adminUserName = "cloud_user"
$sshKeyData = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClumoBR/nnZfhhUFNGBtCYf1Sa4u+QzMf6OrzExNcnWxHvctdLxJozH1PZGt4CrcJ7Tp6roBXU0ZdqsYDZW+slICeIudvUerMqJEvzA7SWAEaawfenC9QJuxbzd8VOZi3DxURw6nE2mhgtFb1v4oepJkdVQFwc1PQIqE8W3jBjLguUn+TfJQpjF6aFJdDR+KQmI/DWDpsLXy2g56lIWaJP5Wv0eX4WarFQnAIN9eKn8o4CqccYwJ1a/TWyVgpFpUGU2nZoY2FF1oU+8n17RGqh3yoEoDC/c6GTgVfb3KWnx6Ai9zyj686vMnPfPca/q/YkYLUUg5Co/EQu1NwmoNKp"

}

### Find Images
{

Get-AzureRmVMImagePublisher -Location $location #check all the publishers available

Get-AzureRmVMImageOffer -Location $location -PublisherName "OpenLogic" #look for offers for a publisher
Get-AzureRmVMImageSku -Location $location -PublisherName "OpenLogic" -Offer "CentOS" #view SKUs for an offer
Get-AzureRmVMImage -Location $location -PublisherName "OpenLogic" -Offer "CentOS" -Skus "7.4" -Version "7.4.20180118" #pick one!

}

### Create Resource Group
{

Measure-Command {
    $createRG = New-AzureRmResourceGroup `
        -Name $resourceGroupName `
        -Location $location `
        -Verbose -Force
}

$createRG

}

### Deploy Resources
{

Measure-Command {

    $additionalParameters = New-Object -TypeName Hashtable
    $additionalParameters['adminUsername'] = $adminUserName
    $additionalParameters['sshKeyData'] = $sshKeyData
    $deployRG = New-AzureRmResourceGroupDeployment `
        -Name $resourceDeploymentName `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $template `
        @additionalParameters `
        -Verbose -Force
}

$deployRG

}

{

Measure-Command {
    $removeRG = Remove-AzureRmResourceGroup -Name $resourceGroupName -Force -Verbose
}

$removeRG

}
