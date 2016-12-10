# Sitecore AM Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com/ivansharamok/Sitecore-Azure-Quickstart-Templates/master/Sitecore%208.2.1/am/azuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This environment has CM and CD Sitecore applications that connect to already existing resources such as databases, Azure Search, Redis cache and AppInsights.  
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
  * Redis cache service details  
    * Host name
    * SSL port
    * Password

## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

>Note that CM and CD MSDeploy packages must be customized for the deployment process to work properly.

| Parameter               | Description
--------------------------|------------------------------------------------
| sqlserver.name          | The name of the administrator account for the newly created Azure SQL server.
| app.cm.msdeploy.packageurl  | The blob storage url to a Sitecore XM Content Management Web Deploy package.
| app.cd.msdeploy.packageurl  | The blob storage url to a Sitecore XM Content Delivery Web Deploy package.
| core.sqldatabase.name | The name of existing Core database 
| master.sqldatabase.name | The name of existing Master database
| web.sqldatabase.name | The name of existing Web database
| cm.core.sqldatabase.username | The name of existing Core database user
| cm.core.sqldatabase.password | Core database user passowrd
| cm.master.sqldatabase.username | The name of existing Master database user
| cm.master.sqldatabase.password | Master database user passowrd
| cm.web.sqldatabase.username | The name of existing Web database user
| cm.web.sqldatabase.password | Web database user passowrd
| cd.core.sqldatabase.username | The name of existing Core database user for CD SQL instance
| cd.core.sqldatabase.password | Core database user passowrd for CD SQL instance
| cd.web.sqldatabase.username | The name of existing Web database user for CD SQL instance
| cd.web.sqldatabase.password | Web database user passowrd for CD SQL instance
| searchservice.name | The name of existing Azure Search Service
| searchservice.apiKey | The apiKey for the search service
| rediscache.hostname | The name of Redis cache service
| rediscache.sslPort | Redis service SSL port number
| rediscache.password | Redis service passowrd
| applicationinsights.instrumentationKey | The instrumentation key for existing AppInsights instance.

