@echo off 
cls
COLOR 2A
echo Notice: (right click on the script, click "Run As Administrator")
echo Written by Richard Thomas 
echo Version 1.0 base 
echo This version of the script is not ready for use,
echo to edit this script for use, replace data in line 23 with required info
echo and delete these lines from the script
echo Choose: 
echo [1] Set Static IP 
echo [2] Set DHCP 
echo [3] Exit 
echo. 
:choice 
SET /P C=[Select an option] 
for %%? in (1) do if /I "%C%"=="%%?" goto A 
for %%? in (2) do if /I "%C%"=="%%?" goto B 
for %%? in (3) do if /I "%C%"=="%%?" goto end 
goto choice 

:A 

echo "Setting Static IP Information" 
netsh interface ip set address name="Local Area Connection" static <IP address> <subnet Mask> <Default Gateway>
netsh int ip show config 
pause 
goto end

:B 
@ECHO OFF 
ECHO Resetting IP Address and Subnet Mask For DHCP 
netsh int ip set address name = "Local Area Connection" source = dhcp

ipconfig /renew

ECHO Here are the new settings for %computername%: 
netsh int ip show config

pause 
goto end 

:end