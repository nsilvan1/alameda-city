@echo off

color 2

echo #################################################
echo     Developed : BACOBR
echo     Version   : 1.0 BRAVUS ROLEPLAY
echo     Discord   : https://discord.gg/
echo #################################################
:choice

pause

start artifacts\FXServer.exe +set onesync on +set onesync_population true +exec server.cfg
exit