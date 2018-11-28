# Sitecore Content Delivery Network Service Provider for Sitecore XP Environment

This template deploys Sitecore Content Delivery Network Service Provider for Sitecore XP Environment.

Resources provisioned:

- Microsoft CDN Service

## Parameters

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| deploymentId                                 | DeploymentID used to generate infrastructure.
| location                                     | Infrastructure deployment location.
| cdWebAppName                                 | The name of the Web App service, created for Sitecore Content Delivery instance.
| templateLinkAccessToken                      | Query string containing access token for the additional nested armtemplates
| hasCdnProvider                               | `Boolean` value to include existing CDN Service or to deploy new Azure CDN Service when cdn provider is not exist
| cdnSKU                                       | Required **CDN Profile SKU** value when `hasCdnProvider` property value is `false`, - Allowed value Premium_Verizon, Standard_Verizon, Standard_Akamai, Standard_Microsoft
| mediaLinkServerUrl                           | Required **CDN service url** value when `hasCdnProvider` property value is `true`
| mediaMaxAge                                  | The max-age to use in media response headers, CDN server uses this value as max-age of the response cache.
| cdnMsDeployPackageUrl                        | HTTP(s) URL to a Sitecore CDN Web Deploy package

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Content Delivery Network Service Provider:

- Add the following snippet to the `modules` parameter:

  ```JSON
  {
      "name": "cdn",
      "templateLink": "<Link to CDN module armtemplate>",
      "parameters": {
          "templateLinkAccessToken": "<Optional[string], query string of access token. Default: "">",
          "hasCdnProvider" : "<Optional[boolean], set to true if has existing CDN Service. Default: false>",
          "cdnSKU" : "<Required[string], CDN Profile SKU when 'hasCdnProvider' property is set to false, default: "Standard_Akamai">",
          "mediaLinkServerUrl" : "<Required[string], CDN Service endpoint url when 'hasCdnProvider' property is set to true, default: "">",
          "mediaMaxAge" : "<Optional[string], media item max age. Default: "7.00:00:00">",
          "cdnMsDeployPackageUrl" : "<Required[string], URL of the CDN WDP file *.scwdp.zip>"
      }
  }
  ```

- Configure Bootloader module according to [Modules.md](../../MODULES.md)
  > **Note**. The Bootloader module should be placed after this module.

**Important notice**

- When using `Premium_Verizon` as cdnSKU, the CDN profile need to be configure after the deployment succeed. Set up the **Query String Caching** value to **`unique-cache`**. Please refer to this [Azure documentation](https://docs.microsoft.com/en-us/azure/cdn/cdn-query-string-premium) for more information.
