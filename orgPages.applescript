on doOrgLink()
    global theURL
    global theTitle
    tell application "Pages"
	set theScheme to "pages:"
	set theDoc to front document
	set theShortTitle to (name of theDoc)
	set theTitle to theShortTitle & ":" & theApp
	set thePath to (path of theDoc) & "::"
	set theContent to the selection of theDoc
	set theCharOff to character offset of theContent
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    -- set escShortTitle to encodeURIComponent(theShortTitle)
    -- set escTitle to encodeURIComponent(theTitle)
    -- set escPath to encodeURIComponent(thePath)
    -- set escContent to encodeURIComponent(theContent as text)

    -- set theLink to theProtocol & escScheme & escPath & theCharOff & "/" & escTitle & "/" & escShortTitle & "/" & escContent & ":" & escApp
    set theURL to theScheme & thePath & theCharOff
    set theTitle to theShortTitle
end doOrgLink
