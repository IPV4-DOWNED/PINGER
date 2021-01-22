cls
@echo off
title
echo off & cls
chcp 65001
cls
:main
mode con cols=83 lines=25
color 03
title 
echo.
echo  ██╗     ██████╗  █████╗  █████╗ ████████╗   ██╗       ██╗ █████╗ ██████╗      ██╗
echo  ╚═╝     ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝   ██║  ██╗  ██║██╔══██╗██╔══██╗     ╚═╝ 
echo          ██████╦╝██║  ██║██║  ██║   ██║      ╚██╗████╗██╔╝███████║██████╔╝
echo     ██╗  ██╔══██╗██║  ██║██║  ██║   ██║       ████╔═████║ ██╔══██║██╔══██╗  ██╗
echo     ╚═╝  ██████╦╝╚█████╔╝╚█████╔╝   ██║       ╚██╔╝ ╚██╔╝ ██║  ██║██║  ██║  ╚═╝
echo          ╚═════╝  ╚════╝  ╚════╝    ╚═╝        ╚═╝   ╚═╝  ╚═╝  ╚═╝╚═╝  ╚═╝
echo                   [40;35m╔══════════════════════════════════════════════╗
echo                   [40;35m║          [40;31m{[40;33mCREATED BY IPV4_DOWNED[40;31m}            [40;35m║
echo                   [40;35m            [40;37mWelcome [40;34m%username%              [40;35m
echo                   [40;35m          [40;37mTo Access The [40;32mIP LOG [40;37mType [40;31m{[40;32m?[40;31m}
echo                   [40;35m           [40;37mTo [40;32mTrace [40;37mAn IP Type [40;31m{[40;32mTRACE[40;31m} 
echo                   [40;35m║           [40;37mTo [40;32mPort Scan[40;37m Type [40;31m{[40;32mPORT[40;31m}           [40;35m║
echo                   [40;35m╚══════════════════════════════════════════════╝[40;33m
echo.
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
time/t
date/t
echo.
call :UHD_OVH 0C "PRESS CTRL+C TO END" echo.
echo.
echo ===================================================================================
set /p NAME=  [40;34m %username% [40;36mPLEASE ENTER THE [40;31mTARGETS [40;36mNAME -[40;31m 
echo.
if %name% == ? goto open
if %name% == PORT goto PORT
if %name% == CLOCK goto clock
if %name% == TRACE goto Tracer
if %name% == trace goto Tracer
if %name% == port goto PORT
set /p PORT= [40;36m PLEASE ENTER THE [40;31mTARGETS [40;36mPORT -[40;31m 
echo.
set /p IP= [40;36m ENTER [40;31m%name%'s [40;36mIP -[40;31m 
echo.
echo ------------------------------------------------------------------------------------------------------------------------------------------------------------------------->>IPLogs.txt
echo -  %name%      //         %IP%        //         %PORT%        // %date% %time%>> IPLogs.txt
echo.

:top

PING -n 1 %IP% | FIND "TTL=" >nul

title V.P.S [ ASKING %ip% NOW ]

IF ERRORLEVEL 1 (
SET OUT=C
echo [40;31m
title V.P.S [ SENDING REQUEST PACKETS TO %ip% ][HOST ISNT RESPONDING][PLEASE WAIT]

<nul set /p="[40;35m([40;30m"
call :UHD_OVH C0 "Pinging" && <nul set /p="[40;35m):([40;30m"
call :UHD_OVH C0 "%IP%"  && <nul set /p="[40;35m)~([40;30m"
call :UHD_OVH C0 "OFFLINE"  && <nul set /p="[40;35m)[40;30m"
echo.
) ELSE (
SET OUT=A
echo [40;31m
title V.P.S [ SENDING REQUEST PACKETS TO %ip% ][HOST IS RESPONDING][SLAM THIS BITCH]
<nul set /p= "[40;35m([40;30m"
call :UHD_OVH AD "Pinging" && <nul set /p="[40;35m):([40;30m"
call :UHD_OVH A1 "%IP%"  && <nul set /p="[40;35m)~([40;30m"
call :UHD_OVH AD "ONLINE"  && <nul set /p="[40;35m)[40;30m"
echo. )

goto :end

:UHD_OVH
<nul set /p "=%DEL%" > "%~2"
findstr /v /a:%1 /R "+" "%~2" nul
del "%~2" > nul
goto :eof

:end

ping -t 1 -1 10 127.0.0.1 >nul
goto top
echo.

:open
start IPLogs.txt
goto main

:PORT
cls
chcp 65001
mode con cols=95 lines=15
echo.
echo.
echo     [40;31m ______   ______     ______     ______     [40;34m ______     ______     ______     __   __    
echo     [40;31m/\  == \ /\  __ \   /\  == \   /\__  _\    [40;34m/\  ___\   /\  ___\   /\  __ \   /\ "-.\ \   
echo     [40;31m\ \  _-/ \ \ \/\ \  \ \  __/_  \/_/\ \/    [40;34m\ \___  \  \ \ \____  \ \  __ \  \ \ \-.  \  
echo      [40;31m\ \_\    \ \_____\  \ \_\ \_\    \ \_\    [40;34m \/\_____\  \ \_____\  \ \_\ \_\  \ \_\\"\_\ 
echo      [40;31m \/_/     \/_____/   \/_/ /_/     \/_/     [40;34m \/_____/   \/_____/   \/_/\/_/   \/_/ \/_/ 
echo.
echo                     [40;33mIF YOU DO NOT HAVE PYTHON INSTALLED THIS WILL NOT WORK                                                                                        
echo                             [40;33m  Enter 1 To Return To Main Menu
echo.
echo [40;37m                                ENTER THE IP TO PORT SCAN 
set /p portip=[40;32m                                       
if %portip% == 1 goto main
start Portsc.py %portip% 
goto main

:tracer
cls
title 
mode 67,25
echo 
echo off
color f
setlocal ENABLEDELAYEDEXPANSION
chcp 65001

:iplookup
cls
mode con cols=65 lines=15
title TRACE AN IP TO FIND INFO ABOUT IT
echo.
echo.
echo      [40;34m██╗██████╗     [40;32m████████╗██████╗  █████╗  ██████╗███████╗
echo      [40;34m██║██╔══██╗    [40;32m╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔════╝
echo      [40;34m██║██████╔╝       [40;32m██║   ██████╔╝███████║██║     █████╗  
echo      [40;34m██║██╔═══╝        [40;32m██║   ██╔══██╗██╔══██║██║     ██╔══╝  
echo      [40;34m██║██║            [40;32m██║   ██║  ██║██║  ██║╚██████╗███████╗
echo      [40;34m╚═╝╚═╝            [40;32m╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
echo.                                                        
echo.
set ip=127.0.0.1
echo               [40;33mInsert The [40;31mIP [40;33mYou'd Like To Trace[40;37m
set /p ip= [40;33m [40;33m [40;33m    [40;37m                    
set /p goto action
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs
:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
rem echo Msgbox HTTPGET,vbSystemModal+vbOKOnly+vbInformation, "IP Info" >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting For API Response. . .
mode con cols=53 lines=15
TITLE 
echo [40;35m
echo    ██████╗ ██╗     ███████╗ █████╗ ███████╗███████╗
echo    ██╔══██╗██║     ██╔════╝██╔══██╗██╔════╝██╔════╝
echo    ██████╔╝██║     █████╗  ███████║███████╗█████╗  
echo    ██╔═══╝ ██║     ██╔══╝  ██╔══██║╚════██║██╔══╝  
echo    ██║     ███████╗███████╗██║  ██║███████║███████╗
echo    ╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
echo.                                                
echo            ██╗    ██╗ █████╗ ██╗████████╗          
echo            ██║    ██║██╔══██╗██║╚══██╔══╝          
echo            ██║ █╗ ██║███████║██║   ██║             
echo            ██║███╗██║██╔══██║██║   ██║             
echo            ╚███╔███╔╝██║  ██║██║   ██║             
echo             ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝   ╚═╝    
 timeout/nobreak 3 >nul         
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did Not Receive A Response From The API.
echo.
pause
goto menu
:response_exist
cls
mode con cols=65 lines=34
title Successfully Traced {%ip%} Displaying info 
    echo [40;32m 
    echo          ██╗██████╗     ██████╗  █████╗ ████████╗ █████╗ 
    echo          ██║██╔══██╗    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗
    echo          ██║██████╔╝    ██║  ██║███████║   ██║   ███████║
    echo          ██║██╔═══╝     ██║  ██║██╔══██║   ██║   ██╔══██║
    echo          ██║██║         ██████╔╝██║  ██║   ██║   ██║  ██║
    echo          ╚═╝╚═╝         ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
	echo [40;33m=================================================================
	echo.
for /f "delims=     " %%i in ('findstr /i "ip hostname city region country loc org postal" %temp%\response.txt') do ( 
    set data=%%i
    set data=!data:,=!
    set data=!data:""=Not Listed!
    set data=!data:"=!
    set data=!data:ip:=[40;33mIP:         [40;31m!
    set data=!data:hostname:=[40;33mHostname:[40;34m   !
    set data=!data:city:=[40;33mCity: [40;34m      !
    set data=!data:region:=[40;33mState: [40;34m     !
    set data=!data:country:=[40;33mCountry: [40;34m   !
    set data=!data:loc:=[40;33mLocation: [40;34m  !
    set data=!data:org:=[40;33mISP:        [40;31m!
    set data=!data:postal:=[40;33mPostal:   [40;34m  !
    echo [40;33m        !data!
	echo  [40;37m                ============================
)
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
echo.
echo [40;33m=================================================================
echo        [40;31m( [40;34m1. [40;37mtrace another ip [40;31m)  [40;31m([40;34m 2. [40;37mgo to main menu [40;31m)
echo.
echo [40;33m                        Type [40;34m1 [40;33mor [40;34m2
set /p choice= [40;37m                              
if %choice% == 1 goto iplookup
if %choice% == 2 goto main
if '%ip%'=='' goto menu 
goto main
exit
Rem http://dstat.trollsec.com/projects/ip-lookup.txt                                                 
pause >nul       

:end

ping -t 1 -l 10 127.0.0.1 >
GoTo top
echo.