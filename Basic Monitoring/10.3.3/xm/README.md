# Azure Monitoring module for Sitecore XM Environment

This template deploys the Sitecore Application Level Monitoring module and its related resources into a Sitecore XM environment.

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                 | Description
--------------------------------------------|------------------------------------------------
| deploymentId                              | The prefix of the Sitecore resources names within a resource group.
| alertLocation                             | The location where Alert will be provisioned.
| alertRecipients                           | List of email addresses for people to receive alerts.
| applicationInsightsLocation               | The location of the provisioned application insights.
| searchProvider                            | Types of Search Provider, Azure or Solr.
| setLogAnalyticsAlert                      | Set daily cap alert for OMS instead of application insights.
| deploymentScriptsLocation                 | Specifies the Azure region for the Microsoft.Resources/deploymentScripts resource, overriding the original Alert location if that location isn’t yet supported by `Microsoft.Resources/deploymentScripts`.

## Deploying as part of Sitecore deployment

Steps to configure the Sitecore deployment parameters to include the Application Level Monitoring module:

  * Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "monitoring",
    "templateLink": "<placeholder>",
    "parameters": {
        "alertRecipients" : "<emails separated by a semicolon>",
        "alertLocation" : "<Alert location, must be supported by Azure>",
        "applicationInsightsLocation" : "<location of the application insight associated with Sitecore>",
        "searchProvider" : "<Azure or Solr>",
        "setLogAnalyticsAlert": <boolean value. true if using classic application insights, false if using workspace-based application insights>
    }
}
```
