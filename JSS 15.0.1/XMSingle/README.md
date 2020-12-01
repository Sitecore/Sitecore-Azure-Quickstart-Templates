# Sitecore JavaScript Services Server module for Sitecore XM0 Environment

This template deploys Sitecore JavaScript Services Server modules into a Sitecore XM0 (XMSingle) Environment (single all-in-one instance).

## Parameters for Sitecore JavaScript Services Server

The **deploymentId**  parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| jssMsDeployPackageUrl                     | The HTTP(s) URL of a Sitecore JavaScript Services Server Web Deploy package.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore JavaScript Services Server:

* Add the following snippet to the `modules` parameter:
```JSON
  {
    "name": "jss",
    "templateLink": "<URL of the azuredeploy.json file of the corresponding topology *.azuredeploy.json>",
    "parameters":
    {
      "jssMsDeployPackageUrl": "<URL of the WDP file for Sitecore JavaScript Services Server *.scwdp>"
    }
  }
```

* Configure Bootloader module according to [MODULES.md](../../MODULES.md). 
> **Note**. The Bootloader module should be placed after the Sitecore JavaScript Services Server.