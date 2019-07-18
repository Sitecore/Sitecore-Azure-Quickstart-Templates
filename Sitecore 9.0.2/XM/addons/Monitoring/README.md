# Azure Monitoring module for Sitecore XM Environment

This template deploys the Sitecore Application Level Monitoring module and its related resources into a Sitecore XM environment.

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| deploymentId                              | The prefix of the Sitecore resources names within a resource group.
| omsWorkspaceMetricsRetentionDays          | The number of days OMS will retain data.
| omsWorkspaceAlertRecipients               | List of email addresses for people to recieve alerts. 
| omsWorkspaceLocation                      | The location of the provisioned OMS.
| applicationInsightsLocation               | The location of the provisioned application insights.
| searchProvider                            | Types of Search Provider, Azure or Solr.

## Deploying as part of Sitecore deployment

Steps to configure the Sitecore deployment parameters to include the Application Level Monitoring module:

  * Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "monitoring",
    "templateLink": "<placeholder>",
    "parameters": {
        "omsWorkspaceMetricsRetentionDays" : <integer value. free plans are always 7, other plans comes with 31 by default>,
		"omsWorkspaceAlertRecipients" : "<emails seperated by a semi colon>",
		"omsWorkspaceLocation" : "<Australia Southeast, Canada Central, Central India, East US, Japan East, Southeast Asia, UK South or West Europe>",
    "applicationInsightsLocation" : "<location of the application insight associated with Sitecore>",
    "searchProvider" : "<Azure or Solr>"
    }
}
```