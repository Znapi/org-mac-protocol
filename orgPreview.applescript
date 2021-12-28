on doOrgLinkSub()
    tell application "Preview"
	set thePath to path of document of front window
	set theWindowTitle to name of front window
    end tell
    set thePageNumber to do shell script "echo '" & theWindowTitle & "' | sed -E 's/.*\\(page ([0-9]+) of [0-9]+\\)/\\1/'"
    return {thePath, thePageNumber}
end doOrgLinkSub

on doOrgLink()
    global theURL
    global theTitle
    set theData to doOrgLinkSub()
    set theURL to item 1 of theData
    set thePageNumber to item 2 of theData
    if thePageNumber is not "1" then
	set theURL to theURL & "::" & thePageNumber
    end if
    set theTitle to ""
end doOrgLink

on doOrgLinkAlt()
    global theURL
    global theTitle
    set theData to doOrgLinkSub()
    set theURL to item 1 of theData
    set thePageNumber to (((item 2 of theData) as number) + 1) as text
    set theURL to theURL & "::" & thePageNumber
    set theTitle to ""
end doOrgLink
