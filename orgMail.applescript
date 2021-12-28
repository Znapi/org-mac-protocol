on doOrgLink()
    global theURL
    global theTitle
    tell application "Mail"
	set theSelection to selection
	repeat with theMessage in theSelection
	    set theID to message id of theMessage
	    set theShortSubject to (subject of theMessage)
	    set theSubject to theShortSubject & ":" & theApp
	    set theContent to content of theMessage
	end repeat
	set theScheme to "message://"
    end tell

    -- set escID to encodeURIComponent(theID)
    -- set escShortSubject to encodeURIComponent(theShortSubject)
    -- set escSubject to encodeURIComponent(theSubject)
    -- set escScheme to encodeURIComponent(theScheme)
    -- set escContent to encodeURIComponent(theContent)

    -- set theLink to theProtocol & escScheme & escID & "/" & escSubject & "/" & escShortSubject & "/" & escContent & ":" & escApp
    set theURL to theScheme & theID
    set theTitle to theShortSubject
end doOrgLink
