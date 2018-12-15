# Powershell-Scripts
Simple scripts you can you for fun. These scripts are meant to run on Windows machines. I've written them to be ran on machine startup via Windows Task Scheduler. See: [https://community.spiceworks.com/how_to/17736-run-powershell-scripts-from-task-scheduler] 

### Get-Quote Script

This script generates a random quote to appear in a message box. Random quotes are pulled from a free API and requires a network connection. You can configure task scheduler to run this script if there is a network connection. [https://talaikis.com/api/quotes/random/]

### Set-Wallpaper Script

I created this script to set your wallpaper upon login. Its takes two parameters that represent paths to images that you want your machine to switch between. This script is meant to be ran using task scheduler.

Example Use: .\setWallpaper -path "C:\Users\username\Pictures\img1.jpg" -sPath "C:\Users\username\Pictures\img2.jpg"
