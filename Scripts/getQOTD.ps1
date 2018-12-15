
 param (
    [Parameter(Mandatory=$true)]
	[string]$path
 )

Function Get-Quote()
{
  $quote = Invoke-RestMethod -Uri https://talaikis.com/api/quotes/random/
  $cache = $quote
  Write-Host $quote.Quote

  $location = GET-location

  $cache.Quote += "`n"
  $cache.Quote += "`n"
  $cache.Quote += "`n"

  if (!(Test-Path $path))
  {
     New-Item -path $path -name .txt -type "file" -value $quote
     Write-Host "Created new file and text content added"
  }
  else
  {
    $date = Get-Date -Format g
    Add-Content -path $path -value $quote.quote
	Add-Content -path $path -value $quote.author
	Add-Content -path $path -value $quote.cat
	Add-Content -path $path -value $date
    Write-Host "File already exists and new text content added"
	
	$wshell = New-Object -ComObject Wscript.Shell
    $wshell.Popup($cache.Quote + $path, 30," Quote of the Day", 0)
	
  }


  
}

Get-Quote -path $path
