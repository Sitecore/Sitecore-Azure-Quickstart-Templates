# Sitecore XM Environment

Visualize: 
[Infrastructure](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxm%2Fnested%2Finfrastructure.json),
[Application deployment](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxm%2Fnested%2Fapplication.json)


This template creates a Sitecore XM Environment with all resources necessary to run Sitecore.

Resources provisioned:
 
  * Azure SQL databases : core, master, web, forms
  * Azure Redis Cache for session state
  * Sitecore roles: Content Delivery, Content Management
	  * Hosting plans: one per role
	  * Preconfigured Web Applications, based on the provided WebDeploy packages	
  * Azure Search Service
  * Application Insights for diagnostics and monitoring
  
    
## Parameters
The **deploymentId** and **licenseXml** parameters are to be filled in by the PowerShell script.

| Parameter               | Description
--------------------------|------------------------------------------------
| sqlServerLogin          | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword       | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword   | The new password for the Sitecore **admin** account.
| cmMsDeployPackageUrl    | The HTTP(s) URL to a Sitecore XM Content Management Web Deploy package.
| cdMsDeployPackageUrl    | The HTTP(s) URL to a Sitecore XM Content Delivery Web Deploy package.