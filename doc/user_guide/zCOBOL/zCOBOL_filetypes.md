---
hide:
- toc
---
# zCOBOL file types

TYPE | Format | File Description       | File or Report Format Description
-----|--------|------------------------|---
CBL  | ASCII  | COBOL source program   | 1-6 sequence #, 7 comment if not space, 8-11 area A, 12-72 area B.
CPZ  | ASCII  | COBOL copy book member | 1-6 sequence #, 7 comment if not space, 8-11 area A, 12-72 area B.
MLC  | ASCII  | Macro assembler source program generated by phase 1 of the zCOBOL compiler which uses `zcobol.class` regular expression based parser in z390.jar to read CBL source file and create MLC source file in one pass. | Macro call for each COBOL statement starting in area A and for each COBOL verb found in area B.  Working storage data items are mapped to WS macro call with level as first parameter.  Each macro call name is followed by positional parameters found following verb up to next verb or period. Periods are mapped to PERIOD macro call.  Parameters of the form keyword(..) are passed as single parameter.  Other ( and ) are passed as separate parameter in quotes.
BAL  | ASCII  | HLASM compatible source code generated by phase 2 of the zCOBOL compiler when using CBLC, CBLCL or CBLCLG commands.|HLASM compatible source statements generated by the zCOBOL macros during expansion of the generated MLC file.
CPY  | ASCII  | Generated copy file containing macro calls to define labels defined in a zCOBOL program.| LABEL generated zCOBOL name.