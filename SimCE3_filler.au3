#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <File.au3>

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
; Click the respective "show curves" buttons in order that the data be collected by the mesh operation.
MouseClick("left",294,305,1,0)
MouseClick("left",369,305,1,0)
MouseClick("left",454,305,1,0)
MouseClick("left",615,305,1,0)
; Here will be aloop which reads the appropriate data from a vector.
MouseClick("left",76,144,2,0)
Send("+{END}{BS}55.5")
MouseClick("left",76,160,2,0)
Send("+{END}{BS}55.6")
MouseClick("left",76,174,2,0)
Send("+{END}{BS}55.7")
; The "save" routine
Send("^s")
$hWnd = WinWait("Save As", "")
ControlSetText($hWnd, "", "[CLASSNN:Edit1]", "D:\SIMCE3\Report_" & @YEAR & "-" & @MON & "-" & @MDAY & @HOUR & @MIN & @SEC & ".par")
ControlClick($hWnd,"","[CLASSNN:Button2]")
; Click mesh creator button
$mainW = WinWait("Report","")
ControlClick($mainW,"","[CLASSNN:Button39]")
; turn on mesh and check the data channel boxes.
ControlClick("3D Mesh","","[CLASSNN:Button3]")
MouseClick("left",518,356,1,0)
MouseClick("left",596,356,1,0)
MouseClick("left",686,356,1,0)
MouseClick("left",768,356,1,0)
MouseClick("left",851,356,1,0)
Local $arrt[6] = [0,10,20,30,40,50]
; insert a loop here to handle the repeated request for mesh generation. Numbers for the capillary length and time values
; will be defined as an array here and will essentially determine how many times the values will be looped through. Clicking the
; stop button will end it.
For $i = 0 To 4
   $wTtl = WinGetTitle($mainW,"")
   ControlClick("3D Mesh","","[CLASSNN:Edit1]")
   ControlSend("3D Mesh","","[CLASSNN:Edit1]","^a" & $wTtl & "05" & $arrt[$i] & ($arrt[$i+1]))
   ControlClick("3D Mesh","","[CLASSNN:Edit4]")
   ControlSend("3D Mesh","","[CLASSNN:Edit4]","^a" & 0)
   ControlClick("3D Mesh","","[CLASSNN:Edit5]")
   ControlSend("3D Mesh","","[CLASSNN:Edit5]","^a" & 5)
   ControlClick("3D Mesh","","[CLASSNN:Edit2]")
   ControlSend("3D Mesh","","[CLASSNN:Edit2]","^a" & $arrt[$i])
   ControlClick("3D Mesh","","[CLASSNN:Edit3]")
   ControlSend("3D Mesh","","[CLASSNN:Edit3]","^a" & ($arrt[$i+1]))
   ControlClick("3D Mesh","","[CLASSNN:Button1]")
; Click &START button
   ControlClick($mainW,"","[CLASSNN:Button23]")
; Wait for run to progress
   Sleep(10000)
Next
; stop run routine
ControlClick($mainW,"","[CLASSNN:Button24]")
; name dialogue box
$term = WinWait("Termination?","")
; Click &Yes
ControlClick($term,"","&Yes")
; Open new file (for end of loop)
Send("^n")
; Close program
ProcessClose($iPID)
