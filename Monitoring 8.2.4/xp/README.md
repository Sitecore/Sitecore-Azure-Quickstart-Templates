# Azure Monitoring module for Sitecore XP Environment

This template deploys the Sitecore Application Level Monitoring module and its related resources into a Sitecore XP environment.

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| deploymentId                              | The prefix of the Sitecore resources names within a resource group.
| omsWorkspaceMetricsRetentionDays          | The number of days OMS will retain data.
| omsWorkspaceAlertRecipients               | List of email addresses for people to recieve alerts. 
| omsWorkspaceLocation                      | The location of the provisioned OMS.
| applicationInsightsLocation               | The location of the provisioned application insights.

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
		"omsWorkspaceLocation" : "<OMS Workspace location, must be supported by Azure>",
		"applicationInsightsLocation" : "<location of the application insight associated with Sitecore>"
    }
}
```