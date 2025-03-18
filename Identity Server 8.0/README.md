## Sitecore Identity Server for Sitecore Environment

This template deploys Sitecore Identity Server into a Sitecore Environment with a new version of Sitecore Identity.

Resources provisioned:
* Sitecore Identity Server Web App
* Sitecore Identity Server App Service plan

## Parameters

> Sitecore Identity PaaS deployment requires the following parameters to be specified in `azuredeploy.parameters.json`:

The **deploymentId** and **licenseXml** parameters are to be filled in by the PowerShell script.

| Parameter | Description | Is mandatory ?   | Default value |
| --------- | ----------- | ---------------- | ------------- |
| sqlServer | The name of Azure SQL server. | yes | |
| sqlDatabasePrefix | The prefix name of the SQL databases. | yes | |
| securitySqlDatabaseUserName | The user to use in Security database connection string. | yes | |
| securitySqlDatabasePassword | The Sql password for the Security database connection string. | yes | |
| cmInstanceUrl | The HTTP(s) URL to a Sitecore Content Management Web App. | yes | |
| siApplicationSuffixName | The suffix name of the Sitecore Identity Server Web App and Sitecore Identity Server App Service plan. | yes | |
| siClientSecret | The client secret to a Sitecore Identity Server (the same value as for "...\App_Config\ConnectionStrings.config" file, in the "sitecoreidentity.secret" connection string, on the Sitecore Content Management instance). | yes | |
| siMsDeployPackageUrl | The HTTP(s) URL to a Sitecore Identity Server Web Deploy package. | yes | |
| applicationInsightsConnectionString | The connection string to the Application Insights. | no | |
| certificateThumbprint | The thumbprint to an existing authentication certificate. | yes | |

> In case if **siApplicationSuffixName** parameter matches the suffix name for existent *Sitecore Identity Server Web App* or *Sitecore Identity Server App Service plan*, resources will be overridden with provided suffix name. By default Sitecore environment PaaS deployment uses **si** as suffix.

**(OPTIONAL)** Add this parameter if needed:

| Parameter | Description | Example Value |
| --------- | ----------- | ------------- |
| templateLinkAccessToken | An access token for storage account (if the storage does not set to public). If public, no need to pass this parameter | ?st=2019-03-185Z&se=2019-03-220Z&sp=rl&sv=2018-03-28&sr=c&sg=4cM%3D **OR** "" |

## Pre-deployment Checklist
1. Ensure you have the latest Azure PowerShell Az module installed. You can find installation instructions at [Install Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
2. Ensure that Sitecore Web Deploy packages you are going to deploy are available for download over the Internet
3. Download and update the parameter values in the **azuredeploy.parameters.json** file

## Sample PowerShell Script
Below is a sample PowerShell script that can help you to get up and running quickly with the ARM Templates. There is also a Sitecore PowerShell CmdLet available for download at [Sitecore Downloads Site](https://dev.sitecore.net/) that makes the deployment even easier.

```PowerShell
# Specify the parameters for the deployment
$armTemplateUrl = "AZUREDEPLOY_JSON_URL"
$armParametersPath = ".\azuredeploy.parameters.json"
$licenseFilePath = "PATH_TO_LICENSE_XML"

$name = "RESOURCE_GROUP_NAME"
$location = "AZURE_DATA_CENTER_NAME"
$azureSubscriptionId = "AZURE_SUBSCRIPTION_ID"

# read the contents of your Sitecore license file
$licenseFileContent = Get-Content -Raw -Encoding UTF8 -Path $licenseFilePath | Out-String

#region Create Params Object
# license file needs to be secure string and adding the params as a hashtable is the only way to do it
$additionalParams = New-Object -TypeName Hashtable

$params = (Get-Content $armParametersPath -Raw | ConvertFrom-Json).parameters

foreach($p in $params | Get-Member -MemberType *Property)
{
    $additionalParams.Add($p.Name, $params.$($p.Name).value)
}

$additionalParams.Set_Item('licenseXml',$licenseFileContent)
$additionalParams.Set_Item('deploymentId',$name)

#endregion

#region Service Principle Details

# By default this script will prompt you for your Azure credentials but you can update the script to use an Azure Service Principal instead by following the details at the link below and updating the four variables below once you are done.
# https://azure.microsoft.com/en-us/documentation/articles/resource-group-authenticate-service-principal/

$useServicePrincipal = $false
$tenantId = "SERVICE_PRINCIPAL_TENANT_ID"
$applicationId = "SERVICE_PRINCIPAL_APPLICATION_ID"
$applicationPassword = "SERVICE_PRINCIPAL_APPLICATION_PASSWORD"

#endregion

try
{
	#region Validate Resouce Group Name

	Write-Host "Validating Resource Group Name..."
	if(!($name -cmatch '^(?!.*--)[a-z0-9]{2}(|([a-z0-9\-]{0,37})[a-z0-9])$'))
	{
		Write-Error "Name should only contain lowercase letters, digits or dashes,
					 dash cannot be used in the first two or final character,
					 it cannot contain consecutive dashes and is limited between 2 and 40 characters in length!"
		break;
	}
		
	#endregion
	
	Write-Host "Setting Azure PowerShell session context..."

 	if($useServicePrincipal -eq $true)
	{
		#region Use Service Principle
		$secpasswd = ConvertTo-SecureString $applicationPassword -AsPlainText -Force
		$mycreds = New-Object System.Management.Automation.PSCredential ($applicationId, $secpasswd)
        Connect-AzAccount -ServicePrincipal -Tenant $tenantId -Credential $mycreds
		
        Set-AzContext -SubscriptionId $azureSubscriptionId -TenantId $tenantId
		#endregion
	}
	else
	{
		#region Use Manual Login
		try
		{
			Write-Host "inside try"
            Set-AzContext -SubscriptionId $azureSubscriptionId
		}
		catch
		{
			Write-Host "inside catch"
            Connect-AzAccount
            Set-AzContext -SubscriptionId $azureSubscriptionId
		}
		#endregion
	}
	
 	Write-Host "Check if resource group already exists..."
    $notPresent = Get-AzResourceGroup -Name $name -ev notPresent -ea 0
	
	if (!$notPresent)
	{
        New-AzResourceGroup -Name $name -Location $location
	}
	
	Write-Host "Starting ARM deployment..."
    New-AzResourceGroupDeployment `
			-Name $name `
			-ResourceGroupName $name `
			-TemplateUri $armTemplateUrl `
			-TemplateParameterObject $additionalParams `
			# -DeploymentDebugLogLevel All -Debug -Verbose
			
	Write-Host "Deployment Complete."
}
catch
{
	Write-Error $_.Exception.Message
	break
}
```

## Update Sitecore Configuration to use the latest Sitecore Identity Server version
1. Update the **"...\App_Config\Sitecore\Owin.Authentication.IdentityServer\Sitecore.Owin.Authentication.IdentityServer.config"** file in your Sitecore Content Management (CM) instance:
    * Set identityServerAuthority to the URL of the new Sitecore Identity Server.
2. Restart the Sitecore instance to apply changes.