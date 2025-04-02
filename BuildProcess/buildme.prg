Local lcVersionFile, lcVersionText

lcVersionFile = 'InstalledFiles\Procs\GoToDefinitionVersion.h'
Erase (m.lcVersionFile)

lcVersionText = Textmerge('#DEFINE VERSION_NUMBER "GoToDefinition Ver <<pcVersion>> : <<pcVersionDate>>"')
Strtofile(m.lcVersionText, m.lcVersionFile)

Compile Form 'InstalledFiles\Procs\*.scx'

Compile Classlib 'InstalledFiles\Procs\*.vcx'
