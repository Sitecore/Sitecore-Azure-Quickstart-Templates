# Sitecore XM Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com/ivansharamok/Sitecore-Azure-Quickstart-Templates/master/Sitecore%208.2.1/xm0/azuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a single server Sitecore XM Environment without Redis cache resource. This template uses a single Azure SQL instance to host Sitecore databases.  
>This template can be used for educational and testing purposes when Redis cache isn't needed and all databases could be hosted on the same Azure SQL instance.

Resources provisioned:
  
  * Azure SQL instance
  * Azure SQL databases : core, master, web
  * Azure Search Service for content search
  * Application Insights for diagnostics and monitoring
  * Single Sitecore role: Content Management

    * Hosting plan
    * Preconfigured Web Application, based on the provided WebDeploy package
    
## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter               | Description
--------------------------|------------------------------------------------
| sqlserver.login         | The name of the administrator account for the newly created Azure SQL server.
| sqlserver.password      | The password for the administrator account for Azure SQL server.
| sitecore.admin.password | The new password for the Sitecore **admin** account.
| cm.msdeploy.packageurl  | The blob storage url to a Sitecore XM Content Management Web Deploy package.
| cd.msdeploy.packageurl  | The blob storage url to a Sitecore XM Content Delivery Web Deploy package.

