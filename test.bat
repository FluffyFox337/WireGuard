@echo off

set "/dp=%~dp0"
set "name_cfg_wgcf-profile=wgcf-profile.conf"


:menu
call :reset_vars

cls
echo ===========================================
echo            choice reading mode
echo ===========================================
echo [1] basic conf
echo [2] modifed conf
echo -------------------------------------------
echo [3] exit.
choice /c 123 /n
 if errorlevel 3 goto exit
 if errorlevel 2 goto m
 if errorlevel 1 goto b


:b
call :read_conf
call :echo_conf
pause
goto menu

:m
call :read_conf_m
call :echo_conf_m
pause
goto menu





:read_conf
SetLocal EnableDelayedExpansion

set /a c=0
for /f "UseBackQ Delims=" %%A IN ("%/dp%%name_cfg_wgcf-profile%") do (
  set /a c+=1
  if !c!==1 set "[Interface]=%%A"
  if !c!==2 set "PrivateKey=%%A"
  if !c!==3 set "Address=%%A"
  if !c!==4 set "Address2=%%A"
  if !c!==5 set "DNS=%%A"
  if !c!==6 set "MTU=%%A"
  if !c!==7 set "[Peer]=%%A"
  if !c!==8 set "PublicKey=%%A"
  if !c!==9 set "AllowedIPs=%%A"
  if !c!==10 set "AllowedIPs2=%%A"
  if !c!==11 set "Endpoint=%%A"
)

SetLocal DisableDelayedExpansion

exit /b


:echo_conf
cls
echo -----------------------------------------------------------
echo                   Readed configurations:
echo -----------------------------------------------------------
echo 1  :%[Interface]%
echo 2  :%PrivateKey%
echo 3  :%Address%
echo 4  :%Address2%
echo 5  :%DNS%
echo 6  :%MTU%
echo 7  :%[Peer]%
echo 8  :%PublicKey%
echo 9  :%AllowedIPs%
echo 10 :%AllowedIPs2%
echo 11 :%Endpoint%
echo 12 :
echo -----------------------------------------------------------
echo cfg path: %/dp%%name_cfg_wgcf-profile%

exit /b


:read_conf_m
SetLocal EnableDelayedExpansion

set /a c=0
for /f "UseBackQ Delims=" %%A IN ("%/dp%%name_cfg_wgcf-profile%") do (
  set /a c+=1
  if !c!==1 set "[Interface]=%%A"
  if !c!==2 set "PrivateKey=%%A"
  if !c!==3 set "wgListenPort=%%A"
  if !c!==4 set "Address=%%A"
  if !c!==5 set "Address2=%%A"
  if !c!==6 set "DNS=%%A"
  if !c!==7 set "MTU=%%A"
  if !c!==8 set "[Peer]=%%A"
  if !c!==9 set "PublicKey=%%A"
  if !c!==10 set "AllowedIPs=%%A"
  if !c!==11 set "AllowedIPs2=%%A"
  if !c!==12 set "Endpoint=%%A"
)

SetLocal DisableDelayedExpansion

exit /b

:echo_conf_m
cls
echo -----------------------------------------------------------
echo                   Readed modifed configurations:
echo -----------------------------------------------------------
echo 1  :%[Interface]%
echo 2  :%PrivateKey%
echo 3  :%wgListenPort%
echo 4  :%Address%
echo 5  :%Address2%
echo 6  :%DNS%
echo 7  :%MTU%
echo 8  :%[Peer]%
echo 9  :%PublicKey%
echo 10 :%AllowedIPs%
echo 11 :%AllowedIPs2%
echo 12 :%Endpoint%
echo -----------------------------------------------------------
echo cfg path: %/dp%%name_cfg_wgcf-profile%

exit /b

:reset_vars
set "[Interface]="
set "PrivateKey="
set "wgListenPort="
set "Address="
set "Address2="
set "DNS="
set "MTU="
set "[Peer]="
set "PublicKey="
set "AllowedIPs="
set "AllowedIPs2="
set "Endpoint="

exit /b
