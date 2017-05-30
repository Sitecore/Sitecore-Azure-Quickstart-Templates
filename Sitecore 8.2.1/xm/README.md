# Sitecore XM Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%208.2.1%2Fxm%2Fazuredeploy.json%3Ftoken=AVW1Ug5RN1ZFpjUwqAajiNyO-D8COvpzks5YL89jwA%3D%3D" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a Sitecore XM Environment with all resources necessary to run Sitecore.

Resources provisioned:
 
  * Azure SQL databases : core, master, web
  * Azure Search Service for content search
  * Azure Redis Cache for session state
  * Application Insights for diagnostics and monitoring
  * 2 Sitecore roles: Content Delivery, Content Management

    * Hosting plans: one per role
    * Preconfigured Web Applications, based on the provided WebDeploy packages
    
## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter               | Description
--------------------------|------------------------------------------------
| sqlserver.login         | The name of the administrator account for the newly created Azure SQL server.
| sqlserver.password      | The password for the administrator account for Azure SQL server.
| sitecore.admin.password | The new password for the Sitecore **admin** account.
| cm.msdeploy.packageurl  | The blob storage url to a Sitecore XM Content Management Web Deploy package.
| cd.msdeploy.packageurl  | The blob storage url to a Sitecore XM Content Delivery Web Deploy package.
| sitecoreSKU             | Name of Sitecore configuration (one of xM1, xM2, xM3, xM4, xM5).

