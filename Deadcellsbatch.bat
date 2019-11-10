@echo off

Call DeadCellsPaths.bat 

@rem echo %Root%
CD %ModTools%
echo %CD%
echo In ModTools

:ThePAKTool
CHOICE /C YN /M "Do you want to run PAKTool?"
IF ERRORLEVEL 2 goto TheCDBTool
IF ERRORLEVEL 1 echo Running PAKTool
echo on 
PAKTool -Expand -OutDir %Resources%\ResPAK\ -RefPak "%Root%\res.pak" 
@echo off
goto TheCDBTool


:TheCDBTool 
CHOICE /M "Do you want to run CDBTool?"
IF ERRORLEVEL 2 goto End
IF ERRORLEVEL 1 echo Running CDBTool
echo on
CDBTool -Expand -OutDir %Resources%\ExpandedCDB\ -RefCDB "%Resources%\ResPAK\data.cdb"
@echo off
if errorlevel 1 echo unsuccessfull
echo "Ran CDBTool"

:End
Pause
@echo on

@rem cmd /k
