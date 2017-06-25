# Sitecore Experience Accelerator module for Sitecore XP0 Environment

This template deploys Sitecore Experience Accelerator and PowerShell Extension
modules into a Sitecore XP0 Environment (single all-in-one instance).

## Parameters for SXA and SPE

The **deploymentId**  parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| sxaMsDeployPackageUrl                     | The blob storage URL of a Sitecore Experience Accelerator Instance Web Deploy package.
| speMsDeployPackageUrl                     | The blob storage URL of a PowerShell Extension Instance Web Deploy package.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Experience Accelerator:

* Configure Bootloader module according to [Modules.md](../../Modules.md)
* Add the following snippet to the `modules` parameter:
  ```JSON
  {
    "name": "sxa",
    "templateLink": "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/SXA/xp0/azuredeploy.json",
    "parameters":
    {
      "sxaMsDeployPackageUrl": "<URL of the WDP file *_sxa.scwdp.zip>",
      "speMsDeployPackageUrl": "<URL of the WDP file *_spe.scwdp.zip>"
    }
  }
  ```

## Example of PowerShell deployment script

The following sample use Sitecore Azure Toolkit to create resource group with
`$DeploymentId` value and deploy azuredeploy.json ARM template with sxa.params.json
parameters.

```PowerShell
$SCSDK="Path to Sitecore Azure Toolkit"
$SCTemplates="https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%208.2.3/xp0/"
$DeploymentId = "Deployment ID"
$LicenseFile = "Path to license.xml file"
$SubscriptionId = "SubscriptionId"

$Parameters = @{
    "deploymentId"=$DeploymentId
}

Import-Module $SCSDK\Sitecore.Cloud.Cmdlets.psm1

Add-AzureRMAccount
Set-AzureRMContext -SubscriptionId $SubscriptionId
Start-SitecoreAzureDeployment `
    -Name $DeploymentId `
    -Location "North Europe" `
    -ArmTemplatePath "$SCTemplates\azuredeploy.json" `
    -ArmParametersPath "sxa.params.json" `
    -LicenseXmlPath $LicenseFile `
    -SetKeyValue $Parameters
```

## Full Example for Sitecore 8.2.3 + SXA deployment parameters

```JSON
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "modules": {
      "value": {
        "items": [
          {
            "name": "bootloader",
            "templateLink": "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%208.2.3/xp0/addons/bootloader.json",
            "parameters": {
              "msDeployPackageUrl": "https://<link-to-bootloader>Bootload.wdp.zip"
            }
          },
          {
            "name": "sxa",
            "templateLink": "https://raw.githubusercontent.com/Sitecore/sitecore-azure-quickstart-templates/master/SXA/xp0/azuredeploy.json",
            "parameters":
            {
              "sxaMsDeployPackageUrl": "<URL of the WDP file *_sxa.scwdp.zip>",
              "speMsDeployPackageUrl": "<URL of the WDP file *_spe.scwdp.zip>"
            }
          }
        ]
      }
    },

    "deploymentId": {
      "value": ""
    },
    "sqlServerLogin": {
      "value": "testlogin"
    },
    "sqlServerPassword": {
      "value": "strongEnoughP@$$w0rd"
    },
    "singleMsDeployPackageUrl": {
      "value": "https://<link-to-sitecore-wdp-storage>/Sitecore 8.2 rev. 170407_single.scwdp.zip"
    },
    "sitecoreAdminPassword": {
      "value": "strongEnoughP@$$w0rd"
    },
    "analyticsMongoDbConnectionString": {
      "value": "mongodb://<mongo-db-server>/Sitecore_analytics"
    },
    "trackingLiveMongoDbConnectionString": {
      "value": "mongodb://<mongo-db-server>/Sitecore_tracking_live"
    },
    "trackingHistoryMongoDbConnectionString": {
      "value": "mongodb://<mongo-db-server>/Sitecore_tracking_history"
    },
    "trackingContactMongoDbConnectionString": {
      "value": "mongodb://<mongo-db-server>/Sitecore_tracking_contact"
    },
    "licenseXml": {
      "value": ""
    }
  }
}
```
