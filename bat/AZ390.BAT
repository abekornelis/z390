@if /I "%1" == "tron" (echo on) else (echo off)
rem execute az390 runtime with java runtime options:

setlocal
if /I "%1" == "tron" (set z_TraceMode=tron
                      shift /1
              ) else (if /I "%1" == "troff" (set z_TraceMode=troff
                                             shift /1
                                     ) else (set z_TraceMode=)
                      )
set /A z_NestLevel=%z_NestLevel%+1
rem ----- Lvl(%z_NestLevel%) Start %0 %1 %2 %3 %4 %5 %6 %7 %8 %9

if /I %1. == . (echo %0 ERROR: missing file name
                set z_ReturnCode=16
                goto return
                )

rem -classpath  path to jar file
rem -verbose:gc trace garbage collection to detect memory leaks
rem -XmsnK      set initial memory allocation to nK
rem -XmxnK      set max     memory allocation to nK
rem -Xrs        allow control break interruption of java tasks
java -classpath %~dps0..\jar\z390.jar -Xrs %J2SEOPTIONS% az390 %1 %2 %3 %4 %5 %6 %7 %8 %9

set z_ReturnCode=%ERRORLEVEL%
if %z_ReturnCode% EQU 0  goto return
if %z_ReturnCode% EQU 4 (echo %0 WARNING: See warnings on az390 generated prn file and console
                         goto return
                         )
rem ErrorLevel 1 for Java issues or ErrorLevel 8 / 12 for assembly issues
echo %0 ERROR: See errors on az390 generated prn file and console

:return
rem ----- Lvl(%z_NestLevel%)  End %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
exit /b %z_ReturnCode%
