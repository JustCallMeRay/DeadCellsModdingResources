@echo off

@Call DeadCellsPaths.bat 

@rem echo %Root%
CD %ModTools%
echo %CD%
echo In ModTools

:ThePAKTool
CHOICE /C YN /M "Do you want to run PAKTool?"
IF ERRORLEVEL 2 goto TheCDBTool
IF ERRORLEVEL 1 echo Running PAKTool, this may take some time
echo on 
PAKTool -Expand -OutDir %Resources%\ResPAK\ -RefPak "%Root%\res.pak" 
@echo off
echo Done, press any key to contiue 
@pause
goto TheCDBTool


:TheCDBTool 
CHOICE /M "Do you want to run CDBTool?"
IF ERRORLEVEL 2 goto End
IF ERRORLEVEL 1 echo Running CDBTool, this may take some time
echo on
CDBTool -Expand -OutDir %Resources%\ExpandedCDB\ -RefCDB "%Resources%\ResPAK\data.cdb"
@echo off
echo Done, press any key to contiue 
@pause

:End
Pause
@echo on

@rem cmd /k
