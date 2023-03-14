# Read SDLXLIFF format files.
Param (
    [string]$FolderPath
)

$FolderPath = Read-Host -Prompt "Dir"

Get-ChildItem -Path $FolderPath -Recurse | ForEach-Object { 
    if (-not $_.PSIsContainer -and $_.Extension -eq ".sdlxliff") {
        $xml = New-Object Xml
        $f = $_.FullName
        $xml.Load($f)
        
        # Base name of the file to be read.
        $filename = [System.IO.Path]::GetFileNameWithoutExtension($f)

        # Extracting source and translated text from SDLXLIFF files.
        $ns = New-Object Xml.XmlNamespaceManager($xml.NameTable)
        $ns.AddNamespace("xliff", "urn:oasis:names:tc:xliff:document:1.2")
        $source = $xml.SelectNodes("//xliff:trans-unit/xliff:source", $ns) | ForEach-Object { $_.'#text' }
        $target = $xml.SelectNodes("//xliff:trans-unit/xliff:target", $ns) | ForEach-Object { $_.InnerText }

        # Output the extracted source and target texts in *.txt format 
        # in the same location as the target file, separated by tabs.
        $output = for ($i = 0; $i -lt $source.Count; $i++) {
            $source[$i] + "`t" + $target[$i]
        }
        $output | Out-File "$FolderPath`\$filename.txt" -Encoding utf8
    }
}