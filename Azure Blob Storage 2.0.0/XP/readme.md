# Sitecore Azure Blob Storage module for Sitecore XP Environment

This template deploys Sitecore Azure Blob Storage module into a Sitecore XP Environment.

## Parameters


| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| deploymentId                                 | DeploymentID used to generate infrastructure.
| location                                     | Infrastructure deployment location.
| cmWebAppName                                 | The name of the content management web App service.
| cdWebAppName                                 | The name of the content delivery web App service.
| exmDdsWebAppName                             | The name of the Exm dedicated dispatch server web App service.
| storageAccountName                           | The name of the storage account. Required when hasStorageAccount is `false`. The name you choose must be unique across Azure. The name also must be between 3 and 24 characters in length, and can include numbers and lowercase letters only
| hasStorageAccount                            | `Boolean` value indicating existing storage account or to create new azure storage account, Default is `false`
| cmBlobStorageConnectionString                  | The CM connection string of existing azure blob storage. Required when hasStorageAccount is `true`
| cdBlobStorageConnectionString                  | The CD connection string of existing azure blob storage. Required when hasStorageAccount is `true`
| blobStorageSKU                               | The SKU of the blob storage when hasStorageAccount is `false` . Allowed values [`Standard_LRS`, `Standard_RAGRS`, `Standard_GRS`]. Default is `Standard_LRS`
| accessTier                                   | The accessTier of storage when hasStorageAccount is `false`. Allwed Values [`Hot`, `Cool`]. Default is `Hot`
| defaultProvider                              | The default provider to be set in configuration. Allowed values [`classic`, `azure`], Default is `azure`
| containerName                                | The blob storage container name. Default is `blobcontainer`
| blobStorageMsDeployPackageUrl                | The HTTP(s) URL of Sitecore Azure Blob Storage module WDP package.
| bootloaderMsDeployPackageUrl                 | The HTTP(s) URL of Sitecore Bootloader module WDP package.
| sasTokenExpiry                               | The SAS token expiry date for CD environment, Default is, `2120-12-31T23:59:00Z`.
| supportsHttpsTrafficOnly                     | `Boolean` value. Allows https traffic only to storage service if sets to true, Required
| templateLinkAccessToken                      | The arm template access link token
| deployToExmDds                               | `Boolean` value indicating whether the Sitecore Azure Blob Storage module should be installed Exm dedicated dispatch server, Default is `false`

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Sitecore Azure Blob Storage module:

  * Add the following snippet to the `modules` parameter:

```JSON
{
    "name": "azureblobstorage",
    "templateLink": "<Link to Sitecore Azure Blob Storage module ARM template>",
    "parameters": {
        "templateLinkAccessToken": "<SAS token of the Sitecore Azure Blob Storage module ARM template>",
        "blobStorageMsDeployPackageUrl": "<URL of the Sitecore Azure Blob Storage module WDP>"     
    }
}
```

  * Configure Bootloader module according to [Modules.md](../../MODULES.md)
  > **Note**. The Bootloader module should be placed after the Sitecore Azure Storage Provider.