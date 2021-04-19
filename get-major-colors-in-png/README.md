# to run this example

```powershell
./read.ps1 ./solid_color.png
```

or

```powershell
./read.ps1 ./htc.png
```

`read.ps1` will output the top 1 or 2 colors found in the PNG file (as RGB and hex values, with alpha included).

## to fix the Gdip / GDI+ error on Mac

```bash
brew install mono-libgdiplus
```
