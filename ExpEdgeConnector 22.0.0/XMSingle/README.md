# Sitecore Sitecore ExperienceEdge Connector module for Sitecore XM0 Environment

This template deploys Sitecore ExperienceEdge Connector module into a Sitecore XM0 (XMSingle) Environment (single all-in-one instance).

## Parameters for Sitecore ExperienceEdge Connector

The **deploymentId**  parameter is filled in by the PowerShell script.

| Parameter                     | Description                                                                                                                                 |
| :---------------------------- | :-------------------------------------------------------------------------------------------- |
| deploymentId                  | DeploymentID used to generate infrastructure.                                                 |
| location                      | Infrastructure deployment location.                                                           |
| msDeployPackageUrl            | The HTTP(s) URL of a Sitecore ExperienceEdge Connector Web Deploy package.                    |
| xeConnectionString            | The connection string  of the ExperienceEdge                                                  |

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore ExperienceEdge Connector module:

- Add the following snippet to the `modules` parameter:

```JSON
  {
    "name": "xe",
    "templateLink": "<URL of the azuredeploy.json file of the corresponding topology *.azuredeploy.json>",
    "parameters":
    {
      "msDeployPackageUrl": "<URL of the WDP file for Sitecore ExperienceEdge Connector *.scwdp>",
      "xeConnectionString": "<ExperienceEdge connection string>"
    }
  }
```

- Configure Bootloader module according to [MODULES.md](../../MODULES.md).

> **Note**. The Bootloader module should be placed after the Sitecore ExperienceEdge Connector module.
