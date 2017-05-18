# Sitecore-Azure-Quickstart-Templates
This repo contains all currently available Azure Resource Manager templates for Sitecore

# Documentation
You can read all about Sitecore Azure AppService integration and ARM Template deployment at [Sitecore Documentation Site](https://doc.sitecore.net/cloud)

# Compatibility
Choose the compatible templates for your Sitecore version:

| Templates Folder | Compatible Sitecore versions                       |
|------------------|----------------------------------------------------|
| Sitecore 8.2.1   | Sitecore 8.2 Update-1 and Update-2                 |
| Sitecore 8.2.3   | Sitecore 8.2 Update-3                              |

# Pre-deployment Checklist
1. Ensure you have the latest Azure PowerShell SDK installed
2. Ensure you have uploaded your Sitecore Web Deploy packages to a blob storage location 
3. Ensure you have a cloud-hosted instance of MongoDB for Experience Database in XP and XP0 configurations.
4. Download and update the parameter values in the **azuredeploy.parameters.json** file


# Sample PowerShell Script
Below is a sample PowerShell script that can help you to get up and running quickly with the ARM Templates. There is also a Sitecore PowerShell CmdLet available for download at [Sitecore Downloads Site](https://dev.sitecore.net/) that makes the deployment even easier.

```PowerShell
$ArmTemplateUrl = "AZUREDEPLOY_JSON_URL";
$ArmParametersPath = ".\xp\azuredeploy.parameters.json";

# read the contents of your Sitecore license file
$licenseFileContent = Get-Content -Raw -Encoding UTF8 -Path ".\license.xml" | Out-String;
$Name = "RESOURCE_GROUP_NAME";
$location = "AZURE_DATA_CENTER_NAME";
$AzureSubscriptionId = "AZURE_SUBSCRIPTION_ID";

#region Create Params Object
# license file needs to be secure string and adding the params as a hashtable is the only way to do it
$additionalParams = New-Object -TypeName Hashtable;

$params = Get-Content $ArmParametersPath -Raw | ConvertFrom-Json;

foreach($p in $params | Get-Member -MemberType *Property)
{
    $additionalParams.Add($p.Name, $params.$($p.Name).value);
}

$additionalParams.Set_Item('licenseXml', $licenseFileContent);
$additionalParams.Set_Item('deploymentId', $Name);

#endregion

#region Service Principle Details

# By default this script will prompt you for your Azure credentials but you can update the script to use an Azure Service Principal instead by following the details at the link below and updating the four variables below once you are done.
# https://azure.microsoft.com/en-us/documentation/articles/resource-group-authenticate-service-principal/

$UseServicePrincipal = $false;
$TenantId = "SERVICE_PRINCIPAL_TENANT_ID";
$ApplicationId = "SERVICE_PRINCIPAL_APPLICATION_ID";
$ApplicationPassword = "SERVICE_PRINCIPAL_APPLICATION_PASSWORD";

#endregion

try {
   	Write-Host "Setting Azure RM Context..."

 	if($UseServicePrincipal -eq $true)
	{
		#region Use Service Principle
		$secpasswd = ConvertTo-SecureString $ApplicationPassword -AsPlainText -Force
		$mycreds = New-Object System.Management.Automation.PSCredential ($ApplicationId, $secpasswd)
		Login-AzureRmAccount -ServicePrincipal -Tenant $TenantId -Credential $mycreds
		
		Set-AzureRmContext -SubscriptionID $AzureSubscriptionId -TenantId $TenantId;
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
	$notPresent = Get-AzureRmResourceGroup -Name $Name -ev notPresent -ea 0;
	
	if (!$notPresent) 
	{
		New-AzureRmResourceGroup -Name $Name -Location $location;
	}
	
	Write-Verbose "Starting ARM deployment...";
	New-AzureRmResourceGroupDeployment -Name $Name -ResourceGroupName $Name -TemplateUri $ArmTemplateUrl -TemplateParameterObject $additionalParams; # -DeploymentDebugLogLevel All -Debug;

	Write-Host "Deployment Complete.";
}
catch 
{
	Write-Error $_.Exception.Message
	Break 
}
```

