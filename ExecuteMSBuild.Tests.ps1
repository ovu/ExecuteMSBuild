$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"
Describe "Execute Msbuild" {
  Context "When executing with custom params"{
	$properties = @{}
	$properties = @{
		VisualStudioVersion = "12.0"
		Configuration = "Debug"
		TargetPlatform = "AnyCPU"
		OutDir = "C:\output\"
	}

        $projectFile = "TestProject\HelloWorld\HelloWorld.csproj"
	ExecuteMSBuild $projectFile $properties
  }
}
