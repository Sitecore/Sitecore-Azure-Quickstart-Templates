# Sitecore AM0 Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com/ivansharamok/Sitecore-Azure-Quickstart-Templates/master/Sitecore%208.2.1/am0/azuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This environment has a single instance Sitecore application that connects to already existing resources such as databases, Azure Search and AppInsights. This template does not use Redis cache instance.  
>This template can be used for educational and testing purposes when Redis cache isn't needed and all databases could be hosted on the same Azure SQL instance.

Resources provisioned:  
  * Single Sitecore role: Content Management
    * Hosting plan
    * Preconfigured Web Application, based on the provided WebDeploy package

Parameters that need to be provided:  
  * Azure SQL instance
  * Azure SQL databases 
    * core db name, user name, user passowrd 
    * master db name, user name, user passowrd
    * web db name, user name, user passowrd
  * Azure Search Service details
    * search service name
    * search service apiKey
  * Application Insights instrumentation key
  *     
## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter               | Description
--------------------------|------------------------------------------------
| sqlserver.name          | The name of the administrator account for the newly created Azure SQL server.
| app.cm.msdeploy.packageurl  | The blob storage url to a Sitecore XM Content Management Web Deploy package.
| core.sqldatabase.name | The name of existing Core database 
| master.sqldatabase.name | The name of existing Master database
| web.sqldatabase.name | The name of existing Web database
| cm.core.sqldatabase.username | The name of existing Core database user
| cm.core.sqldatabase.password | Core database user passowrd
| cm.master.sqldatabase.username | The name of existing Master database user
| cm.master.sqldatabase.password | Master database user passowrd
| cm.web.sqldatabase.username | The name of existing Web database user
| cm.web.sqldatabase.password | Web database user passowrd
| searchservice.name | The name of existing Azure Search Service
| searchservice.apiKey | The apiKey for the search service
| applicationinsights.instrumentationKey | The instrumentation key for existing AppInsights instance.

