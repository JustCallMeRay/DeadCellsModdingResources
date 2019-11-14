@echo off

:Info
echo You will have to edit this file. Use notepad, notepad++ or an IDE
echo. 
echo Root folder is where your dead cells.exe file is stored
echo ModTools folder comes with dead cells, if you haven't moved it leave as default. 
echo Resources is the folder you want the unpacked files to be placed in 
echo. 
echo DO NOT use quoteation or double quotes, it will not work
Echo.  
echo You DO NOT have to open this file in cmd prompt

:Variables
set Root=C:\Program Files (x86)\Steam\steamapps\common\Dead Cells
set ModTools=%Root%\ModTools
set Resources=C:\Users\You!!!!\Documents\DeadcellsModding
set Output=%Resources%\PackedData
echo var done