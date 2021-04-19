$filename = $args[0]
$BitMap = [System.Drawing.Bitmap]::FromFile((Resolve-Path $filename).ProviderPath)

$hashTableOfColors = @{}
foreach($h in 1..$BitMap.Height) {
  foreach($w in 1..$BitMap.Width) {
    $hashTableOfColors[$BitMap.GetPixel($w - 1,$h - 1)] += 1
  }
}

$palette = $hashTableOfColors.Keys
# $counts = $hashTableOfColors.Values

$firstCount = 0
$firstColor = $null
$secondCount = 0
$secondColor = $null
foreach($color in $palette) {
  $count = $hashTableOfColors[$color]
  if ($count -gt $firstCount) {
    $firstCount = $count
    $firstColor = $color
  } elseif ($count -gt $secondCount) {
    $secondCount = $count
    $secondColor = $color
  }
}

echo -----
echo $firstCount
echo $firstColor
echo -----
if ($secondColor) {
  echo $secondCount
  echo $secondColor
  echo -----
}

$firstColorName = $firstColor.Name
$secondColorName = if ($secondColor) { $secondColor.Name } else { '000000' }

$firstColorName = ([regex]::Matches($firstColorName,'.','RightToLeft') | ForEach {$_.value}) -join ''
$secondColorName = ([regex]::Matches($secondColorName,'.','RightToLeft') | ForEach {$_.value}) -join ''

echo -----
echo '2 most dominant colors found:'
echo "#$firstColorName"
echo "#$secondColorName"
echo -----

Remove-Item ./output.css

Copy-Item "input.css" -Destination "output.css"

(Get-Content output.css) `
    -replace '(--main-color: ).+?;', "`$1#$firstColorName;" `
    -replace '(--secondary-color: ).+?;', "`$1#$secondColorName;" |
Out-File output.css
