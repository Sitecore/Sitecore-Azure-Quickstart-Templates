# Sitecore XDB Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%208.2.1%2Fxdb%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a Sitecore XDB Environment with all resources necessary to run Sitecore.

This environment is designed for use with on premise Sitecore XM installations and is compatible with Processing and Reporting Web Deploy packages for XP/XP1 configuration available on Sitecore Experience Platform [Download Page](https://dev.sitecore.net/Downloads/Sitecore_Experience_Platform.aspx). For hosting Sitecore Experience Platform on Azure PaaS use [Sitecore XP Environment](../xp) templates

Resources provisioned:
 
  * Azure SQL databases : core, master, web, reporting
  * Azure Search Service for Analytics index
  * Application Insights for diagnostics and monitoring
  * 2 Sitecore roles: Processing and Reporting
  
    * Hosting plans: one per role
    * Preconfigured Web Applications, based on the provided WebDeploy packages

## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

|Parameter                                  | Description
--------------------------------------------|----------------------------------------------------
| sqlserver.login                           | The name of the administrator account for Azure SQL server that will be created.
| sqlserver.password                        | The password for the administrator account for Azure SQL server.
| sitecore.admin.password                   | The new password for the Sitecore **admin** account.
| prc.msdeploy.packageurl                   | The blob storage url to a Sitecore XP Processing Web Deploy package.
| rep.msdeploy.packageurl                   | The blob storage url to a Sitecore XP Reporting Web Deploy package.
| rep.authentication.apikey                 | A unique value (e.g. a GUID) that will be used as authentication when communicating from Content Management to the Reporting Web App.
| analytics.mongodb.connectionstring        | A MongoDB connection string for the analytics database.
| tracking.live.mongodb.connectionstring    | A MongoDB connection string for the tracking.live database.
| tracking.history.mongodb.connectionstring | A MongoDB connection string for the tracking.history database.
| tracking.contact.mongodb.connectionstring | A MongoDB connection string for the tracking.contact database.
| sitecoreSKU                               | Name of Sitecore configuration (one of xDB1, xDB2, xDB3, xDB4, xDB5).
