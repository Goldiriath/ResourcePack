Dim fso, winShell, MyTarget, MySource, file
Set fso = CreateObject("Scripting.FileSystemObject")
Set winShell = createObject("shell.application")


MyTarget = fso.GetAbsolutePathName(WScript.Arguments.Item(0))
MySource = fso.GetAbsolutePathName(WScript.Arguments.Item(1))

'create a new clean zip archive
Set file = fso.CreateTextFile(MyTarget, True)
file.write("PK" & chr(5) & chr(6) & string(18,chr(0)))
file.close

winShell.NameSpace(MyTarget).CopyHere winShell.NameSpace(MySource).Items

do until winShell.namespace(MyTarget).items.count = winShell.namespace(MySource).items.count
    wscript.sleep 1000
loop

Set winShell = Nothing
Set fso = Nothing
