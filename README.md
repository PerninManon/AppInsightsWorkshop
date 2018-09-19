# AppInsightsWorkshop

## Azure Resource Group

<img src="archi.png"/>

Deploy the needed Azure resources into your subscription:

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPerninManon%2FAppInsightsWorkshop%2Fmaster%2FAppInsightsWorkshop%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPerninManon%2FAppInsightsWorkshop%2Fmaster%2FAppInsightsWorkshop%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>


## Azure Functions

To deploy the azure functions, run the provided PowerShell scripts: DeployAlerting.ps1.

1. In your powershell editor, sign-in into your subscription thanks to the following command :
    > Login-AzureRMAccount
2. Select the desired subscription thanks to:
    > Select-AzureRMSubscription [subscriptionid / subscriptionName]
3. Execute the provided scripts by providing the following parameters:
    * rgName: Name of the resource group already deployed
    * functionAppName: Name of the function app that has been deployed ([prefixe][functionAppSuffixe])
    * zipFile: Path to the zip file that has been downloaded
    > .\DeployAlerting.ps1 -zipFile $zipFile -rgName $rgName -functionAppName $functionAppName