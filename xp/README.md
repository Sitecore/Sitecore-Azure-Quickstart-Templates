# Sitecore XP Environment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2Fxp%2Fazuredeploy.json%3Ftoken=AVW1UolY8W67945TYrA1EL2XrSq-Ib0Dks5YL9mjwA%3D%3D" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FSitecore%2Fsitecore-azure-quickstart-templates%2Fmaster%2Fxp%2Fazuredeploy.json%3Ftoken=AVW1UolY8W67945TYrA1EL2XrSq-Ib0Dks5YL9mjwA%3D%3D" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template creates a Sitecore XP Environment with all resources necessary to run Sitecore.

Resources provisioned:
 
  * Azure SQL databases : core, master, web, reporting
  * Azure Search Service for content search
  * Azure Redis Cache for session state
  * Application Insights for diagnostics and monitoring
  * 4 Sitecore roles: Content Delivery, Content Management, Processing and Reporting
  
    * Hosting plans: one per role
    * Preconfigured Web Applications, based on the provided WebDeploy packages

