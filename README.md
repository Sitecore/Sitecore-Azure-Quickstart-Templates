# Sitecore-Azure-Quickstart-Templates
This repo contains all currently available Azure Resource Manager templates for Sitecore

# Documentation
You can read all about Sitecore Azure AppService integration and ARM Template deployment at [Sitecore Documentation Site](https://doc.sitecore.com/developers/90/#sitecore_azure)

# Compatibility
Choose the compatible templates for your Sitecore version:

| Templates Folder | Compatible Product versions                                           |
|------------------|-----------------------------------------------------------------------|
| Sitecore 8.2.1   | Sitecore 8.2 Update-1 and Update-2                                    |
| Sitecore 8.2.3   | Sitecore 8.2 Update-3                                                 |
| Sitecore 8.2.4   | Sitecore 8.2 Update-4                                                 |
| Sitecore 8.2.5   | Sitecore 8.2 Update-5 and Update-6                                    |
| Sitecore 8.2.7   | Sitecore 8.2 Update-7                                                 |
| Sitecore 9.0.0   | Sitecore 9.0	                                                   |
| Sitecore 9.0.1   | Sitecore 9.0 Update-1 <br />Please note that these ARM templates link to an additional WDP in order to resolve a potential performance issue on start-up (see KB [article](https://kb.sitecore.net/articles/290593) for more info).                                               	|
| Sitecore 9.0.2   | Sitecore 9.0 Update-2                                                 |
| Sitecore 9.1.0   | Sitecore 9.1                                                          |
| Sitecore 9.1.1   | Sitecore 9.1 Update-1                                                 |
| Sitecore 9.2.0   | Sitecore 9.2                                                          |
| Sitecore 9.3.0   | Sitecore 9.3                                                          |
| Sitecore 10.0.0  | Sitecore 10.0.0                                                       |
| WFFM 8.2.3       | Web Forms For Marketers 8.2 Update-3, Update-4 and Update-5           |
| WFFM 9.0.0       | Web Forms For Marketers 9.0				           |
| AD 1.3.0         | Active Directory 1.3                                                  |
| EXM 3.5.0        | Email Experience Manager 3.5.0                                        |
| SXA         | Sitecore Experience Accelerator 1.3 - 1.6 for Sitecore 8.2 and Sitecore 9.0	 |
| Sitecore XC 9.0.0 | Commerce 9.0 Initial, Commerce 9.0 Update-1. Use with templates: Sitecore 9.0.1, SXA 1.6, SXA Storefront 1.0 |
| Sitecore XC 9.0.2 | Commerce 9.0 Update-2. Use with templates: Sitecore 9.0.2, SXA 1.7.1, SXA Storefront 1.2 |
| Sitecore XC 9.0.3 | Commerce 9.0 Update-3. Use with templates: Sitecore 9.0.2, SXA 1.8, SXA Storefront 1.4 |
| Sitecore XC 9.1.0 | Commerce 9.1 Initial. Use with templates: Sitecore 9.1.1, SXA 1.8, SXA Storefront 2.0 |
| Sitecore XC 9.2.0 | Commerce 9.2 Initial. Use with templates: Sitecore 9.2.0, SXA 1.9.0, SXA Storefront 3.0 |
| Sitecore XC 9.3.0 | Commerce 9.3 Initial. Use with templates: Sitecore 9.3.0, SXA 9.3.0, SXA Storefront 4.0 |
| Sitecore XC 10.0.0 | Commerce 10.0.0. Use with templates: Sitecore 10.0.0, SXA 10.0.0, SXA Storefront 5.0 |
| SXA Storefront 1.0 | SXA Storefront 1.0. Use with templates: Sitecore 9.0.1, Sitecore XC 9.0.0, SXA 1.6 |
| SXA Storefront 1.2 | SXA Storefront 1.2. Use with templates: Sitecore 9.0.2, Sitecore XC 9.0.2, SXA 1.7.1 |
| SXA Storefront 1.4 | SXA Storefront 1.4. Use with templates: Sitecore 9.0.2, Sitecore XC 9.0.3, SXA 1.8 |
| SXA Storefront 2.0 | SXA Storefront 2.0. Use with templates: Sitecore 9.1.1, Sitecore XC 9.1.0, SXA 1.8 |
| SXA Storefront 3.0 | SXA Storefront 3.0. Use with templates: Sitecore 9.2.0, Sitecore XC 9.2.0, SXA 1.9.0 |
| SXA Storefront 4.0 | SXA Storefront 4.0. Use with templates: Sitecore 9.3.0, Sitecore XC 9.3.0, SXA 9.3.0 |
| SXA Storefront 5.0 | SXA Storefront 5.0. Use with templates: Sitecore 10.0.0, Sitecore XC 10.0.0, SXA 10.0.0 |

# Pre-deployment Checklist
1. Ensure you have the latest Azure PowerShell Az module installed. You can find installation instructions at [Install Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
2. Ensure that Sitecore Web Deploy packages you are going to deploy are available for download over the Internet
3. Download and update the parameter values in the **azuredeploy.parameters.json** file

# Preparing prerequisites
Prerequisites section allows to deploy pre-step(s) (for example solr deployment, etc. ) before the main deployment.
In order to deploy prerequisites as part of Sitecore deployment, you will need to change azuredeploy.parameters.json by adding prerequisites object with necessary parameters. 
Parameters that should be passed to the prerequisite depend on the actual deployment template. For example:

```JSON
"prerequisites": {
    "value": {
        "items": [
            {
                "name": "<Name of the prerequisite>",
                "templateLink": "<URL of the Resource Manager template that deploys the prerequisite>",
                "parameters": {
                    /* Parameters for the prerequisite. Can be empty */
                    "<Name of the parameter>": {
                        "value": "<Value of the parameter>"
					}
                }
            }
        ]
    }
}
```

# Sample PowerShell Script
Below is a sample PowerShell script that can help you to get up and running quickly with the ARM Templates. There is also a Sitecore PowerShell CmdLet available for download at [Sitecore Downloads Site](https://dev.sitecore.net/) that makes the deployment even easier.

```PowerShell
# Specify the parameters for the deployment 
$ArmTemplateUrl = "AZUREDEPLOY_JSON_URL"
$ArmParametersPath = ".\azuredeploy.parameters.json"
$licenseFilePath = "PATH_TO_LICENSE_XML"

# Specify the certificate file path and password if you want to deploy Sitecore XP or XDB configurations
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

$additionalParams.Set_Item('licenseXml',$licenseFileContent)
$additionalParams.Set_Item('deploymentId',$Name)

# Inject Certificate Blob and Password into the parameters
if ($certificateBlob) {
  $additionalParams.Set_Item('authCertificateBlob',$certificateBlob)
}
if ($certificatePassword) {
  $additionalParams.Set_Item('authCertificatePassword',$certificatePassword)
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

try 
{
	
	#region Validate Resouce Group Name	

	Write-Host "Validating Resource Group Name..."
	if(!($Name -cmatch '^(?!.*--)[a-z0-9]{2}(|([a-z0-9\-]{0,37})[a-z0-9])$'))
	{
		Write-Error "Name should only contain lowercase letters, digits or dashes,
					 dash cannot be used in the first two or final character,
					 it cannot contain consecutive dashes and is limited between 2 and 40 characters in length!"
		Break;		
	}
		
	#endregion
	
	Write-Host "Setting Azure PowerShell session context..."

 	if($UseServicePrincipal -eq $true)
	{
		#region Use Service Principle
		$secpasswd = ConvertTo-SecureString $ApplicationPassword -AsPlainText -Force
		$mycreds = New-Object System.Management.Automation.PSCredential ($ApplicationId, $secpasswd)
        Connect-AzAccount -ServicePrincipal -Tenant $TenantId -Credential $mycreds
		
        Set-AzContext -SubscriptionId $AzureSubscriptionId -TenantId $TenantId
		#endregion
	}
	else
	{
		#region Use Manual Login
		try 
		{
			Write-Host "inside try"
            Set-AzContext -SubscriptionId $AzureSubscriptionId
		}
		catch 
		{
			Write-Host "inside catch"
            Connect-AzAccount
            Set-AzContext -SubscriptionId $AzureSubscriptionId   
		}
		#endregion		
	}
	
 	Write-Host "Check if resource group already exists..."
    $notPresent = Get-AzResourceGroup -Name $Name -ev notPresent -ea 0
	
	if (!$notPresent) 
	{
        New-AzResourceGroup -Name $Name -Location $location
	}
	
	Write-Host "Starting ARM deployment..."        
    New-AzResourceGroupDeployment `
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
