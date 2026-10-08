# Sitecore Azure Blob Storage module for Sitecore XP Single Environment

This template deploys Sitecore Azure Blob Storage module into a Sitecore XP Single Environment.

## Parameters


| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| deploymentId                                 | DeploymentID used to generate infrastructure.
| location                                     | Infrastructure deployment location.
| singleWebAppName                             | The name of the web App service.
| storageAccountName                           | The name of the storage account. Required when hasStorageAccount is `false`. The name you choose must be unique across Azure. The name also must be between 3 and 24 characters in length, and can include numbers and lowercase letters only
| hasStorageAccount                            | `Boolean` value indicating existing storage account or to create new azure storage account, Default is `false`
| blobStorageConnectionString                  | The connection string of existing azure blob storage. Required when hasStorageAccount is `true`
| blobStorageSKU                               | The SKU of the blob storage when hasStorageAccount is `false` . Allowed values [`Standard_LRS`, `Standard_RAGRS`, `Standard_GRS`]. Default is `Standard_LRS`
| accessTier                                   | The accessTier of storage when hasStorageAccount is `false`. Allwed Values [`Hot`, `Cool`]. Default is `Hot`
| defaultProvider                              | The default provider to be set in configuration. Allowed values [`classic`, `azure`], Required.
| containerName                                | The blob storage container name. Default is `blobcontainer`
| blobStorageMsDeployPackageUrl                | The HTTP(s) URL of Sitecore Azure Blob Storage module WDP package.
| supportsHttpsTrafficOnly                     | `Boolean` value. Allows https traffic only to storage service if sets to true. Default is `true`
| templateLinkAccessToken                      | The arm template access link token

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Azure Blob Storage module:

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