Lparameters lxParam1

****************************************************************
****************************************************************
* Standard prefix for all tools for Thor, allowing this tool to
*   tell Thor about itself.

If Pcount() = 1								;
		And 'O' = Vartype(m.lxParam1)		;
		And 'thorinfo' = Lower(m.lxParam1.Class)

	With m.lxParam1

		* Required
		.Prompt			 = 'Add/Remove BookMark'
		.AppID 			 = 'GoToDefinition'
		.Source			 = 'Thor Repository'
		.Category		 = 'Go To'
		.Author			 = 'Jim Nelson'
		.Version 		 = 'GoToDefinition V2' 
		.Link			 = 'https://github.com/VFPX/Thor/blob/master/Docs/NewsItems/Item_48.md'
		.CanRunAtStartUp = .F.
	Endwith

	Return m.lxParam1
Endif

Do ToolCode

Return


****************************************************************
****************************************************************
* Normal processing for this tool begins here.
Procedure ToolCode

	Execscript (_Screen.cThorDispatcher, 'THOR_Proc_ManageBookmark', 'Toggle')

Endproc
