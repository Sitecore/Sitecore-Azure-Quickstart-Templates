# Sitecore XP0 Environment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2Fxp0%2Fazuredeploy.json%3Ftoken=AVW1UsNp5u63Lh0mx7MveORnAdMtxRygks5YL9ZcwA%3D%3D" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2Fxp0%2Fazuredeploy.json%3Ftoken=AVW1UsNp5u63Lh0mx7MveORnAdMtxRygks5YL9ZcwA%3D%3D" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a Sitecore XP0 Environment (single all-in-one instance) with all resources necessary to run Sitecore.

Resources provisioned:
 
  * Azure SQL databases : core, master, web, reporting
  * Azure Search Service for content search
  * Azure Redis Cache for session state
  * Application Insights for diagnostics and monitoring
  * Azure WebApp Hosting plan
  * Preconfigured Web Application, based on the provided WebDeploy package
  
## Parameters
The **deploymentid** and **licenseXml** are filled in by the PowerShell script.

#### sqlserver.login
The name of the Azure SQL db account to create.

#### sqlserver.password
The password for new Azure SQL db account.

#### sitecore.admin.password
The new password for the Sitecore **admin** account.

#### cm.msdeploy.packageurl
The blob storage url to a Sitecore XP Content Management Web Deploy package.

#### cd.msdeploy.packageurl
The blob storage url to a Sitecore XP Content Deliver Web Deploy package.

#### prc.msdeploy.packageurl
The blob storage url to a Sitecore XP Processing Web Deploy package.

#### rep.msdeploy.packageurl
The blob storage url to a Sitecore XP Reporting Web Deploy package.

#### rep.authentication.apikey
A unique value (e.g. a GUID) that will be used as authentication when communicating to the Reporting Web App.

#### analytics.mongodb.connectionstring
A mongoDB connection string for the analytics database.

#### tracking.live.mongodb.connectionstring
A mongoDB connection string for the live database.

#### tracking.history.mongodb.connectionstring
A mongoDB connection string for the history database.

#### tracking.contact.mongodb.connectionstring
A mongoDB connection string for the contact database.

