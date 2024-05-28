# Azure Monitoring module for Sitecore XP Environment

This template deploys the Sitecore Application Level Monitoring module and its related resources into a Sitecore XP environment.

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| deploymentId                              | The prefix of the Sitecore resources names within a resource group.
| provisionOMSWorkspace                     | Provision Log Analytics workspace (OMS).
| omsWorkspaceMetricsRetentionDays          | The number of days OMS will retain data (if `provisionOMSWorkspace` is `true`).
| omsWorkspaceLocation                      | The location where OMS will be provisioned (if `provisionOMSWorkspace` is `true`).
| omsWorkspaceAlertRecipients               | List of email addresses for people to receive alerts.
| applicationInsightsLocation               | The location of the provisioned application insights.
| searchProvider                            | Types of Search Provider, Azure or Solr.
| setLogAnalyticsAlert                      | Set daily cap alert for OMS instead of application insights.

## Deploying as part of Sitecore deployment

Steps to configure the Sitecore deployment parameters to include the Application Level Monitoring module:

  * Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "monitoring",
    "templateLink": "<placeholder>",
    "parameters": {
        "omsWorkspaceMetricsRetentionDays" : <integer value. free plans are always 7, other plans comes with 31 by default>,
        "omsWorkspaceAlertRecipients" : "<emails separated by a semicolon>",
        "omsWorkspaceLocation" : "<OMS Workspace location, must be supported by Azure>",
        "applicationInsightsLocation" : "<location of the application insight associated with Sitecore>",
        "searchProvider" : "<Azure or Solr>",
        "setLogAnalyticsAlert": <boolean value. true if using classic application insights, false if using workspace-based application insights>
    }
}
```
