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
  * (optional) Application Insights for diagnostics and monitoring


## Parameters
The **deploymentId** and **licenseXml** parameters are to be filled in by the PowerShell script.

| Parameter               | Description
|-------------------------|------------------------------------------------
| sqlServerLogin          | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword       | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword   | The new password for the Sitecore **admin** account.
| siMsDeployPackageUrl    | The HTTP(s) URL to a Sitecore Identity Server Web Deploy package.
| cmMsDeployPackageUrl    | The HTTP(s) URL to a Sitecore XM Content Management Web Deploy package.
| cdMsDeployPackageUrl    | The HTTP(s) URL to a Sitecore XM Content Delivery Web Deploy package.
| authCertificateBlob     | A Base64-encoded blob of the authentication certificate in PKCS #12 format.
| authCertificatePassword | A password to the authentication certificate.

> **Note:**
> * The **searchServiceLocation** parameter can be added to the `azuredeploy.parameters.json`
> to specify geographical region to deploy Azure Search Service. Default value is the resource
> group location.
> * The **applicationInsightsLocation** parameter can be added to the`azuredeploy.parameters.json`
> to specify geographical region to deploy Application Insights. Default value is **East US**.
> * The **useApplicationInsights** parameter can be added to the`azuredeploy.parameters.json`
> to control whether Application Insights will be used for diagnostics and monitoring. Default value is **true**.

## Deploying with Solr Search

> Sitecore Solr PaaS deployment requires the following parameter to be specified in `azuredeploy.parameters.json`:

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| solrConnectionString                      | Connection string to existing Solr server.

> **solrConnectionString** parameter is used to identify whether Solr search provider is to be used for the deployment or not. 
> The default value is empty which means that Azure Search will be used.

## Deploying with App Service Environment v2
> **Note**: Application Service Environment is not provisioned as part of this deployment template. Please reffer to official [documentation](https://docs.microsoft.com/en-us/azure/app-service/environment/intro) for information about ASE deployment and configuration. 

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| aseName                                   | Name of deployed App Service Environment
| aseResourceGroupName                      | Resource group where App Service Environment is deployed. Provide this value if ASE is hosted in different resouce group