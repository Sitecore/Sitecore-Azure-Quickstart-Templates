param (
    $DeploymentId = "example-xp".ToLower(),
    $LicenseXmlPath = "\\mars\Installs\Licenses\Sitecore Partner License\license.xml",
    $Location = "North Europe",
    $ParametersPath = "example-xp.parameters.gen.json",
    $Cmdlets = "d:\SAT\Sitecore.Azure.Toolkit\tools\",
    $SubscriptionName = "RD-NA_US_West-PE-DEV-INT-ADC-NQ",
    $TemplateUri = "https://screleasemanagement.blob.core.windows.net/sxp/SXP9.1.0/Sitecore 9.1.0 rev. 001382/Cloud/XP/azuredeploy.json?sv=2015-04-05&sr=b&sig=WdY%2B6w51V8Jhqf7HJOJhperQVfl8BJPHgHIM01wIozM%3D&se=2028-09-18T03%3A48%3A29Z&sp=r"
)

if ((Test-Path "$Cmdlets\Sitecore.Cloud.Cmdlets.psm1") -eq $False) {
    nuget install Sitecore.Azure.Toolkit.Cmdlets -Source http://nuget1dk1:8181/nuget/Cloud/ -x -Prerelease
    $Cmdlets = "$PSScriptRoot\Sitecore.Azure.Toolkit.Cmdlets\Cmdlets"
}
Import-Module "$Cmdlets\Sitecore.Cloud.Cmdlets.psm1" -Verbose

Login-AzureRmAccount
Set-AzureRmContext -SubscriptionName "$SubscriptionName"

Start-SitecoreAzureDeployment `
    -Name $DeploymentId `
    -Location $Location `
    -ArmTemplateUrl $TemplateUri `
    -ArmParametersPath $ParametersPath `
    -LicenseXmlPath $LicenseXmlPath `
    -Verbose
