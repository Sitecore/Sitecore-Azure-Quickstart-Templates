# Sitecore Data Exchange Framework Tenant Service 2.1

This template deploys Sitecore Data Exchange Framework Tenant Service and some plugin modules into a Sitecore XP Azure Environment.

> **Note**. this template can be used for separate installation to the existing XP resource group or as a module for the platform installation.
> You can use deploy.ps1 to install it separately.

## Parameters

| Parameter                                    | Description
-----------------------------------------------|------------------------------------------------
| tsMsDeployPackageUrl                         | The link to tenant service wdp package.
| templateLinkBase                             | The "base" part of template link - is used to include nested templates into installation.
| templateLinkAccessToken                      | Token to retrieve all the nested templates
| tsPluginPackages                             | The array of TS plugins to be installed.
| tsWebAppName                                 | the name of tenant service instance


> **Note**. If you want TS to log into Application Insights service - you need to add appinsights plugin to installation.

> Hint: If you copied all the "nested" templates into "nested" folder of your XP installation - templateLinkBase and templateLinkAccessToken will be the same as for the platform.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Data Exchange Framework Tenant Service:

* Add the following snippet to the `modules` parameter:

```JSON
{
	"templateLink":  "https://dataexchangegroup9949.blob.core.windows.net/maxarms/TenantService/nested/tenantservice.json?st=2018-06-08T18%3A10%3A00Z&se=2020-08-09T18%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=b&sig=UBZiyCo2iZOlNIy77SYKwpx7EIlX%2FMHkIttX1mGw0bc%3D",
	"name":  "tenantservice",
	"parameters":  {
						"tsMsDeployPackageUrl": "https://dataexchangegroup9949.blob.core.windows.net/maxwdps/TS/Sitecore%20Data%20Exchange%20Framework%20Tenant%20Service%202.1%20rev.%20180806.scwdp.zip?st=2018-06-08T21%3A10%3A00Z&se=2020-08-09T21%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=b&sig=2n15C7Fdy6z7MJr7549trt7U3LIcVGVoDytKot%2FTkP8%3D",
						"templateLinkBase": "https://dataexchangegroup9949.blob.core.windows.net/maxarms/TenantService/",
						"templateLinkAccessToken": "?st=2018-06-08T12%3A10%3A00Z&se=2020-08-09T12%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=c&sig=q5xy2tc0cKakIVo%2FLS0myGRff6svALxH9UI0nnhH%2Bsg%3D",
						"tsPluginPackages": 	[
													{
													  "name": "salesforce",
													  "fullName": "Salesforce Provider",
													  "packageUri": "https://dataexchangegroup9949.blob.core.windows.net/maxwdps/TS/Salesforce%20Provider%20for%20Tenant%20Service%202.1%20rev.%20180806.scwdp.zip?st=2018-06-09T09%3A10%3A00Z&se=2020-08-10T09%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=b&sig=gP4m7mr72hnPES6Z4pfxFp5whC0kOCWlH%2F5vuEeUch0%3D"
													},
													{
													  "name": "sitecore",
													  "fullName": "Sitecore Provider",
													  "packageUri": "https://dataexchangegroup9949.blob.core.windows.net/maxwdps/TS/Sitecore%20Provider%20for%20Tenant%20Service%202.1%20rev.%20180806.scwdp.zip?st=2018-06-09T06%3A10%3A00Z&se=2020-08-10T06%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=b&sig=ASiI3er02LaqDLqEUiOUi2JKX6b7NK6EYoQOTizw6ZA%3D"
													},
													{
													  "name": "appinsights",
													  "fullName": "App Insights Logging",
													  "packageUri": "https://dataexchangegroup9949.blob.core.windows.net/maxwdps/TS/AppInsights%20Logging%20for%20Tenant%20Service%202.1%20rev.%20180806.scwdp.zip?st=2018-06-09T03%3A10%3A00Z&se=2020-08-10T03%3A10%3A00Z&sp=rwl&sv=2017-04-17&sr=b&sig=sHD6x2X1aDzRmYK60RYafrzR7gaRlwFxbAsC2nBSi80%3D"
													}	
												] ,
						"tsWebAppName": "xp-ts"
				   }
}
```
> Hint: You can add as many TS instanses with different plugins as you want.
* Configure Bootloader module according to [MODULES.md](../../MODULES.md)
> **Note**. The Bootloader module should be placed after the TS.