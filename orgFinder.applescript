on doOrgLink()
    global theURL
    global theTitle
    tell application "Finder"
	set theScheme to "file:/"
	set theItem to selection as alias
	set thePath to POSIX path of theItem
	set theShortTitle to (name of (get info for theItem))
	set theTitle to theShortTitle & ":" & "Finder"
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    -- set escPath to encodeURIComponent(thePath)
    -- set escShortTitle to encodeURIComponent(theShortTitle)
    -- set escTitle to encodeURIComponent(theTitle)

    -- set theLink to theProtocol & escScheme & escPath & "/" & escTitle & "/" & escShortTitle & ":" & escApp
    set theURL to theScheme & thePath
    set theTitle to theShortTitle
end doOrgLink
