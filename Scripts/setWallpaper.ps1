
 param (
    [Parameter(Mandatory=$true)]
	[string]$path,
	[Parameter(Mandatory=$true)]
    [string]$sPath
 )

Function Set-WallPaper($path, $sPath)
{

  $wall = Get-ItemProperty -path  'HKCU:\Control Panel\Desktop' -name WallPaper
 
  if ($wall.WallPaper -eq $path)
  {
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper $sPath
    rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
	exit
  }
  elseif ($wall.WallPaper -eq $sPath)
  {
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper $path

    rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
	exit
  }
  else {
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper $path

    rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
	exit
  }
}

Set-WallPaper -path $path -sPath $sPath
