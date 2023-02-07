#Include GoToDefinitionVersion.h

* characters
#Define CR               	Chr(13)
#Define LF               	Chr(10)
#Define CRLF             	Chr(13)+Chr(10)
#Define Tab				    Chr(9)

#include FoxPro.H

#define ccCR							chr(13)
	* carriage return
#define ccLF							chr(10)
	* linefeed
#define ccCRLF							chr(13) + chr(10)
	* carriage return + linefeed
#define ccTAB							chr(9)
	* tab

*-- Function Parameters
*-- MessageBox parameters
#DEFINE MB_OK                   0       && OK button only
#DEFINE MB_OKCANCEL             1       && OK and Cancel buttons
#DEFINE MB_ABORTRETRYIGNORE     2       && Abort, Retry, and Ignore buttons
#DEFINE MB_YESNOCANCEL          3       && Yes, No, and Cancel buttons
#DEFINE MB_YESNO                4       && Yes and No buttons
#DEFINE MB_RETRYCANCEL          5       && Retry and Cancel buttons

#DEFINE MB_ICONSTOP             16      && Critical message
#DEFINE MB_ICONQUESTION         32      && Warning query
#DEFINE MB_ICONEXCLAMATION      48      && Warning message
#DEFINE MB_ICONINFORMATION      64      && Information message

#DEFINE MB_APPLMODAL            0       && Application modal message box
#DEFINE MB_DEFBUTTON1           0       && First button is default
#DEFINE MB_DEFBUTTON2           256     && Second button is default
#DEFINE MB_DEFBUTTON3           512     && Third button is default
#DEFINE MB_SYSTEMMODAL          4096    && System Modal

#Define cnMB_Timeout					4000	&& 4 seconds
#Define ccLOC_Title_DefNotFound			VERSION_NUMBER
#Define ccLOC_Cap_DefNotFound			"Definition for '<insert>' not found.     "

#Define 	CommandWindow	0
#Define		PRGFile			1
#Define		ModifyFile		2
#Define		MenuCode		8
#Define		MethodCode		10
#Define		DBCCode			12

#Define ccTextFileExtensions			" ASP ASPX BAS BAT C CGI CP CPP CSS FPW FRA H HTM HTML INI LOG MPR PHP PS1 PY PYC PYO QPR RB SCA SQL TXT VCA XML "
#define ccTopDividerLine				'*' + Replicate('=', 80) + ccCRLF
#define ccBottomDividerLine				'*' + Replicate('-', 80) + ccCRLF
