param (
    $DeploymentId = "mkl-xp".ToLower(),
    $LicenseXmlPath = "c:\inetpub\wwwroot\defdev\Data\license.xml",
    $Location = "North Europe",
    $ParametersPath = "mkl-xp.parameters.gen.json",
    $Cmdlets = "d:\SAT\",
    $SubscriptionName = "RD-NA_US_West-PE-DEV-INT-ADC-NQ",
    $TemplateUri = "https://dataexchangegroup9949.blob.core.windows.net/maxarms/XPSingle/azuredeploy.json?st=2018-06-08T09%3A10%3A00Z&se=2020-08-09T09%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=b&sig=6EBQKQeqQebSt6NTW0j1XdcG7pRRgKCKTT6QYdEVQmo%3D"
)

if ((Test-Path "$Cmdlets\Sitecore.Cloud.Cmdlets.psm1") -eq $False) {
    nuget install Sitecore.Azure.Toolkit.Cmdlets -Source http://nuget1dk1:8181/nuget/Cloud/ -x -Prerelease
    $Cmdlets = "$PSScriptRoot\Sitecore.Azure.Toolkit.Cmdlets\Cmdlets"
}
Import-Module "$Cmdlets\Sitecore.Cloud.Cmdlets.psm1" -Verbose

#Login-AzureRmAccount
Set-AzureRmContext -SubscriptionName "$SubscriptionName"

Start-SitecoreAzureDeployment `
    -Name $DeploymentId `
    -Location $Location `
    -ArmTemplateUrl $TemplateUri `
    -ArmParametersPath $ParametersPath `
    -LicenseXmlPath $LicenseXmlPath `
    -Verbose


  #  Stop-AzureRmResourceGroupDeployment -Name "mkl-xp" -ResourceGroupName "mkl-xp"