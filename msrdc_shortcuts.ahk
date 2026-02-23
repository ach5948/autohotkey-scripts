#Requires AutoHotKey v2.0
Persistent(true)

global stopFlag := false
global typing := false
InstallKeybdHook(true, true)

SetTimer(RehookKeybd, 500)

return

RehookKeybd() {
    InstallKeybdHook(true, true)
    return
}

TypeAbort(ThisHotKey)
{
    global stopFlag
    stopFlag := true
    return
}

TypeString(content_in, chunk_size := 4)
{
    global stopFalse := false

    ; Save + Update Send Mode
    orig_send_mode := A_SendMode
    SendMode("Event")

    ; Save + Update Key Delay
    orig_key_delay := A_KeyDelay
    orig_key_duration := A_KeyDuration
    ; ~250 characters per minute
    SetKeyDelay(50, 100)

    ; Enable Esc to abort paste
    HotKey("$Esc", TypeAbort, "On")

    content := StrReplace(content_in, "`r`n", "`n")
    counter := 1
    content_len := StrLen(content)
    Loop {
        if (stopFlag OR (counter >= (content_len + 1)))
        {
            break
        }
        send_string := SubStr(content, counter, chunk_size)
        SendText(send_string)
        counter := counter + StrLen(send_string)
    }

    HotKey("$Esc", "Off")

    ; Restore Key Delay
    SetKeyDelay(orig_key_delay, orig_key_duration)

    ; Restore Send Mode
    SendMode(orig_send_mode)
    return counter - 1
}

; Ctrl + Shift + Space
$+^Space::
{
    TypeString(A_Clipboard, 4)
    return
}

; Ctrl + Alt + Left
$^!Left:: {
    WinActivate("Program Manager")
    Send("^#{Left}")
    return
}

; Ctrl + Alt + Right
$^!Right:: {
    WinActivate("Program Manager")
    Send("^#{Right}")
    return
}
