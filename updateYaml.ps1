$MyDir = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
Import-Module $($MyDir+"\\modules\\PSYaml")
$text = ConvertFrom-Yaml -Path $($MyDir+"\\input.yml")


if($text.automCenterConfig){
 echo "Object exists, only update required"
}
else{
 #copy contents of one object and create a new one from that
 $text.automCenterConfig=$text.logJsonDataConfig.psobject.copy()
}

echo "---Updating content---"
$text.automCenterConfig.code = "value1"
$text.automCenterConfig.path = "value2"
$text.automCenterConfig.ext = "value3"

echo "Convert object to yaml and write to file"
$output = Convertto-yaml $text
$output | Out-File $($MyDir+"\\output.yml")