# Sitecore-Azure-Quickstart-Templates
This repo contains all currently available Azure Resource Manager templates for Sitecore

# Documentation
You can read all about Sitecore Azure AppService integration and ARM Template deployment at [Sitecore Documentation Site](https://doc.sitecore.net/sitecore_azure_toolkit)

# Compatibility
Choose the compatible templates for your Sitecore version:

| Templates Folder | Compatible Product versions                                           |
|------------------|-----------------------------------------------------------------------|
| Sitecore 8.2.1   | Sitecore 8.2 Update-1 and Update-2                                    |
| Sitecore 8.2.3   | Sitecore 8.2 Update-3                                                 |
| Sitecore 8.2.4   | Sitecore 8.2 Update-4                                                 |
| Sitecore 8.2.5   | Sitecore 8.2 Update-5                                                 |
| Sitecore 9.0.0   | Sitecore 9.0 		                                                   |
| WFFM 8.2.3       | Web Forms For Marketers 8.2 Update-3, Update-4 and Update-5           |
| WFFM 9.0.0       | Web Forms For Marketers 9.0								           |
| AD 1.3.0         | Active Directory 1.3                                                  |
| EXM 3.5.0        | Email Experience Manager 3.5.0                                        |
| SXA         | Sitecore Experience Accelerator 1.3 - 1.5 for Sitecore 8.2 and Sitecore Experience Accelerator 1.5 for Sitecore 9.0	 |

# Pre-deployment Checklist
1. Ensure you have the latest Azure PowerShell SDK installed
2. Ensure that Sitecore Web Deploy packages you are going to deploy are available for download over the Internet
3. Download and update the parameter values in the **azuredeploy.parameters.json** file

# Sample PowerShell Script
Below is a sample PowerShell script that can help you to get up and running quickly with the ARM Templates. There is also a Sitecore PowerShell CmdLet available for download at [Sitecore Downloads Site](https://dev.sitecore.net/) that makes the deployment even easier.

```PowerShell
# Specify the parameters for the deployment 
$ArmTemplateUrl = "AZUREDEPLOY_JSON_URL"
$ArmParametersPath = ".\azuredeploy.parameters.json"
$licenseFilePath = "PATH_TO_LICENSE_XML"

# Specify the certificate file path and password if you want to deploy Sitecore 9.0 XP or XDB configurations
$certificateFilePath = $null 
$certificatePassword = $null
$certificateBlob = $null

$Name = "RESOURCE_GROUP_NAME"
$location = "AZURE_DATA_CENTER_NAME"
$AzureSubscriptionId = "AZURE_SUBSCRIPTION_ID"

# read the contents of your Sitecore license file
$licenseFileContent = Get-Content -Raw -Encoding UTF8 -Path $licenseFilePath | Out-String

# read the contents of your authentication certificate
if ($certificateFilePath) {
  $certificateBlob = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($certificateFilePath))
}

#region Create Params Object
# license file needs to be secure string and adding the params as a hashtable is the only way to do it
$additionalParams = New-Object -TypeName Hashtable

$params = Get-Content $ArmParametersPath -Raw | ConvertFrom-Json

foreach($p in $params | Get-Member -MemberType *Property)
{
    $additionalParams.Add($p.Name, $params.$($p.Name).value)
}

$additionalParams.licenseXml = $licenseFileContent
$additionalParams.deploymentId = $Name

# Inject Certificate Blob and Password into the parameters
if ($certificateBlob) {
  $additionalParams.authCertificateBlob = $certificateBlob
}
if ($certificatePassword) {
  $additionalParams.authCertificatePassword = $certificatePassword
}

#endregion

#region Service Principle Details

# By default this script will prompt you for your Azure credentials but you can update the script to use an Azure Service Principal instead by following the details at the link below and updating the four variables below once you are done.
# https://azure.microsoft.com/en-us/documentation/articles/resource-group-authenticate-service-principal/

$UseServicePrincipal = $false
$TenantId = "SERVICE_PRINCIPAL_TENANT_ID"
$ApplicationId = "SERVICE_PRINCIPAL_APPLICATION_ID"
$ApplicationPassword = "SERVICE_PRINCIPAL_APPLICATION_PASSWORD"

#endregion

try {
   	Write-Host "Setting Azure RM Context..."

 	if($UseServicePrincipal -eq $true)
	{
		#region Use Service Principle
		$secpasswd = ConvertTo-SecureString $ApplicationPassword -AsPlainText -Force
		$mycreds = New-Object System.Management.Automation.PSCredential ($ApplicationId, $secpasswd)
		Login-AzureRmAccount -ServicePrincipal -Tenant $TenantId -Credential $mycreds
		
		Set-AzureRmContext -SubscriptionID $AzureSubscriptionId -TenantId $TenantId
		#endregion
	}
	else
	{
		#region Use Manual Login
		try 
		{
			Write-Host "inside try"
			Set-AzureRmContext -SubscriptionID $AzureSubscriptionId
		}
		catch 
		{
			Write-Host "inside catch"
			Login-AzureRmAccount
			Set-AzureRmContext -SubscriptionID $AzureSubscriptionId
		}
		#endregion		
	}
	
 	Write-Host "Check if resource group already exists..."
	$notPresent = Get-AzureRmResourceGroup -Name $Name -ev notPresent -ea 0
	
	if (!$notPresent) 
	{
		New-AzureRmResourceGroup -Name $Name -Location $location
	}
	
	Write-Verbose "Starting ARM deployment..."
	New-AzureRmResourceGroupDeployment `
			-Name $Name `
			-ResourceGroupName $Name `
			-TemplateUri $ArmTemplateUrl `
			-TemplateParameterObject $additionalParams `
			# -DeploymentDebugLogLevel All -Debug -Verbose
			
	Write-Host "Deployment Complete."
}
catch 
{
	Write-Error $_.Exception.Message
	Break 
}
```

