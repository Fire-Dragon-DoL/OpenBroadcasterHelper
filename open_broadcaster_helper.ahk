#SingleInstance force
#InstallKeybdHook

;# WIN
;! ALT
;^ CTRL

UI:
  Title = Open Broadcaster Helper
  Menu , Tray , Icon , %A_ScriptDir%\open_broadcaster_helper.ico ,, 1
  Menu , Tray , Tip , %Title%

  GoSub InitConfig
  GoSub LoadConfig
Return

InitConfig:
  ConfigFileDir = %A_ScriptDir%
  ConfigFilePath = %ConfigFileDir%\open_broadcaster_helper_settings.ini
Return

LoadConfig:
  IniRead AudioRepeaterPath, %ConfigFilePath%, AudioRepeater, Path

  ; Device1
  AudioRepeaterPID1 := (-1)
  IniRead AudioRepeaterInput1, %ConfigFilePath%, Device1, InputDevice
  IniRead AudioRepeaterOutput1, %ConfigFilePath%, Device1, OutputDevice
  IniRead ToggleHotkey1, %ConfigFilePath%, Device1, Toggle, false
  ; Device2
  AudioRepeaterPID2 := (-1)
  IniRead AudioRepeaterInput2, %ConfigFilePath%, Device2, InputDevice
  IniRead AudioRepeaterOutput2, %ConfigFilePath%, Device2, OutputDevice
  IniRead ToggleHotkey2, %ConfigFilePath%, Device2, Toggle, false
  ; Device3
  AudioRepeaterPID3 := (-1)
  IniRead AudioRepeaterInput3, %ConfigFilePath%, Device3, InputDevice
  IniRead AudioRepeaterOutput3, %ConfigFilePath%, Device3, OutputDevice
  IniRead ToggleHotkey3, %ConfigFilePath%, Device3, Toggle, false
  ; Device4
  AudioRepeaterPID4 := (-1)
  IniRead AudioRepeaterInput4, %ConfigFilePath%, Device4, InputDevice
  IniRead AudioRepeaterOutput4, %ConfigFilePath%, Device4, OutputDevice
  IniRead ToggleHotkey4, %ConfigFilePath%, Device4, Toggle, false

  If (ToggleHotkey1)
    Hotkey %ToggleHotkey1%, OnToggleAudioRepeater1
  If (ToggleHotkey2)
    Hotkey %ToggleHotkey2%, OnToggleAudioRepeater2
  If (ToggleHotkey3)
    Hotkey %ToggleHotkey3%, OnToggleAudioRepeater3
  If (ToggleHotkey4)
    Hotkey %ToggleHotkey4%, OnToggleAudioRepeater4
Return

AudioRepeaterCommand(inputDev, outputDev)
{
  global AudioRepeaterPath

  AudioRepeaterWithParams = %AudioRepeaterPath% /AutoStart /Input:"%inputDev%" /Output:"%outputDev%"

  Return %AudioRepeaterWithParams%
}

OnToggleAudioRepeater1:
  ToggleAudioRepeater1()
Return
OnToggleAudioRepeater2:
  ToggleAudioRepeater2()
Return
OnToggleAudioRepeater3:
  ToggleAudioRepeater3()
Return
OnToggleAudioRepeater4:
  ToggleAudioRepeater4()
Return

CloseAudioRepeater1()
{
  global AudioRepeaterPID1

  If (AudioRepeaterPID1 = (-1))
    Return

  Process Close, %AudioRepeaterPID1%
  AudioRepeaterPID1 := (-1)
}
CloseAudioRepeater2()
{
  global AudioRepeaterPID2

  If (AudioRepeaterPID2 = (-1))
    Return

  Process Close, %AudioRepeaterPID2%
  AudioRepeaterPID2 := (-1)
}
CloseAudioRepeater3()
{
  global AudioRepeaterPID3

  If (AudioRepeaterPID3 = (-1))
    Return

  Process Close, %AudioRepeaterPID3%
  AudioRepeaterPID3 := (-1)
}
CloseAudioRepeater4()
{
  global AudioRepeaterPID4

  If (AudioRepeaterPID4 = (-1))
    Return

  Process Close, %AudioRepeaterPID4%
  AudioRepeaterPID4 := (-1)
}

OpenAudioRepeater1()
{
  global AudioRepeaterPID1
  global AudioRepeaterInput1
  global AudioRepeaterOutput1

  If (AudioRepeaterPID1 <> (-1))
    Return

  repeaterWithParams := AudioRepeaterCommand(AudioRepeaterInput1, AudioRepeaterOutput1)
  Run %repeaterWithParams%,, Min, AudioRepeaterPID1
}
OpenAudioRepeater2()
{
  global AudioRepeaterPID2
  global AudioRepeaterInput2
  global AudioRepeaterOutput2

  If (AudioRepeaterPID2 <> (-1))
    Return

  repeaterWithParams := AudioRepeaterCommand(AudioRepeaterInput2, AudioRepeaterOutput2)
  Run %repeaterWithParams%,, Min, AudioRepeaterPID2
}
OpenAudioRepeater3()
{
  global AudioRepeaterPID3
  global AudioRepeaterInput3
  global AudioRepeaterOutput3

  If (AudioRepeaterPID3 <> (-1))
    Return

  repeaterWithParams := AudioRepeaterCommand(AudioRepeaterInput3, AudioRepeaterOutput3)
  Run %repeaterWithParams%,, Min, AudioRepeaterPID3
}
OpenAudioRepeater4()
{
  global AudioRepeaterPID4
  global AudioRepeaterInput4
  global AudioRepeaterOutput4

  If (AudioRepeaterPID4 <> (-1))
    Return

  repeaterWithParams := AudioRepeaterCommand(AudioRepeaterInput4, AudioRepeaterOutput4)
  Run %repeaterWithParams%,, Min, AudioRepeaterPID4
}

ToggleAudioRepeater1()
{
  global AudioRepeaterPID1

  If (AudioRepeaterPID1 = (-1)) {
    OpenAudioRepeater1()
  } Else {
    CloseAudioRepeater1()
  }
}
ToggleAudioRepeater2()
{
  global AudioRepeaterPID2

  If (AudioRepeaterPID2 = (-1)) {
    OpenAudioRepeater2()
  } Else {
    CloseAudioRepeater2()
  }
}
ToggleAudioRepeater3()
{
  global AudioRepeaterPID3

  If (AudioRepeaterPID3 = (-1)) {
    OpenAudioRepeater3()
  } Else {
    CloseAudioRepeater3()
  }
}
ToggleAudioRepeater4()
{
  global AudioRepeaterPID4

  If (AudioRepeaterPID4 = (-1)) {
    OpenAudioRepeater4()
  } Else {
    CloseAudioRepeater4()
  }
}

GuiClose:
  CloseAudioRepeater1()
  CloseAudioRepeater2()
  CloseAudioRepeater3()
  CloseAudioRepeater4()
  ExitApp