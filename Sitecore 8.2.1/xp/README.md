# Sitecore XP Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%208.2.1%2Fxp%2Fazuredeploy.json%3Ftoken=AVW1UolY8W67945TYrA1EL2XrSq-Ib0Dks5YL9mjwA%3D%3D" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a Sitecore XP Environment with all resources necessary to run Sitecore.

Resources provisioned:
 
  * Azure SQL databases : core, master, web, reporting
  * Azure Search Service for content search
  * Azure Redis Cache for session state
  * Application Insights for diagnostics and monitoring
  * 4 Sitecore roles: Content Delivery, Content Management, Processing and Reporting
  
    * Hosting plans: one per role
    * Preconfigured Web Applications, based on the provided WebDeploy packages

## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

|Parameter                                  | Description
--------------------------------------------|----------------------------------------------------
| sqlserverLogin                           | The name of the administrator account for Azure SQL server that will be created.
| sqlserverPassword                        | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword                   | The new password for the Sitecore **admin** account.
| cm.msdeploy.packageurl                    | The blob storage url to a Sitecore XP Content Management Web Deploy package.
| cd.msdeploy.packageurl                    | The blob storage url to a Sitecore XP Content Delivery Web Deploy package.
| prc.msdeploy.packageurl                   | The blob storage url to a Sitecore XP Processing Web Deploy package.
| rep.msdeploy.packageurl                   | The blob storage url to a Sitecore XP Reporting Web Deploy package.
| rep.authentication.apikey                 | A unique value (e.g. a GUID) that will be used as authentication when communicating from Content Management to the Reporting Web App.
| analyticsMongodbConnectionstring        | A MongoDB connection string for the analytics database.
| trackingLiveMongodbConnectionstring    | A MongoDB connection string for the tracking.live database.
| trackingHistoryMongodbConnectionstring | A MongoDB connection string for the tracking.history database.
| trackingContactMongodbConnectionstring | A MongoDB connection string for the tracking.contact database.


