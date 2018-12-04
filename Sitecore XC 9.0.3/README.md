# Sitecore Experience Commerce module for Sitecore XP Environment


This template deploys the Sitecore Experience Commerce (Sitecore XC) module into a Sitecore XP Environment.  

Sitecore XC 9.0.3 is compatible with: Sitecore XP 9.0.2, SXA 1.8, SXA Storefront 1.4

## Parameters

The **deploymentId** parameter is filled in by the PowerShell script.

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| location                                     | The geographical region of the current deployment.
| sitecoreAdminPassword                        | The new password for the Sitecore **admin** account.
| sitecoreDomain                               | The domain name of the Siteore account with which the Commerce Engine communicates.
| sitecorePassword                             | The password corresponding to the SitecoreDomain.
| sqlServerName                                | The name of the SQL server used to host Commerce Engine databases.
| sqlServerLogin                               | The name of the administrator account for Azure SQL server that will be created.
| sqlServerPassword                            | The password for the administrator account for Azure SQL server.
| authCertificateBlob                          | A Base64-encoded blob of the authentication certificate in PKCS #12 format.
| authCertificatePassword                      | A password to the authentication certificate.
| commerceConnectMsDeployPackageUrl            | The HTTP(s) URL of the Sitecore Commerce Connect Core Web Deploy package.
| commerceEngineCloudMsDeployPackageUrl        | The HTTP(s) URL of the Sitecore.Commerce.Engine Web Deploy package.
| commerceEngineConnectCdMsDeployPackageUrl    | The HTTP(s) URL of the Sitecore.Commerce.Engine.Connect.CD Web Deploy package.
| commerceEngineConnectCmMsDeployPackageUrl    | The HTTP(s) URL of the Sitecore.Commerce.Engine.Connect.CM Web Deploy package.
| idServerCloudMsDeployPackageUrl              | The HTTP(s) URL of the Sitecore.IdentityServer Web Deploy package.
| bizfxCloudMsDeployPackageUrl                 | The HTTP(s) URL of the Sitecore.BizFX Web Deploy package.
| adventureWorksImagesDeployPackageUrl         | The HTTP(s) URL of the Adventure Works Images Web Deploy package.
| habitatImagesDeployPackageUrl                | The HTTP(s) URL of the Sitecore.Commerce.Habitat.Images Web Deploy package.
| indexWorkerDefinitionsDeployPackageUrl       | The HTTP(s) URL of the Sitecore Commerce Connect Schema Definitions for IndexWorker Web Deploy package.
| xConnectDefinitionsDeployPackageUrl          | The HTTP(s) URL of the Sitecore Commerce Connect Schema Definitions for xConnect Web Deploy package.
| xProfileCoreDeployPackageUrl                 | The HTTP(s) URL of the Sitecore Commerce ExperienceProfile Core Web Deploy package.
| xAnalyticsCoreDeployPackageUrl               | The HTTP(s) URL of the Sitecore Commerce ExperienceAnalytics Core Web Deploy package.
| maCoreDeployPackageUrl                       | The HTTP(s) URL of the Sitecore Commerce MarketingAutomation Core Web Deploy package.
| maAzureDeployPackageUrl                      | The HTTP(s) URL of the Sitecore Commerce MarketingAutomation for Azure Web Deploy package.
| braintreeMerchantId                          | The Braintree gateway account unique identifier, including any merchant accounts.  
| braintreePublicKey                           | The user-specific public key identifier.
| braintreePrivateKey                          | The user-specific private key identifier.
| braintreeEnvironment                         | Specifies where requests via the API are directed – sandbox or production. 
| environmentName                              | The Commerce Engine environment serving the Storefront site.
| defaultShopName                              | The name of the Storefront site.
| defaultShopCurrency                          | The default currency currency, e.g. "USD".
| defaultShopLanguage                          | The default language configured language, e.g. "en".



## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include the Sitecore XC module:

* Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "Commerce",
    "templateLink": "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%20XC%209.0.0/azuredeploy.json",
    "parameters": {
        "templateLinkAccessToken": "<SAS-token>",
        "commerceConnectMsDeployPackageUrl": "<URL for WDP>",
        "commerceEngineCloudMsDeployPackageUrl": "<URL for WDP>",
        "commerceEngineConnectCdMsDeployPackageUrl": "<URL for WDP>",
        "commerceEngineConnectCmMsDeployPackageUrl": "<URL for WDP>",
        "idServerCloudMsDeployPackageUrl": "<URL for WDP>",
        "bizfxCloudMsDeployPackageUrl": "<URL for WDP>",
        "adventureWorksImagesDeployPackageUrl": "<URL for WDP>",
        "habitatImagesDeployPackageUrl": "<URL for WDP>",
        "indexWorkerDefinitionsDeployPackageUrl": "<URL for WDP>",
        "xConnectDefinitionsDeployPackageUrl": "<URL for WDP>",
        "xProfileCoreDeployPackageUrl": "<URL for WDP>",
        "xAnalyticsCoreDeployPackageUrl": "<URL for WDP>",
        "maCoreDeployPackageUrl": "<URL for WDP>",
        "maAzureDeployPackageUrl": "<URL for WDP>",
        "braintreeMerchantId": "<merchant ID for Braintree account>",
        "braintreePublicKey": "<public key for Braintree account>",
        "braintreePrivateKey": "<private key for Braintree account>",
        "braintreeEnvironment": "<Braintree environment>",
        "environmentName": "<environment name>",
        "defaultShopName": "<default shop name>",
        "defaultShopCurrency": "<default shop currency>",
        "defaultShopLanguage": "<default shop language>"
    }
},
```

* Configure Bootloader module according to [Modules.md](../MODULES.md)
> **Note**. The Bootloader module should be placed after the Commerce module, and (if applicable) after the SXA and SXA-SF modules.