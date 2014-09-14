$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Write-Output "$here\$sut"

Describe "Converting msbuild properties hashtable to array" {
    Context "When the hash table has one property" {
	$properties = @{}
	$properties = @{
		"Configuration" = "Debug"
	}
	$result = ConvertHashtableToMSBuildProperties($properties)
	It "should return one element" {
	    $result | Should Be @("/p:Configuration=Debug")
	}
    }

    Context "When the hash table has two properties" {
	$properties = @{}
	$properties = @{
		"Configuration" = "Debug"
		"PlatformTarget" = "AnyCPU"
	}
	$result = ConvertHashtableToMSBuildProperties($properties)
	It "should return two elements" {
	    $result | Should Be @("/p:Configuration=Debug", "/p:PlatformTarget=AnyCPU")
	}
    }
}
