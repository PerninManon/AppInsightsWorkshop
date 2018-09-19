param(
    [string]$zipFile,
    [string]$prefixe,
    [string]$rgName,
    [string]$functionAppName
)


$rg=Get-AzureRmResourceGroup -Name $rgName

$app=get-azurermwebapp -ResourceGroupName $rgName -Name $functionAppName

$publishCred=Invoke-AzureRmResourceAction -ResourceId "$($app.Id)/config/publishingcredentials" -Action list -ApiVersion 2015-08-01 -Force

#PowerShell
$username = $publishCred.properties.publishingUserName
$password = $publishCred.properties.publishingPassword
$apiUrl = "https://$functionAppName.scm.azurewebsites.net/api/zipdeploy"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username, $password)))
$userAgent = "powershell/1.0"
$uploadZip=Invoke-RestMethod -Uri $apiUrl -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -UserAgent $userAgent -Method POST -InFile $zipFile -ContentType "multipart/form-data"

$apiUrl = "https://$functionAppName.scm.azurewebsites.net/api/deployments"
$deployZip=Invoke-RestMethod -Uri $apiUrl -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -UserAgent $userAgent -Method GET
