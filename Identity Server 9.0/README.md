## Sitecore Identity Server for Sitecore Environment

This template deploys Sitecore Identity Server into a Sitecore Environment.

It supports two deployment modes:

* **Standalone** — deploy directly with top-level parameters (see `azuredeploy.parameters.json`)
* **Module** — invoked from the main Sitecore PaaS ARM template

### Resources provisioned

* Sitecore Identity Server Web App
* Sitecore Identity Server App Service plan *(skipped in single-topology deployments that reuse an existing hosting plan)*

Resource naming follows the pattern `{deploymentId}-{siApplicationSuffixName}` for the web app and `{deploymentId}-{siApplicationSuffixName}-hp` for the hosting plan.

## Parameters

### Standalone deployment

> For standalone PaaS deployment, specify the following in `azuredeploy.parameters.json`.
> The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter | Description | Mandatory | Default |
| --------- | ----------- | --------- | ------- |
| deploymentId | Resource group / deployment identifier. | yes (script) | resource group name |
| location | Azure region. | no | resource group location |
| sqlServer | Azure SQL server FQDN. | yes | |
| sqlDatabasePrefix | Prefix for SQL database names. | yes | deploymentId |
| securitySqlDatabaseUserName | SQL user for the Security (core) database. | yes | |
| securitySqlDatabasePassword | SQL password for the Security database. | yes | |
| securitySqlDatabaseName | Security database name. | no | `{sqlDatabasePrefix}-core-db` |
| cmInstanceUrl | HTTPS URL of the Sitecore CM instance (used for password recovery and CORS). | yes* | |
| exmDdsInstanceUrl | HTTPS URL of the EXM DDS instance (added to CORS origins). | no | |
| siApplicationSuffixName | Suffix for the SI web app and hosting plan names. | yes | |
| siClientSecret | Client secret matching CM `sitecoreidentity.secret` in `ConnectionStrings.config`. | yes | |
| siMsDeployPackageUrl | HTTPS URL to the SI Web Deploy package. | yes | |
| certificateThumbprint | Thumbprint of the authentication certificate. | yes | |
| applicationInsightsConnectionString | Application Insights connection string. | no | |
| environmentType | Value for the `SITECORE_ENVIRONMENT_TYPE` app setting. | no | `Non-Production` |
| sitecoreSKU | Controls App Service plan size. | no | `Extra Small` |
| templateLinkAccessToken | SAS token for private template storage. | no | |

\* Not required when deployed as a module; values are supplied by the main Sitecore deployment.

> If **siApplicationSuffixName** matches an existing SI web app or hosting plan, those resources are updated in place. Sitecore environment PaaS deployments conventionally use **si** as the suffix.

### Module deployment

To deploy Sitecore Identity Server as part of a Sitecore environment deployment, add this template to the `modules` parameter in the main Sitecore `azuredeploy.parameters.json`. See [Deploying modules as part of Sitecore deployment](https://github.com/Sitecore/Sitecore-Azure-Quickstart-Templates/blob/master/MODULES.md) for setup instructions.

The module-specific parameter is `siMsDeployPackageUrl` (HTTPS URL to the SI Web Deploy package).

## Pre-deployment Checklist

1. Ensure you have the latest Azure PowerShell Az module installed. You can find installation instructions at [Install Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
2. Ensure that Sitecore Web Deploy packages you are going to deploy are available for download over HTTPS
3. Update parameter values in `azuredeploy.parameters.json` (standalone) or add this template to the `modules` parameter per [MODULES.md](https://github.com/Sitecore/Sitecore-Azure-Quickstart-Templates/blob/master/MODULES.md) (module)
4. If template storage is private, provide `templateLinkAccessToken` so nested templates (`nested/infrastructure.json`, `nested/application.json`) can be retrieved
5. Ensure the authentication certificate exists in the target resource group (or will be created before deployment)

## Sample PowerShell Script

Below is a sample PowerShell script that can help you get up and running quickly with the ARM templates. For automated deployments, the [Sitecore Azure Toolkit](https://dev.sitecore.net/) cmdlets simplify parameter merging and deployment.

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
$additionalParams.Set_Item('location',$location)

#endregion

#region Service Principal Details

# By default this script will prompt you for your Azure credentials but you can update the script to use an Azure Service Principal instead by following the details at the link below and updating the four variables below once you are done.
# https://azure.microsoft.com/en-us/documentation/articles/resource-group-authenticate-service-principal/

$useServicePrincipal = $false
$tenantId = "SERVICE_PRINCIPAL_TENANT_ID"
$applicationId = "SERVICE_PRINCIPAL_APPLICATION_ID"
$applicationPassword = "SERVICE_PRINCIPAL_APPLICATION_PASSWORD"

#endregion

try
{
	#region Validate Resource Group Name

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
		#region Use Service Principal
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
            Set-AzContext -SubscriptionId $azureSubscriptionId
		}
		catch
		{
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
    * Set `identityServerAuthority` to the URL of the new Sitecore Identity Server (`https://{deploymentId}-{siApplicationSuffixName}.azurewebsites.net`).
2. If EXM DDS is used, ensure its URL was included in deployment so CORS is configured correctly.
3. Restart the Sitecore instance to apply changes.
