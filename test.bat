@echo off &cls

set "/dp=%~dp0"
set "name_cfg_wgcf-profile=wgcf-profile.conf"

:: ====================================================================================
:menu
call :reset_vars
cls
echo ===========================================
echo            choice reading mode
echo ===========================================
echo [1] basic conf
echo [2] modifed conf
echo -------------------------------------------
echo [3] Exit.
 
choice /c 123 /n
if errorlevel 3 goto exit
if errorlevel 2 goto m
if errorlevel 1 goto b


:b
cls
call :read_conf
call :echo_conf
pause
goto menu

:m
cls
call :read_conf_m
call :echo_conf_m
pause
goto menu

:: ====================================================================================

:read_conf
    For /f "UseBackQ Tokens=1* Delims=:" %%A IN (`findstr /N /R /C:"." %/dp%%name_cfg_wgcf-profile%`) Do set "@@%%A=%%B"
    set All="[Interface]=%@@1%" "PrivateKey=%@@2%" "Address=%@@3%" "Address2=%@@4%" "DNS=%@@5%" "MTU=%@@6%" "[Peer]=%@@7%" "PublicKey=%@@8%" "AllowedIPs=%@@9%" "AllowedIPs2=%@@10%" "Endpoint=%@@11%"
    For %%i In (%All%) Do set %%i
 
exit /B
 
:read_conf_m
    For /f "UseBackQ Tokens=1* Delims=:" %%A IN (`findstr /N /R /C:"." %/dp%%name_cfg_wgcf-profile%`) Do set "@@%%A=%%B"
    set All="[Interface]=%@@1%" "PrivateKey=%@@2%" "wgListenPort=%@@3%" "Address=%@@4%" "Address2=%@@5%" "DNS=%@@6%" "MTU=%@@7%" "[Peer]=%@@8%" "PublicKey=%@@9%" "AllowedIPs=%@@10%" "AllowedIPs2=%@@11%" "Endpoint=%@@12%"
    For %%i In (%All%) Do set %%i
exit /B

:: ====================================================================================

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
:: ====================================================================================

:reset_vars
set all="[Interface]=" "PrivateKey=" "wgListenPort=" "Address=" "Address2=" "DNS=" "MTU=" "[Peer]=" "PublicKey=" "AllowedIPs=" "AllowedIPs2=" "Endpoint="
exit /b
