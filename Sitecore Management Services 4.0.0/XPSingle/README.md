# SitecoreManagementServices module for Sitecore XP0 Environment

This template deploys SitecoreManagementServices into a Sitecore XP0 (XPSingle) Environment (single all-in-one instance).

## Parameters for SitecoreManagementServices

The **deploymentId**  parameter is filled in by the PowerShell script.

| Parameter                                     | Description
------------------------------------------------|------------------------------------------------
| sitecoreManagementServicesMsDeployPackageUrl  | The HTTP(s) URL of a SitecoreManagementServices Web Deploy package.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include SitecoreManagementServices:

* Add the following snippet to the `modules` parameter:
```JSON
  {
    "name": "sitecoreManagementServices",
    "templateLink": "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/SitecoreManagementServices/xp0/azuredeploy.json",
    "parameters":
    {
      "sitecoreManagementServicesMsDeployPackageUrl": "<URL of the WDP file for SitecoreManagementServices *.scwdp>"
    }
  }
```

* Configure Bootloader module according to [MODULES.md](../../MODULES.md). 
> **Note**. The Bootloader module should be placed after the SitecoreManagementServices.