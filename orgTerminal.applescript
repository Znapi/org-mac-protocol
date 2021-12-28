on doOrgLink()
    global theURL
    global theTitle
    tell application "Terminal"
	tell front window
	    set theContent to contents of selected tab
	end tell
	set theScheme to "file:/"
	set theShortName to (name of front window)
	set theName to theShortName & ":" & theApp
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    -- set escShortName to encodeURIComponent(theShortName)
    -- set escName to encodeURIComponent(theName)
    -- set escContent to encodeURIComponent(theContent)

    -- set theLink to theProtocol & escScheme & escErrorURL & "/" & escName & "/" & escShortName & "/" & escContent & ":" & escApp
    set theURL to theScheme & theErrorURL
    set theTitle to theShortName
end doOrgLink
