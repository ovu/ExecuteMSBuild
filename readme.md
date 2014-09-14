ExecuteMSBuild
==============

It is a wrapper to execute MSBuild in Powershell.
Example of usage:
	$properties = @{}
	$properties = @{
		VisualStudioVersion = "12.0"
		Configuration = "Debug"
		TargetPlatform = "AnyCPU"
		OutDir = "C:\output\"
	}
	
	$projectFile = "TestProject\HelloWorld\HelloWorld.csproj"
	ExecuteMSBuild $projectFile $properties

Running the tests
-----------------
Pester is required to run the tests. Import the module and run in the command line Invoke-Pester.
