on doOrgLink()
    global theURL
    global theTitle
    tell application "Firefox"
	activate
	set oldClipboard to the clipboard
	tell application "System Events"
	    keystroke "l" using command down
	    keystroke "c" using command down
	end tell
	delay 0.15
	set theURL to the clipboard
	set the clipboard to oldClipboard
	set theTitle to (get name of window 1)
    end tell
end doOrgLink
