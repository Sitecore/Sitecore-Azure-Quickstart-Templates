# Sitecore JavaScript Services Server module for Sitecore XP Environment

This template deploys Sitecore JavaScript Services Server modules into a Sitecore XP Environment.

## Parameters for Sitecore JavaScript Services Server

The **deploymentId**  parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| jssMsDeployPackageUrl                     | The HTTP(s) URL of a Sitecore JavaScript Services Server Web Deploy package.
| jssCDMsDeployPackageUrl                   | The HTTP(s) URL of a Sitecore JavaScript Services Server Web Deploy CD package.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore JavaScript Services Server:

* Add the following snippet to the `modules` parameter:
```JSON
  {
    "name": "jss",
    "templateLink": "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/JSS/xp/azuredeploy.json",
    "parameters":
    {
      "jssMsDeployPackageUrl": "<URL of the WDP file for Sitecore JavaScript Services Server *.scwdp>",
      "jssCDMsDeployPackageUrl": "<URL of the CD WDP file for Sitecore JavaScript Services Server *.scwdp>"
    }
  }
```

* Configure Bootloader module according to [MODULES.md](../../MODULES.md). 
> **Note**. The Bootloader module should be placed after the Sitecore JavaScript Services Server.