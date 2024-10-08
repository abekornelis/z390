rem
rem Maintenance note: this procedure leaves trash behind.
rem after successful execution it should clean up after itself.
rem When a failure occurs these files should be left in place for diagnostic purposes.
rem

SET CICSPATH=cics\vsam
SET PROGRAM=Z390CAT1
CALL bat\MZ390 %CICSPATH%\%PROGRAM% SYSMAC(%CICSPATH%+MAC) SYSCPY(%CICSPATH%+MAC)
IF ERRORLEVEL 1 GOTO WRONG
CALL bat\LZ390 %CICSPATH%\%PROGRAM%
IF ERRORLEVEL 1 GOTO WRONG
rem
rem BUILD THE VARIABLE ESDS
SET INFILE=%CICSPATH%\MYFILE1V.TXT[RECFM=VT]
SET OUTFILE=%CICSPATH%\Z390CAT1.MYFILE01
CALL bat\EZ390 LINKLIB\REPRO %1
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYFILE01
SET OUTFILE=%CICSPATH%\MYFILE1V.TF2[RECFM=VT]
CALL bat\EZ390 LINKLIB\REPRO %1
IF ERRORLEVEL 1 GOTO WRONG
rem
rem BUILD THE FIXED ESDS
SET INFILE=%CICSPATH%\MYFILE2F.TXT[RECFM=FT]
SET OUTFILE=%CICSPATH%\Z390CAT1.MYFILE02
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYFILE02
SET OUTFILE=%CICSPATH%\MYFILE2F.TF2[RECFM=FT]
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem
rem BUILD THE FIXED RRDS
SET INFILE=%CICSPATH%\MYFILE6F.TF1
SET OUTFILE=%CICSPATH%\Z390CAT1.MYFILE06
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYFILE06
SET OUTFILE=%CICSPATH%\MYFILE6F.TF2
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem
rem BUILD THE VARIABLE RRDS
SET INFILE=%CICSPATH%\MYFILE7V.TF1
SET OUTFILE=%CICSPATH%\Z390CAT1.MYFILE07
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYFILE07
SET OUTFILE=%CICSPATH%\MYFILE7V.TF2
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem
rem BUILD THE FIXED KSDS
SET INFILE=%CICSPATH%\MYFILE8F.TXT[RECFM=FT]
SET OUTFILE=%CICSPATH%\Z390CAT1.MYFILE08
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYFILE08
SET OUTFILE=%CICSPATH%\MYFILE8F.TF2[RECFM=FT]
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem
rem BUILD THE VARIABLE KSDS
SET INFILE=%CICSPATH%\MYFILE9V.TXT[RECFM=VT]
SET OUTFILE=%CICSPATH%\Z390CAT1.MYFILE09
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYFILE09
SET OUTFILE=%CICSPATH%\MYFILE9V.TF2[RECFM=VT]
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem
rem BUILD THE FIXED ESDS'S MYWORD01 AND MYWORD02
SET INFILE=%CICSPATH%\MYWORD1F.TXT[RECFM=FT]
SET OUTFILE=%CICSPATH%\Z390CAT1.MYWORD01
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYWORD01
SET OUTFILE=%CICSPATH%\MYWORD1F.TF2[RECFM=FT]
CALL bat\EZ390 LINKLIB\REPRO
rem RUN REPRO TO BUILD AIX03
SET INFILE=%CICSPATH%\Z390CAT1.MYWORD01
SET OUTFILE=%CICSPATH%\Z390CAT1.MYAIX03
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO DUMP AIX03 VIA PATH
SET INFILE=%CICSPATH%\Z390CAT1.AIXESDS
SET OUTFILE=%CICSPATH%\MYAIX03.TXT
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem
SET INFILE=%CICSPATH%\MYWORD2F.TXT[RECFM=FT]
SET OUTFILE=%CICSPATH%\Z390CAT1.MYWORD02
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYWORD02
SET OUTFILE=%CICSPATH%\MYWORD2F.TF2[RECFM=FT]
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem BUILD THE FIXED KSDS MYKSDS01
SET INFILE=%CICSPATH%\MYKSDS1F.TXT[RECFM=FT]
SET OUTFILE=%CICSPATH%\Z390CAT1.MYKSDS01
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO UNLOAD FROM .VES TO .TF2
SET INFILE=%CICSPATH%\Z390CAT1.MYKSDS01
SET OUTFILE=%CICSPATH%\MYKSDS1F.TF2[RECFM=FT]
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO BUILD AIX01
SET INFILE=%CICSPATH%\Z390CAT1.MYKSDS01
SET OUTFILE=%CICSPATH%\Z390CAT1.MYAIX01
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO BUILD AIX02
SET INFILE=%CICSPATH%\Z390CAT1.MYKSDS01
SET OUTFILE=%CICSPATH%\Z390CAT1.MYAIX02
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO DUMP AIX01 VIA PATH
SET INFILE=%CICSPATH%\Z390CAT1.AIXSURN
SET OUTFILE=%CICSPATH%\MYAIX01.TXT
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
rem RUN REPRO TO DUMP AIX02 VIA PATH
SET INFILE=%CICSPATH%\Z390CAT1.AIXNAME
SET OUTFILE=%CICSPATH%\MYAIX02.TXT
CALL bat\EZ390 LINKLIB\REPRO
IF ERRORLEVEL 1 GOTO WRONG
GOTO END
:WRONG
REM ERROR ERROR ERROR
:END
