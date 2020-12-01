param (
    $DeploymentId = "mmm-ts",
    $Location = "North Europe",
    $ParametersFile = "d:\Source\Xenia\Cloud\deploy\standalone\azuredeploy.parameters.deploy.json",
    $SubscriptionName = "RD-NA_US_West-PE-DEV-INT-ADC-NQ",
    $TemplateUri = "https://dataexchangegroup9949.blob.core.windows.net/maxarms/TS/azuredeploy.json?st=2018-06-10T12%3A10%3A00Z&se=2020-08-11T12%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=b&sig=ZLVN4zpTREvEvjRj9O9LdaEDwMByaHZGK4fBGVkTacA%3D"
)

#Login-AzureRmAccount
Set-AzureRmContext -SubscriptionName "$SubscriptionName"

New-AzureRmResourceGroup -Name $DeploymentId -Location $Location -Force

New-AzureRmResourceGroupDeployment -Verbose -Name $DeploymentId -ResourceGroupName $DeploymentId `
  -TemplateUri $TemplateUri `
  -TemplateParameterFile $ParametersFile


