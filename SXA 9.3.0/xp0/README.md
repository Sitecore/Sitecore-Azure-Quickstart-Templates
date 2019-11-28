# Sitecore Experience Accelerator module for Sitecore XP0 Environment

This template deploys Sitecore Experience Accelerator (SXA) and Sitecore PowerShell Extension (SPE)
modules into a Sitecore XP0 (XPSingle) Environment (single all-in-one instance).

> **Note**. Email Experience Manager (EXM) module version 3.5 is not compatible with Sitecore Experience Accelerator (SXA). Installing EXM breaks site resolving functionality in SXA solutions.

## Parameters for SXA and SPE

The **deploymentId**  parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| sxaMsDeployPackageUrl                     | The HTTP(s) URL of a Sitecore Experience Accelerator Web Deploy package.
| speMsDeployPackageUrl                     | The HTTP(s) URL of a Sitecore Powershell Extensions Web Deploy package.

> **Note**. Each SXA version requires SPE version it is compatible with according to the following table:

| SXA version   | SPE version
----------------|-------------
| 9.3.0         | 6.0

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Experience Accelerator:

* Add the following snippet to the `modules` parameter:
```JSON
  {
    "name": "sxa",
    "templateLink": "<URL of the azuredeploy.json file of the corresponding topology *.azuredeploy.json>",
    "parameters":
    {
      "cmSxaMsDeployPackageUrl": "<URL of the WDP file *_sxa.scwdp.zip>",
      "speMsDeployPackageUrl": "<URL of the WDP file *_spe.scwdp.zip>",
    }
  }
```

* Configure Bootloader module according to [MODULES.md](../../MODULES.md). 
> **Note**. The Bootloader module should be placed after the SXA.