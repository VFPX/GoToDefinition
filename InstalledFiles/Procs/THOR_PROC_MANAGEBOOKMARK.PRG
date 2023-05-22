Lparameters lcAction

Local loEditorWin, loThorUtils, loWindows

* Actions:
*	Add
*	Remove
*	Toggle
*	Cycle

* List of Bookmarks .. newest at the end
If Pemstatus(_Screen, 'aGoToDefBookmark', 5) = .F.
	_Screen.AddProperty('aGoToDefBookmark[1, 4]')
Endif

loEditorWin	= Execscript(_Screen.cThorDispatcher, 'Thor_Proc_EditorWin')

loWindows	= m.loEditorWin.GetOpenWindows()
CleanupList(m.loWindows) && Discard any bookmarks from no longer active windows

Do Case
	Case m.lcAction = 'Add'
		RemoveBookMark(m.loEditorWin) && Just in case it's already there
		AddBookMark(m.loEditorWin)

	Case m.lcAction = 'Remove'
		RemoveBookMark(m.loEditorWin) 

	Case m.lcAction = 'Toggle'
		loThorUtils	= Execscript (_Screen.cThorDispatcher, 'Thor_Proc_Utils')
		Do Case
			Case RemoveBookMark(m.loEditorWin)
				m.loThorUtils.WaitWindow('Bookmark Removed')
			Case AddBookMark(m.loEditorWin)
				m.loThorUtils.WaitWindow('Bookmark Added')
		Endcase

	Case m.lcAction = 'Cycle'
		CycleBookMark(m.loEditorWin)

Endcase


Procedure AddBookMark(loEditorWin)
	Local lnNewRow, lnWindowType

	lnWindowType = m.loEditorWin.FindWindow()
	If Inlist(m.lnWindowType, 1, 8, 10)
		lnSelStart = m.loEditorWin.GetSelStart()
		lnSelEnd   = m.loEditorWin.GetSelEnd()

		lcTitle		   = m.loEditorWin.GetTitle()
		lnWindowHandle = m.loEditorWin.GetWindowHandle()

		With _Screen
			Dimension .aGoToDefBookmark[GetRowCount() + 1, 4]
			lnNewRow = 2
			Ains(.aGoToDefBookmark, m.lnNewRow )
			.aGoToDefBookmark[m.lnNewRow, 1] = m.lcTitle
			.aGoToDefBookmark[m.lnNewRow, 2] = m.lnWindowHandle
			.aGoToDefBookmark[m.lnNewRow, 3] = m.lnSelStart
			.aGoToDefBookmark[m.lnNewRow, 4] = m.lnSelEnd
		Endwith
		Return .F.
	Else
		Return .F.
	Endif && Inlist(m.lnWindowType, 1, 8, 10)

Endproc



Procedure RemoveBookMark(loEditorWin)

	Local lcTitle, llAnyFound, lnRow, lnSelEnd, lnSelStart, lnWindowHandle, lnWindowType
	Local loThorUtils

	lnWindowType = m.loEditorWin.FindWindow()
	llAnyFound	 = .F.

	If Inlist(m.lnWindowType, 1, 8, 10)
		lnSelStart = m.loEditorWin.GetSelStart()
		lnSelEnd   = m.loEditorWin.GetSelEnd()

		lcTitle		   = m.loEditorWin.GetTitle()
		lnWindowHandle = m.loEditorWin.GetWindowHandle()

		With _Screen
			lnRowCount = GetRowCount()
			For lnRow =  m.lnRowCount To 2 Step - 1
				If .aGoToDefBookmark[m.lnRow, 1] = m.lcTitle						;
						And .aGoToDefBookmark[m.lnRow, 2] = m.lnWindowHandle		;
						And .aGoToDefBookmark[m.lnRow, 3] = m.lnSelStart
					Adel(.aGoToDefBookmark, m.lnRow)
					lnRowCount = m.lnRowCount - 1
					Dimension _Screen.aGoToDefBookmark(m.lnRowCount, 4)
					llAnyFound = .T.
				Endif
			Endfor

		Endwith && _Screen
	Endif && Inlist(m.lnWindowType, 1, 8, 10)
	Return m.llAnyFound
Endproc


Procedure CycleBookMark(loEditorWin)

	Local lcTitle, lnHandle, lnRow, lnSelEnd, lnSelStart

	lnRowCount = GetRowCount()

	If m.lnRowCount > 1
		* Choose the most recent (bottom of list), make it active, move to top of list
		lnRow	   = m.lnRowCount
		lcTitle	   = _Screen.aGoToDefBookmark[m.lnRow, 1]
		lnHandle   = _Screen.aGoToDefBookmark[m.lnRow, 2]
		lnSelStart = _Screen.aGoToDefBookmark[m.lnRow, 3]
		lnSelEnd   = _Screen.aGoToDefBookmark[m.lnRow, 4]

		m.loEditorWin.SelectWindow(m.lnHandle)
		m.loEditorWin.SetHandle(m.lnHandle)
		m.loEditorWin.SetInsertionPoint (m.lnSelStart)
		*!* ******** JRN Removed 2022-11-12 ********
		*!* Keyboard '{RIGHTARROW}{LEFTARROW}'
		*!* DoEvents
		m.loEditorWin.Select (m.lnSelStart, m.lnSelEnd)

		*** JRN 2021-12-14 : Move this guy to beginning of list
		Ains(_Screen.aGoToDefBookmark, 2)
		lnRow = 2

		_Screen.aGoToDefBookmark[m.lnRow, 1] = m.lcTitle
		_Screen.aGoToDefBookmark[m.lnRow, 2] = m.lnHandle
		_Screen.aGoToDefBookmark[m.lnRow, 3] = m.lnSelStart
		_Screen.aGoToDefBookmark[m.lnRow, 4] = m.lnSelEnd

	Endif
Endproc


Procedure CleanupList(loWindows)
	Local lcTitle, lcWindowName, llActive, lnHandle, lnRow, lnRowCount, lnWindow, loThisWindow

	lnRowCount = GetRowCount()
	For lnRow = m.lnRowCount To 2 Step - 1
		lcTitle	 = _Screen.aGoToDefBookmark[m.lnRow, 1]
		lnHandle = _Screen.aGoToDefBookmark[m.lnRow, 2]
		llActive = .F.

		For lnWindow = 1 To m.loWindows.Count
			loThisWindow = m.loWindows(m.lnWindow)
			lcWindowName = Alltrim(m.loThisWindow.WindowName, 1, ' ', '*')
			If m.lnHandle = m.loThisWindow.nWHAndle And m.lcTitle == m.lcWindowName && check if still active
				llActive = .T.
			Endif
		Endfor

		If Not m.llActive
			Adel(_Screen.aGoToDefBookmark, m.lnRow)
			lnRowCount = m.lnRowCount - 1
			Dimension _Screen.aGoToDefBookmark(m.lnRowCount, 4)
		Endif
	Endfor && lnRow = m.lnRowCount To 2 Step - 1 && newest ones are added at the end
Endproc


Procedure GetRowCount
	Return Alen(_Screen.aGoToDefBookmark, 1)
Endproc


 