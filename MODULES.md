# Deploying modules as part of Sitecore deployment

Each Sitecore module is deployed by a separate ARM template, and individual deployments are combined by the master deployment template for Sitecore `azuredeploy.json`. The list of modules and their parameters is passed to Sitecore deployment via `modules` parameter in `azuredeploy.parameters.json`.

In order to deploy a modules as part of Sitecore deployment, you will need to change `azuredeploy.parameters.json` the following way:

  * Add `modules` parameter.
  * Add snippet to install 'Bootloader' module.
  * Add snippet for your module.


## Adding 'modules' parameter

Add the following parameter to your `azuredeploy.parameters.json`:

``` JSON
{
	"modules": {
		"value": {
			"items": [

			]
		}
	}
}
```

## Adding bootloader module

Bootloader module performs final configuration and execution of post steps for modules when Sitecore is deployed.

Add the following snippet to the "items" property of "modules" parameter.

``` JSON
{
	"name": "bootloader",
	"templateLink": "<URL to the bootloader template>",
	"parameters": {
		"msDeployPackageUrl" : "<URL to the wdp.zip file for specific version of Sitecore>"
	}
}
```

## Adding snippet for your module

All module snippets follow the same syntax:
``` JSON
{
	"name": "<name of the module>", /* this will also be the name of the deployment */
	"templateLink": "<URL of the Resource Manager template that deploys the module>",
	"parameters": {
		/* Additional parameters for the module such as WDP package URLs */ 
	}
}
```

Parameters that should be passed to the module depend on the actual deployment template. Refer to the documentation of specific module for information on parameter names and expected values.

## Adding Identity Server module

Sitecore Identity Server is deployed as a module via the `modules` parameter. The default `azuredeploy.parameters.json` for each topology includes an `identity-server` entry that must be configured before deployment.

Add or update the following snippet in the `items` property of the `modules` parameter:

``` JSON
{
    "name": "identity-server",
    "templateLink": "<URL of the Identity Server ARM template azuredeploy.json>",
    "parameters": {
        "siMsDeployPackageUrl": "<URL to the Identity Server WDP file>"
    }
}
```

The master template passes infrastructure outputs and Sitecore parameters to the module automatically. Sitecore roles receive the Identity Server authority URL from the master template.

## Example

Here is an example of `modules` parameter with Bootloader and Web Forms for Marketers module definitions for XP Single environment:

``` JSON
{
	"deploymentId": {
		"value": ""
	},

	/* other parameters */

	"modules": {
		"value": {
			"items": [
				{
					"name": "wffm",
					"templateLink": "<URL of WFFM/XPSingle/azuredeploy.json>",
					"parameters": {
						"singleMsDeployPackageUrl" : "<URL to the WDP file>"
					}
				},
				{
					"name": "bootloader",
					"templateLink": "<URL of bootloader.json>",
					"parameters": {
						"msDeployPackageUrl" : "<URL to the WDP file>"
					}
				}
			]
		}
	}
}
```
