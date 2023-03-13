# Read SDLXLIFF format files.
$f = "sample.sdlxliff"
$xml = New-Object Xml
$xml.Load($f)

# Base name of the file to be read.
$filename = [System.IO.Path]::GetFileNameWithoutExtension($f)

# Extracting source and translated text from SDLXLIFF files.
$ns = New-Object Xml.XmlNamespaceManager($xml.NameTable)
$ns.AddNamespace("xliff", "urn:oasis:names:tc:xliff:document:1.2")
$source = $xml.SelectNodes("//xliff:trans-unit/xliff:source", $ns) | ForEach-Object { $_.'#text' }
$target = $xml.SelectNodes("//xliff:trans-unit/xliff:target", $ns) | ForEach-Object { $_.InnerText }

# Tab-separated output of extracted source and translated text.
$output = for ($i = 0; $i -lt $source.Count; $i++) {
    $source[$i] + "`t" + $target[$i]
}
$output | Out-File "$filename.txt" -Encoding utf8