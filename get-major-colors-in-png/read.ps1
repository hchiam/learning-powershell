# example usage in PowerShell: ./read.ps1 ./solid_color.png

# # to fix the Gdip / GDI+ error on Mac:
# brew install mono-libgdiplus

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