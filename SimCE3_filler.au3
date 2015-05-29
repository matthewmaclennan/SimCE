#include <Constants.au3>
#include <MsgBoxConstants.au3>

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Matthew S. MacLennan

 Script Function:
	Fill in form in SimDCCE2.exe
	Currently maximized for Windows 7.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Local $iPID = Run("D:\SIMCE3\SimCE3\SimCE3.exe")
Local $wait = WinWait("[CLASS:Afx:400000:b:10003:6:aad0abd]","",3)
WinSetState("Untitled","",@SW_MAXIMIZE)
; Unfortunately, the form to fill is a BCGToolBar object, so I cannot fill it as per usual. I must resort to mouse clicking. Make sure the SimDCCE2 window fits the screen
; but is not maximized. Check the mouse coordinates listed.

MouseClick("left",76,144,2,0)
Send("+{END}{BS}55.5")
MouseClick("left",76,160,2,0)
Send("+{END}{BS}55.6")
MouseClick("left",76,174,2,0)
Send("+{END}{BS}55.7")
Send("^s")
$hWnd = WinWait("Save As", "")
ControlSetText($hWnd, "", "[CLASSNN:Edit1]", "Report_" & @YEAR & "-" & @MON & "-" & @MDAY & @HOUR & @MIN & @SEC & ".par")
ControlClick($hWnd,"","[CLASSNN:Button2]")
$mainW = WinWait("Report","")
; Click mesh creator button
ControlClick($mainW,"","[CLASSNN:Button39]")
; turn on mesh and fill empty places with following numbers
ControlClick("3D Mesh","","[CLASSNN:Button3]")
$wTtl = WinGetTitle($mainW,"")
ControlSend("3D Mesh","","[CLASSNN:Edit1]",$wTtl)
ControlClick("3D Mesh","","[CLASSNN:Button1]")
; Click &START button
ControlClick($mainW,"","[CLASSNN:Button23]")
; Wait for run to progress
Sleep(10000)
; stop run
ControlClick($mainW,"","[CLASSNN:Button24]")
; name dialogue box
$term = WinWait("Termination?","")
; Click &Yes
ControlClick($term,"","&Yes")
; Open new file (for end of loop)
Send("^n")
; Close program
ProcessClose($iPID)
