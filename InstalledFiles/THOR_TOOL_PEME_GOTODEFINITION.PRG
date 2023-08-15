Lparameters lxParam1

****************************************************************
****************************************************************
* Standard prefix for all tools for Thor, allowing this tool to
*   tell Thor about itself.

If Pcount() = 1								;
		And 'O' = Vartype (m.lxParam1)		;
		And 'thorinfo' = Lower (m.lxParam1.Class)

	With m.lxParam1

		* Required
		.Prompt             = 'GoToDefinition' && used when tool appears in a menu
		.AppID              = 'GoToDefinition'
		Text To .Description Noshow
Go to the definition of the name under the cursor, which can be any of :
  - a method
  - an object
  - a PRG
  - a procedure or function in a PRG
  - a constant (#Define ...)
  - a form
  - a class
  - DODEFAULT
  - THIS
  - THISFORM

If none of the above, asks if the name is to be of a new property or method; if a method, it can be edited immediately.

Customizable to handle names other than those mentioned above; for instance, to open and browse a DBF.
		Endtext

		* Optional
		.StatusBarText	 = 'Go to the definition of the name under the cursor; method, PRG, procedure, etc.'
		.Summary		 = 'Go to the definition of the name under the cursor; method, PRG, procedure, etc.' && if empty, first line of .Description is used
		.Classes            = 'loEditorWin = EditorWin of Thor_Proc_EditorWin.PRG|https://github.com/VFPX/Thor/blob/master/Docs/Thor_editorwindow_object.md' 
		.OptionClasses      = 'clsSourceControl, clsChangeClassVFPDialog, clsResizeWindow, clsCreateLocals, clsBeautifyX'   
		.CanRunAtStartUp = .F.

		* For public tools, such as PEM Editor, etc.
		.Category = 'Go To'
		.Source	  = 'IDE Tools' && Deprecated; use .Category instead
		.Version  = 'GoToDefinition V2' 
		.Link 	  = 'https://github.com/VFPX/GoToDefinition'
		.Sort	  = -1 && the sort order for all items from the same .Source
		.PlugIns  = 'GetDefaultValue, GetNewMethodHeader, GoToDefinition'

		.ForumName = 'GoToDefinition'
		.ForumLink = 'https://github.com/VFPX/GoToDefinition/issues'
	Endwith

	Return m.lxParam1
Endif

If Pcount() = 0
	Do ToolCode
Else
	Do ToolCode With m.lxParam1
Endif

Return

****************************************************************
****************************************************************
* Normal processing for this tool begins here.                  
Procedure ToolCode
	Lparameters lxParam1
	Local lcVCX, loGoToDefinition

	If Type('_Screen.cThorDispatcher') # 'C'
		Messagebox('Thor is not active; this tool requires Thor', 16, 'Thor is not active', 0)
		Return
	Endif

	Execscript (_Screen.cThorDispatcher, 'PEMEditor_StartIDETools')

	lcVCX			 = Execscript (_Screen.cThorDispatcher, 'Full path=thor_proc_gotodefinition.vcx')
	loGoToDefinition = Newobject('GoToDefinition', m.lcVCX)
	m.loGoToDefinition.Run()
	
	m.loGoToDefinition = Null

Endproc




Define Class clsSourceControl As Custom

	Tool		  = 'Source Control'
	Key			  = 'Source Control'
	Value		  = .F.
	EditClassName = 'clsSourceControl of Thor_Options_SourceControl.VCX'

Enddefine


Define Class clsChangeClassVFPDialog As Custom

	Tool		  = 'ReDefine Parent Class'
	Key			  = 'ReDefine Parent Class'
	Value		  = .F.
	EditClassName = 'clsChangeClassVFPDialog of Thor_options_ChanceClassVFPDialog.VCX'

Enddefine


Define Class clsResizeWindow As Custom

	Tool		  = 'Move/Resize Code Window'
	Key			  = 'Move/Resize Code Window'
	Value		  = ''
	EditClassName = 'clsResizeWindow of Thor_Options_ResizeWindow.VCX'

Enddefine


Define Class clsCreateLocals As Custom

	Tool		  = 'Create Locals'
	Key			  = 'Create Locals'
	Value		  = ''
	EditClassName = 'clsCreateLocals of Thor_Options_CreateLocals.VCX'

Enddefine


Define Class clsBeautifyX As Custom

	Tool		  = 'BeautifyX'
	Key			  = 'BeautifyX'
	Value		  = ''
	EditClassName = 'clsBeautifyX of Thor_Options_BeautifyX.VCX'

Enddefine
	