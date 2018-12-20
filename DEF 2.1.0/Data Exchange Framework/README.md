# Sitecore Data Exchange Framework 2.1

These template deploys Sitecore Data Exchange Framework and it's providers and tool modules into a Sitecore XP Azure Environment.

## Parameters

| Parameter                                  | Description
---------------------------------------------|------------------------------------------------
| msDeployPackageUrl                         | The link to a module's wdp package.

## Deploying as part of Sitecore deployment

In order to configure Sitecore deployment parameters to include Sitecore Data Exchange Framework and all Tools & Providers:

* Add the following snippet to the `modules` parameter:

```JSON
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/01DEF.json?st=2017-09-20T14%3A54%3A00Z&se=2025-09-24T14%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=Hg5O5%2BmJUDBdkC4bgawOVd%2BhtV4YX4TBATHHgEHGYi0%3D",
	"name":  "def",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-18T17%3A54%3A00Z&se=2020-09-22T17%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=CdGuEqymjmakBrbtFvsS3KyWHZJ50yLUL6rDowGPhfE%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/02DEFSDK.json?st=2017-09-20T17%3A54%3A00Z&se=2025-09-24T17%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=1spnlHxw3EmDJZfpz5SwoP7YGQoUMH17PQAYZdYBk8Y%3D",
	"name":  "defsdk",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Data%20Exchange%20Framework%20SDK%202.1%20rev.%20180919.scwdp.zip?st=2017-09-22T11%3A54%3A00Z&se=2025-09-26T11%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=guSvzHFMoJLlRhb2CcB3X%2Bpzt7nXahVfE0sxANT1JLc%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/03SitecoreProv.json?st=2017-09-20T20%3A54%3A00Z&se=2025-09-24T20%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=8fszCkgCiYU7HJLCVj1slzUIBfO8GmGdgnvJ3Qpy4MI%3D",
	"name":  "scproviderdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Sitecore%20Provider%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-18T20%3A54%3A00Z&se=2020-09-22T20%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=k103dKM5vtvbSYhkz5eg3XgPlXreu%2F6vX0C0TmnQQiU%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/04SQLProv.json?st=2017-09-20T23%3A54%3A00Z&se=2025-09-24T23%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=wcaqJQPX7AUC0R%2Fsgtz6%2BX0tnb7RX8nSHwZh46kiLg8%3D",
	"name":  "sqlproviderdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/SQL%20Provider%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-18T23%3A54%3A00Z&se=2020-09-22T23%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=DIVU6L06x%2BZTdQQ8m9oyJCXUDiY7pq6VDj43Pc7d6I4%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/05MongoProv.json?st=2017-09-21T02%3A54%3A00Z&se=2025-09-25T02%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=fkX4N1zRlDL2N9Qr1%2Fpp0UWkTfmZ5ckH3RQSJO2eAoQ%3D",
	"name":  "mongoproviderdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/MongoDB%20Provider%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-19T02%3A54%3A00Z&se=2020-09-23T02%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=QiAQ3mMjrqQI1OaRlb47gExMkwzWCtV2D92Qtfz2%2B54%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/06xConnectProv.json?st=2017-09-21T05%3A54%3A00Z&se=2025-09-25T05%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=WwuHl5daFx%2FOwBuWAIgY2zXUotdbqMxbvtqtaNyBhF0%3D",
	"name":  "xconnectdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/XConnect%20Provider%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-19T05%3A54%3A00Z&se=2020-09-23T05%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=O1l%2FMmDKbkGalM1F6AZUSSBf1Hh8l9g0DPN1dXa9jY0%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/07DEFTS.json?st=2017-09-21T08%3A54%3A00Z&se=2025-09-25T08%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=mp9B4CFMTjI7RTbzkVWcqAEPZxS2DuIA8wZarCxSVhk%3D",
	"name":  "defts",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Sitecore%20DataExchange%20TenantService%202.1%20rev.%20180919.scwdp.zip?st=2017-09-22T14%3A54%3A00Z&se=2025-09-26T14%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=bnxdY48kRctVD1kZh6ndqYmpVvjzhv0%2Fv9QIrtBqN%2BY%3D"
				   }
},												
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/08SFProvider.json?st=2017-09-21T11%3A54%3A00Z&se=2025-09-25T11%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=BK5AJWD47Jc0qSVO1OKMbwWCxT5Ik2CFaC5CBXbx7aY%3D",
	"name":  "sfproviderdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Salesforce%20Provider%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-19T23%3A54%3A00Z&se=2020-09-23T23%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=ayQ97xh6tsdR0YnK8wzapH1djmw2O0VdWpmyEV2I7BQ%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/09CRMProv.json?st=2017-09-21T14%3A54%3A00Z&se=2025-09-25T14%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=uX7ArxMh%2FY0MAmRSnQjjRT5ywsb1mdi3SrqWstkiOhk%3D",
	"name":  "dynamproviderdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Dynamics%20Provider%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-20T02%3A54%3A00Z&se=2020-09-24T02%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=rAWkevkMsNU1zXwHFoo1Sd91o%2FPou4FHQ2ZISnR2UZc%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/10FormsProv.json?st=2017-09-21T17%3A54%3A00Z&se=2025-09-25T17%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=d2hPM2eBucpO7lWNqc7ePt3RVbND5vleZgo7crqUFgk%3D",
	"name":  "formsdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Experience%20Forms%20Provider%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-22T17%3A54%3A00Z&se=2025-09-26T17%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=dCNCw8fe%2F%2BEjjcjQS%2BsdS7WnJBS4lraZD%2Bs8sA558js%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/11FormsSA.json?st=2017-09-21T20%3A54%3A00Z&se=2025-09-25T20%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=xysQciw0IRhh%2BcVrmnUOPYIwMawDJR6EPU%2F1A%2F1pbbE%3D",
	"name":  "formsadef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Data%20Exchange%20Framework%20Save%20Action%20for%20Experience%20Forms%202.1%20rev.%20180919.scwdp.zip?st=2017-09-22T20%3A54%3A00Z&se=2025-09-26T20%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=YUrmINfjY2KF7Kcwphbq1Km4skRHhvixsRxf2yDm7HY%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/12ActivityMA.json?st=2017-09-21T23%3A54%3A00Z&se=2025-09-25T23%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=6Zq%2F5okEzCIqO%2F4Xq1HgttSgc2kx%2Ft%2BNHu0NQZTFw%2B0%3D",
	"name":  "maactivdef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Data%20Exchange%20Framework%20Activity%20for%20Marketing%20Automation%202.1%20rev.%20180919.scwdp.zip?st=2017-09-22T23%3A54%3A00Z&se=2025-09-26T23%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=%2FQYfdzoR9e%2BWT9Rzt0Y9B9PmRgbplMo6%2B%2FmX0nHLcck%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/13DMTool.json?st=2017-09-22T02%3A54%3A00Z&se=2025-09-26T02%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=UfQBg8%2BVDPNwd6hFa2sn1i94ulXfkqJSxkZXoaCE3FU%3D",
	"name":  "dmtooldef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/xDB%20Data%20Migration%20Tool%20for%20Data%20Exchange%20Framework%202.1%20rev.%20180919.scwdp.zip?st=2017-09-23T02%3A54%3A00Z&se=2025-09-27T02%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=j7rK3EhR66ITXmEQN2PNhs4kFMn6ekfU73gfCy4RVbI%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/14SFConn.json?st=2017-09-22T05%3A54%3A00Z&se=2025-09-26T05%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=6XoAUEA6ZLU2LDIfqvaLTeGD5itVwzSOMXxcH0jDa%2Bk%3D",
	"name":  "sftooldef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Connect%20for%20Salesforce%202.1%20rev.%20180919.scwdp.zip?st=2017-09-20T05%3A54%3A00Z&se=2020-09-24T05%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=xmtotMOmErNve%2BH8x4DyYC1Tg59acThLRDuv3FAP%2B5w%3D"
				   }
},
{
	"templateLink":  "https://scdef.blob.core.windows.net/scdef/DEFPacARMs/15CRMConn.json?st=2017-09-22T08%3A54%3A00Z&se=2025-09-26T08%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=Ab%2BDDdy0fKJRbz1fBAAm6EpdadOprKIbvBtER4W2TQQ%3D",
	"name":  "dynamtooldef",
	"parameters":  {
					   "msDeployPackageUrl":  "https://scdef.blob.core.windows.net/scdef/DEFPackages/Connect%20for%20Microsoft%20Dynamics%202.1%20rev.%20180919.scwdp.zip?st=2017-09-20T08%3A54%3A00Z&se=2020-09-24T08%3A54%3A00Z&sp=r&sv=2017-04-17&sr=b&sig=U7nLbFmG2JK%2BE%2BHtn22%2FqTyktwSJgZF4j60mJnAPgh4%3D"
				   }
},
```

> **Note**. The Bootloader module should be placed after the DEF modules.