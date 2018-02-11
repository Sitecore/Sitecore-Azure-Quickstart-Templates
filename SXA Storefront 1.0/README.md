# Sitecore Experience Accelerator Storefront (SXA Storefront) module for Sitecore XP Environment


This template deploys the SXA Storefront module into a Sitecore XP Environment. SXA Storefront requires Sitecore XC and SXA modules.  

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| location                                     | The geographical region of the current deployment.
| siteTitle                                    | Long title of the Storefront site.
| sqlServerLogin                               | The name of the administrator account for Azure SQL server that will be created.
| sqlServerPassword                            | The password for the administrator account for Azure SQL server.
| sxaMsDeployPackageUrl                        | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Web Deploy package (not an SXA Web Deploy package).
| sxaStorefrontMsDeployPackageUrl              | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Storefront Web Deploy package.
| sxaHabitatCatalogMsDeployPackageUrl          | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Habitat Catalog Web Deploy package.
| sxaStorefrontThemesMsDeployPackageUrl        | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Storefront Themes Web Deploy package


## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include the SXA Storefront module:

* Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "sxa-sf",
    "templateLink": "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/SXA%20Storefront%201.0/azuredeploy.json",
    "parameters": {
        "siteName": "<site name>",
        "environmentName": "<environment name>",        
        "sxaMsDeployPackageUrl": "<URL for WDP>",
        "sxaStorefrontMsDeployPackageUrl": "<URL for WDP>",
        "sxaHabitatCatalogMsDeployPackageUrl": "<URL for WDP>",
        "sxaStorefrontThemesMsDeployPackageUrl": "<URL for WDP>"
    }
},
```

* Configure Bootloader module according to [Modules.md](../MODULES.md)
> **Note**. The Bootloader module should be placed after the Commerce, SXA, and SXA-SF modules.