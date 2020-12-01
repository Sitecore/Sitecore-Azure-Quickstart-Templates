# Sitecore Experience Accelerator module for Sitecore XM Environment


This template deploys Sitecore Experience Accelerator and PowerShell Extensions modules into a Sitecore XM Environment.

> Note. Email Experience Manager (EXM) module version 3.5 is not compatible with Sitecore Experience Accelerator (SXA). Installing EXM breaks site resolving functionality in SXA solutions.

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| sqlServerLogin                               | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                            | The password for the administrator account for Azure SQL server.
| cdSxaMsDeployPackageUrl                      | The HTTP(s) URL of a Sitecore Experience Accelerator Web Deploy package for Content Delivery instance.
| cmSxaMsDeployPackageUrl                      | The HTTP(s) URL of a Sitecore Experience Accelerator Web Deploy package for Content Management instance.
| speMsDeployPackageUrl                        | The HTTP(s) URL of a Sitecore Powershell Extensions Web Deploy package.

> **Note**. Each SXA version requires SPE version it is compatible with according to the following table:

| SXA version   | SPE version
----------------|-------------
| 10.0.0        | 6.1.1

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Experience Accelerator:

  * Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "sxa",
    "templateLink": "<URL of the azuredeploy.json file of the corresponding topology *.azuredeploy.json>",
    "parameters": {
        "cdSxaMsDeployPackageUrl" : "<URL of the WDP file Sitecore Experience Accelerator * CD.scwdp.zip>",
        "cmSxaMsDeployPackageUrl" : "<URL of the WDP file Sitecore Experience Accelerator *.scwdp.zip>",
        "speMsDeployPackageUrl" : "<URL of the WDP file Sitecore PowerShell Extensions *.scwdp.zip>",
    }
}
```

  * Configure Bootloader module according to [MODULES.md](../../MODULES.md)
  > **Note**. The Bootloader module should be placed after the SXA.