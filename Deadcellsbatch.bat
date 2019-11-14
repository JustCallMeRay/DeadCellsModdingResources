REM @echo off

@Call DeadCellsPaths.bat 
cls
@rem echo %Root%
CD %ModTools%
REM echo %CD%
REM echo In ModTools
:Start
Choice /C UARP /M "Do you want to Unpak/cdbExpand, AtlasTool, Repack or view Paths?"
If errorlevel 4 goto Options
If errorlevel 3 goto Repack
If errorlevel 2 goto Atlas
If errorlevel 1 goto UnPAKTool

:UnPAKTool
CHOICE /C YN /M "Do you want to run PAKTool? (UNPACK)"
IF ERRORLEVEL 2 goto CDBExpand
IF ERRORLEVEL 1 echo. 
echo Running PAKTool, this may take some time
echo on 
PAKTool -Expand -OutDir %Resources%\ResPAK\ -RefPak "%Root%\res.pak" 
@echo off
echo Done, press any key to contiue 
@pause >nul
goto CDBExpand


:CDBExpand
Choice /M "Do you want to run CDBTool? (EXPAND)"
IF ERRORLEVEL 2 goto End
IF ERRORLEVEL 1 echo. 
echo Running CDBTool, this may take some time
echo on
CDBTool -Expand -OutDir %Resources%\ExpandedCDB\ -RefCDB "%Resources%\ResPAK\data.cdb"
@echo off
echo Done, press any key to contiue 
@pause >nul
goto End

:Atlas
echo Not yet supported push any button 
@pause >nul
goto Start

:Repack
:CBDCollapse
echo "Do you want to run CDBTool? (COLLAPSE)"
Choice /M "Replaces original cdb file"
IF ERRORLEVEL 2 goto RePAKTool
IF ERRORLEVEL 1 echo Running CDBTool, this may take some time
echo on
CDBTool -Collapse -InDir %Resources%\ExpandedCDB\ -OutCDB "%Resources%\ResPAK\data.cdb" 
@echo off
echo Done, press any key to contiue 
@pause >nul
goto RePAKTool

:RePAKTool
CHOICE /M "Do you want to run PAKTool? (REPACK)"
IF ERRORLEVEL 2 goto End
IF ERRORLEVEL 1 echo.
Echo Running PAKTool, this may take some time...
Echo.
echo on 
PAKTool -CreateDiffPak -RefPak "%Root%\res.pak" -InDir "%Resources%\ResPAK" -OutPak "%Output%\res.pak" 
@echo off
echo Done, press any key to contiue 
@pause >nul
goto End

:Options
Echo ALPHA
Choice /M "Show paths?"
if ERRORLEVEL 2 goto Options1
Echo Show paths Resources ModTools rooT Output
@CHOICE /C RMTO
if errorlevel 4 echo %Output%
if errorlevel 3 echo %Root%
if errorlevel 2 echo %ModTools%
if errorlevel 1 echo %Resources%
:Options1
Echo Thats all folks go to
Choice /C ES /M "End or Start?"
if errorlevel 2 goto Start
if errorlevel 1 goto End

:End
Echo. 
Echo Completed...
echo. 
Echo Exit
echo Open cmd at ModTools or
Echo Re-Run the program
@Choice /C EOR
If errorlevel 3 goto start
If errorlevel 2 goto OpenCMD
if errorlevel 1 exit 

:OpenCMD
Cd %ModTools%
CMD /K

