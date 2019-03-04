#Path for the folder than contains your csv's
$inPath = "C:\path\to\csv\container"

#path to the output file where you want your data
$outPath = "C:\path\to\output\file.csv"

<#get-childitem for specified path
  where the extension of the files is csv
    foreach-object...#>
Get-ChildItem -Path $inPath| ?{$_.Extension -eq '.csv'} | %{
 
    <#Array to hold the properties you want to select
      These properties will correspond to your CSV table headers#>
    $properties = "Prperty #1","Property #2","Property #3"
    
    <#use $data to hold the csv object containing only your 
      selected $properties#>
    $data = Import-Csv -Path $_.Name | select $properties

    <#append this set of $data to our out file.csv
      -noTypeInformation removes redundant headers#>
    $data | Export-Csv -Path $outPath -Append -NoTypeInformation

    <#Print the current inFile name, for verbosity #>
    $_.Name
    
    #end foreach-object loop
    }
