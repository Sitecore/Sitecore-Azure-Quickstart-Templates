# Sitecore XDB Environment

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%208.2.1%2Fxm%2Fazuredeploy.json%3Ftoken=AVW1Ug5RN1ZFpjUwqAajiNyO-D8COvpzks5YL89jwA%3D%3D" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a Sitecore XDB Environment with all resources necessary to run Sitecore.

Resources provisioned:

  * Azure SQL databases : core, master, web, reporting
  * Azure Search Service for content search
  * Application Insights for diagnostics and monitoring
  * 2 Sitecore roles: Processing, Reporting

    * Hosting plans: one per role
    * Preconfigured Web Applications, based on the provided WebDeploy packages

## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter                                | Description
-------------------------------------------|------------------------------------------------
| sqlServerLogin                           | The name of the administrator account for the newly created Azure SQL server.
| sqlserver.password                       | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword                    | The new password for the Sitecore **admin** account.
| prcMsDeployPackageUrl                    | The blob storage url to a Sitecore XDB Processing Web Deploy package.
| repMsDeployPackageUrl                    | The blob storage url to a Sitecore XDB Reporting Web Deploy package.
| repAuthenticationApiKey                  | A unique value (e.g. a GUID) that will be used as authentication when communicating from Content Management to the Reporting Web App.
| analyticsMongoDbConnectionString         | A MongoDB connection string for the analytics database.
| trackingLiveMongoDbConnectionString      | A MongoDB connection string for the tracking.live database.
| trackingHistoryMongoDbConnectionString   | A MongoDB connection string for the tracking.history database.
| trackingContactMongoDbConnectionString   | A MongoDB connection string for the tracking.contact database.

## Deploying with Solr Search
> **solrConnectionString** is a link to the Solr search service. The parameter specifies whether Solr
> search will be used for the deployment or not. The default value is empty which means that Azure Search
> will be used. In the case where solrConnectionString is populated with the Solr search connection string,
> the following parameters should be additionally specified in `azuredeploy.parameters.json`:

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| bootloaderMsDeployPackageUrl              | Specifies a blob storage url to a bootloader Web Deploy package. 
| prcSolrConfigurationMsDeployPackageUrl    | Specifies a blob storage url to Solr **PRC** configuration Web Deploy package.
| repSolrConfigurationMsDeployPackageUrl    | Specifies a blob storage url to Solr **REP** configuration Web Deploy package.

> **Note:**
> * The **searchServiceLocation** parameter can be added to the `azuredeploy.parameters.json`
> to specify geographical region to deploy Azure Search Service. Default value is the resource
> group location.
> * The **applicationInsightsLocation** parameter can be added to the`azuredeploy.parameters.json`
> to specify geographical region to deploy Application Insights. Default value is **East US**.