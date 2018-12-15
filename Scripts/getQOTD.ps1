

Function Get-Quote()
{
  $quote = Invoke-RestMethod -Uri https://talaikis.com/api/quotes/random/
  $cache = $quote
  Write-Host $quote.Quote

  $location = GET-location

  $cache.Quote += "`n"
  $cache.Quote += "`n"
  $cache.Quote += "`n"

  if (!(Test-Path "C:\Users/Jeff Vang\Desktop\scripts\quotes\Quotes.txt"))
  {
     New-Item -path "C:\Users/Jeff Vang\Desktop\scripts\quotes\Quotes.txt" -name .txt -type "file" -value $quote
     Write-Host "Created new file and text content added"
  }
  else
  {
    $date = Get-Date -Format g
    Add-Content -path "C:\Users/Jeff Vang\Desktop\scripts\quotes\Quotes.txt" -value $quote.quote
	Add-Content -path "C:\Users/Jeff Vang\Desktop\scripts\quotes\Quotes.txt" -value $quote.author
	Add-Content -path "C:\Users/Jeff Vang\Desktop\scripts\quotes\Quotes.txt" -value $quote.cat
	Add-Content -path "C:\Users/Jeff Vang\Desktop\scripts\quotes\Quotes.txt" -value $date
    Write-Host "File already exists and new text content added"
	
	$wshell = New-Object -ComObject Wscript.Shell
    $wshell.Popup($cache.Quote + "Old Quotes available in C:\Users/Jeff Vang\Desktop\scripts\quotes\Quotes.txt", 30," Quote of the Day", 0)
	
  }


  
}

Get-Quote
