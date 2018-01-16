# Sitecore XM Single Environment

Visualize: 
[Infrastructure](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxmsingle%2Fnested%2Finfrastructure.json),
[Application deployment](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxmsingle%2Fnested%2Fapplication.json)


This template creates a Sitecore XM Single Environment using a minimal set of Azure resources while still ensuring Sitecore will run. It is best practice to use this configuration for development and testing rather than production environments.

Resources provisioned:

  * Azure SQL databases : core, master, web, forms
  * Sitecore roles: Content Delivery, Content Management as a single WebApp instance
	  * Hosting plans: single hosting plan
	  * Preconfigured Web Application, based on the provided WebDeploy package
  * Azure Search Service
  * Application Insights for diagnostics and monitoring  

## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword                     | The new password for the Sitecore **admin** account.
| singleMsDeployPackageUrl                  | The HTTP(s) URL to a Sitecore XM Single Instance Web Deploy package.