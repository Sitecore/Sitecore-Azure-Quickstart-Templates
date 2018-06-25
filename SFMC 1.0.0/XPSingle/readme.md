# Sitecore Connect for Salesforce Marketing Cloud module for Sitecore XP Single Environment

This template deploys Sitecore Connect for Salesforce Marketing Cloud module into a Sitecore XP Single Environment.

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| infrastructure.value.sqlServerFqdn           | The fully qualified domain name of Azure SQL server.
| sqlServerLogin                               | The name of the administrator account for Azure SQL server.
| sqlServerPassword                            | The password for the administrator account for Azure SQL server.
| coreSqlDatabaseName                          | The name of the Core database.
| masterSqlDatabaseName                        | The name of the Master database.
| singleWebAppName                             | The name of the Web App service, created for Single instance.
| sfmcClientId                                 | The API client ID generated on SFMC side.
| sfmcClientSecret                             | The API client secret generated on SFMC side.
| sfmcMsDeployPackageUrl                       | The HTTP(s) URL of a Sitecore Connect for Salesforce Marketing Cloud WDP package.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Connect for Salesforce Marketing Cloud:

  * Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "sfmc",
    "templateLink": "<PUT LINK TO CONNECTOR.SFMC XP SINGLE ARM TEMPLATE HERE!!!>",
    "parameters": {
        "sfmcClientId" : "<Client ID generated on SFMC side>",
        "sfmcClientSecret" : "<Client secret generated on SFMC side>",
        "sfmcMsDeployPackageUrl" : "<URL of the Connector.Sfmc WDP file *.scwdp.zip>"
    }
}
```

  * Configure Bootloader module according to [Modules.md](../../MODULES.md)
  > **Note**. The Bootloader module should be placed after the Sitecore Connect for Salesforce Marketing Cloud.