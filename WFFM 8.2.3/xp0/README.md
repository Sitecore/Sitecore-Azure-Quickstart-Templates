# Web Forms for Marketers module for Sitecore XP0 Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FWFFM%208.2.3%2Fxp0%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template deploys Web Forms for Marketers module into a Sitecore XP0 Environment (single all-in-one instance).

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| singleMsDeployPackageUrl                  | The blob storage URL of a Web Forms for Marketers Single Instance Web Deploy package.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Web Forms for Marketers:

  * Configure Bootloader module according to [Modules.md](../../Modules.md)
  * Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "wffm",
    "templateLink": "https://raw.githubusercontent.com/Sitecore/sitecore-azure-quickstart-templates/master/WFFM%208.2.3/xp0/azuredeploy.json",
    "parameters": {
        "singleMsDeployPackageUrl" : "<URL of the WDP file *_single.scwdp.zip>"
    }
}
```
