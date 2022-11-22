#!/bin/sh

# common vars
wsl='/etc/wsl.conf'
resolv='/etc/resolv.conf'

# remove standard files
rm -f $wsl
rm -f $resolv

# Create custom WSL name resolution
cp ./dist/wsl.conf $wsl
cp ./dist/resolv.conf $resolv

# This prevents resolv.conf from being deleted when WSL starts
chattr +i $resolv

echo 'WSL name resolution configured'
# echo 'Restart WSL on Windows: "wsl --shutdown"'

echo "Restarting wsl using Restart-Service LxssManager"
echo "When its finished just re-open your wsl cli to start it again."
echo "Good ide that you can set to start in wsl is ConEmu. Simple install go to settings"
echo "Startup > Specified named task : {bash::bash}. restart ConEmu thats it."
powershell Restart-Service LxssManager
