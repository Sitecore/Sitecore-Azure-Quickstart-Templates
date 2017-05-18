# Sitecore XP0 Environment

Visualize: 
[Infrastructure](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%208.2.3%2Fxp0%2Fnested%2Finfrastructure.json),
[Application deployment](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%208.2.3%2Fxp0%2Fnested%2Fapplication.json)


This template creates a Sitecore XP0 Environment (single all-in-one instance) with all resources necessary to run Sitecore.

Resources provisioned:

  * Azure SQL databases : core, master, web, reporting
  * Azure Search Service for content search
  * Application Insights for diagnostics and monitoring
  * Azure WebApp Hosting plan
  * Preconfigured Web Application, based on the provided WebDeploy package

## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword                     | The new password for the Sitecore **admin** account.
| singleMsDeployPackageUrl                  | The blob storage url to a Sitecore XP Single Instance Web Deploy package.
| analyticsMongoDbConnectionString          | A MongoDB connection string for the analytics database.
| trackingLiveMongoDbConnectionString       | A MongoDB connection string for the tracking.live database.
| trackingHistoryMongoDbConnectionString    | A MongoDB connection string for the tracking.history database.
| trackingContactMongoDbConnectionString    | A MongoDB connection string for the tracking.contact database.

