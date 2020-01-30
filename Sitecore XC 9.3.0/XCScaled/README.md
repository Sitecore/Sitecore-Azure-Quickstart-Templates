# Sitecore Experience Commerce module for Sitecore XP Environment


This template deploys the Sitecore Experience Commerce (Sitecore XC) module into a Sitecore XP Environment.  

Sitecore XC 9.3.0 is compatible with: Sitecore XP 9.3.0, SXA 9.3.0, SXA Storefront 4.0

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
