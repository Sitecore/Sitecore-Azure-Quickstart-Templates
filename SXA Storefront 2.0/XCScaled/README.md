# Sitecore Experience Accelerator Storefront (SXA Storefront) module for Sitecore XP Environment


This template deploys the SXA Storefront module into a Sitecore XP Environment. SXA Storefront requires Sitecore XC and SXA modules.

SXA Storefront 2.0 is compatible with: Sitecore XP 9.1.1, Sitecore XC 9.1.0, SXA 1.8.1 (SXA 1.8 ARM template applies).

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| location                                     | The geographical region of the current deployment.
| siteTitle                                    | Long title of the Storefront site.
| sqlServerLogin                               | The name of the administrator account for Azure SQL server that will be created.
| sqlServerPassword                            | The password for the administrator account for Azure SQL server.
| sxaMsDeployPackageUrl                        | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Web Deploy package (not an SXA Web Deploy package).
| sxaStorefrontMsDeployPackageUrl              | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Storefront Web Deploy package.
| sxaHabitatCatalogMsDeployPackageUrl          | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Habitat Catalog Web Deploy package.
| sxaStorefrontThemesMsDeployPackageUrl        | The HTTP(s) URL of the Sitecore Commerce Experience Accelerator Storefront Themes Web Deploy package
