function ConvertHashtableToMSBuildProperties{
	param (
	   [hashtable] $Properties
	)
    $result = @()
    $Properties.keys | foreach {
	$propertyValue = $Properties.Item($_)
	if ($_){
	        $result += @("/p:{0}={1}" -f $_, $propertyValue)
	    }
	}
    return $result
}
