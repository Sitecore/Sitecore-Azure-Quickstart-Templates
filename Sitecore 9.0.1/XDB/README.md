# Sitecore XDB Environment

Visualize:
[Infrastructure](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxdb%2Fnested%2Finfrastructure.json),
[Application deployment](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxdb%2Fnested%2Fapplication.json)

This template creates a Sitecore XDB Environment with all resources necessary to run Sitecore Experience Database.

Resources provisioned:

  * Azure SQL databases : core, master, web, reporting, pools, tasks, refdata, smm, shard0, shard1, ma
  * Sitecore roles: Processing, Reporting
	* Hosting plans: one per role
	* Preconfigured Web Applications, based on the provided WebDeploy packages
  * XConnect services: Search, Collection, Reference data, Marketing Automation, Marketing Automation Reporting
	* Hosting plans: XConnect Basic, XConnect Resource Intensive
	* Preconfigured Web Applications, based on the provided WebDeploy packages
  * Azure Search Service
  * Application Insights for diagnostics and monitoring

## Parameters

The **deploymentId** and **licenseXml** parameters in azuredeploy.parameters.json are to be filled in by the PowerShell script using **Name** and **LicenseXmlPath** parameters respectively.

|Parameter                                  | Description
--------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------
| location                                  | The geographical region of the current deployment.
| sqlServerLogin                            | The name of the administrator account for Azure SQL server that will be created.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword                     | The new password for the Sitecore **admin** account.
| repAuthenticationApiKey                   | A unique value (e.g. a GUID) that will be used as authentication key for communication between Content Management and the Reporting Web App. **Note: The minimal required length is 32 symbols**
| prcMsDeployPackageUrl                     | The HTTP(s) URL to a Sitecore XDB Processing Web Deploy package.
| repMsDeployPackageUrl                     | The HTTP(s) URLl to a Sitecore XDB Reporting Web Deploy package.
| xcRefDataMsDeployPackageUrl               | The HTTP(s) URL to a XConnect Reference Data service Web Deploy package.
| xcCollectMsDeployPackageUrl               | The HTTP(s) URL to a XConnect Collection service Web Deploy package.
| xcSearchMsDeployPackageUrl                | The HTTP(s) URL to a XConnect Search service Web Deploy package.
| maOpsMsDeployPackageUrl                   | The HTTP(s) URL to a Marketing Automation service Web Deploy package.
| maRepMsDeployPackageUrl                   | The HTTP(s) URL to a Marketing Automation Reporting service Web Deploy package.
| authCertificateBlob                       | A Base64-encoded blob of the authentication certificate in PKCS #12 format.
| authCertificatePassword                   | A password to the authentication certificate.

> **Note:**
> * The **searchServiceLocation** parameter can be added to the `azuredeploy.parameters.json`
> to specify geographical region to deploy Azure Search Service. Default value is the resource
> group location.
> * The **applicationInsightsLocation** parameter can be added to the`azuredeploy.parameters.json`
> to specify geographical region to deploy Application Insights. Default value is **East US**.