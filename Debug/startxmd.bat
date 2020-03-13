@echo off
rem Syntax: startxmd r|d target size

rem Clear variables
set xDir=
set x_xmd=
set config=
set target=
set size=
set sensorName=
set deviceNumber=
set bitFile=
set elfFile=

rem Set xilinx directory
set xDir=C:\Xilinx
if exist D:\Xilinx\SDK\2016.3\*.* set xDir=D:\Xilinx
echo Xilinx directory: %xDir%
set x_xmd=%xDir%\SDK\2016.3\bin\xmd.bat

rem Parse configuration parameter
if "%1"=="r" (
set config=Release
) else if "%1"=="d" (
set config=Debug
) else (
echo Error: Unknown configuration ^(%1^).
goto error
)

rem Parse target parameter
if "%2"=="output" (
set target=output
) else if "%2"=="storage" (
set target=storage
) else (
set target=proc
set sensorName=%2
)

rem Parse size parameter
set size=%3

rem Set programming parameter
if "%target%"=="proc" (
set deviceNumber=1
set bitFile=D:\Telops\FIR-00251-Proc\sdk\fir_00251_proc_%sensorName%\fir_00251_proc_%sensorName%_%size%.bit
set elfFile=D:\Telops\FIR-00251-Proc\sdk\fir_00251_proc_%sensorName%\fir_00251_proc_%sensorName%_%size%\%config%\fir_00251_proc_%sensorName%_%size%.elf
) else if "%target%"=="output" (
set deviceNumber=2
set bitFile=D:\Telops\FIR-00251-Output\sdk\hw_platform_%size%\fir_251_output_top_%size%.bit
set elfFile=D:\Telops\FIR-00251-Output\sdk\fir_00251_output_%size%\%config%\fir_00251_output_%size%.elf
) else if "%target%"=="storage" (
set deviceNumber=3
set bitFile=D:\Telops\FIR-00257-Storage\sdk\hw_platform_%size%\fir_257_top.bit
set elfFile=D:\Telops\FIR-00257-Storage\sdk\fir_00257_storage_%size%\%config%\fir_00257_storage_%size%.elf
)

if not exist %bitFile% (
echo Error: Cannot find %bitFile%.
goto error
)

for %%a in ("%bitFile%") do echo Bit file: %%~ta

if not exist %elfFile% (
echo Error: Cannot find %elfFile%.
goto error
)

for %%a in ("%elfFile%") do echo Elf file: %%~ta

set tclScript=startxmd.tcl
if exist %tclScript% del %tclScript%
>%tclScript% (
echo fpga -f %bitFile:\=/% -debugdevice deviceNr %deviceNumber%
echo connect mb mdm -debugdevice deviceNr %deviceNumber%
echo rst
echo dow %elfFile:\=/%
echo rst
echo run
)

%x_xmd% -tcl %tclScript%

goto end

:error
pause
exit

:end

