# SitecoreManagementServices module for Sitecore XM Environment

This template deploys SitecoreManagementServices into a Sitecore XM Environment.

## Parameters for SitecoreManagementServices

The **deploymentId**  parameter is filled in by the PowerShell script.

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| sitecoreManagementServicesMsDeployPackageUrl | The HTTP(s) URL of a SitecoreManagementServices Web Deploy package.


## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include SitecoreManagementServices:

* Add the following snippet to the `modules` parameter:
```JSON
  {
    "name": "sitecoreManagementServices",
    "templateLink": "https://raw.githubusercontent.com/Sitecore/sitecore-azure-quickstart-templates/master/SitecoreManagementServices/xm/azuredeploy.json",
    "parameters":
    {
      "sitecoreManagementServicesMsDeployPackageUrl": "<URL of the WDP file for SitecoreManagementServices *.scwdp>"
    }
  }
```

* Configure Bootloader module according to [MODULES.md](../../MODULES.md). 
> **Note**. The Bootloader module should be placed after the SitecoreManagementServices.