# Sitecore XM Single Environment

Visualize:
[Infrastructure](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxmsingle%2Fnested%2Finfrastructure.json),
[Application deployment](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2FSitecore%209.0.0%2Fxmsingle%2Fnested%2Fapplication.json)

This template creates a Sitecore XM Single Environment using a minimal set of Azure resources while still ensuring Sitecore will run. It is best practice to use this configuration for development and testing rather than production environments.

Resources provisioned:

* Azure SQL databases : core, master, web, forms
* Sitecore Identity Server, deployed as an ARM module
* Sitecore roles: Content Delivery, Content Management as a single WebApp instance
  * Hosting plans: single hosting plan
  * Preconfigured Web Application, based on the provided WebDeploy package
* (optional) Application Insights for diagnostics and monitoring

> **Note:**
> * The **applicationInsightsLocation** parameter can be added to the`azuredeploy.parameters.json`
>   to specify geographical region to deploy Application Insights. Default value is **East US**.
> * The **useApplicationInsights** parameter can be added to the`azuredeploy.parameters.json`
>   to control whether Application Insights will be used for diagnostics and monitoring. Default value is **true**.

## Parameters
The **deploymentId** and **licenseXml** parameters are filled in by the PowerShell script.

| Parameter                                 | Description
|-------------------------------------------|------------------------------------------------
| sqlServerLogin                            | The name of the administrator account for the newly created Azure SQL server.
| sqlServerPassword                         | The password for the administrator account for Azure SQL server.
| sitecoreAdminPassword                     | The new password for the Sitecore **admin** account.
| singleMsDeployPackageUrl                  | The HTTP(s) URL to a Sitecore XM Single Instance Web Deploy package.
| authCertificateBlob                       | A Base64-encoded blob of the authentication certificate in PKCS #12 format.
| authCertificatePassword                   | A password to the authentication certificate.

## Deploying Identity Server

Sitecore Identity Server is deployed as an ARM module via the **modules** parameter, not as a top-level master-template parameter. Configure the default **identity-server** entry in `azuredeploy.parameters.json`. See [MODULES.md](../MODULES.md) for full module syntax.

| Parameter | Location | Description
|-----------|----------|------------
| templateLink | `modules.items[]` | The HTTP(s) URL to the Identity Server ARM template.
| siMsDeployPackageUrl | `modules.items[].parameters` | The HTTP(s) URL to a Sitecore Identity Server Web Deploy package.

## Using an externally provisioned Identity Server

If Sitecore Identity Server is hosted outside this deployment, remove the **identity-server** entry from the `modules` parameter and set the optional top-level **siInstanceUrl** parameter in `azuredeploy.parameters.json` to the Identity Server authority URL (for example, `https://identity.example.com`).

Sitecore roles use this URL for authentication. When Identity Server is deployed as a module with this template, leave **siInstanceUrl** empty to use the default `https://{deploymentId}-si.azurewebsites.net`.

## Deploying with Solr Search

> Sitecore Solr PaaS deployment requires the following parameter to be specified in `azuredeploy.parameters.json`:

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| solrConnectionString                      | Connection string to existing Solr server.

> **solrConnectionString** parameter is used to identify whether Solr search provider is to be used for the deployment or not.
