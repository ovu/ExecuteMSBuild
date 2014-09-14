. "./ConvertHashtableToMSBuildProperties.ps1"
function ExecuteMSBuild {
	param (
	  [string] $ProjectFile,
	  [hashtable] $Properties
	)
  $propertiesAsArray = ConvertHashtableToMSBuildProperties($Properties) 

Write-Host $propertiesAsArray
$propertiesAsArray += "/verbosity:diagnostic"
$propertiesAsArray += "/p:PublishUrl=aaa"
$propertiesAsArray += "/p:ApplicationVersion=789"
Write-Host ($propertiesAsArray -join " ")
&("MSBuild") ($ProjectFile -join " ") $propertiesAsArray
}
