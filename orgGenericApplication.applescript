on doOrgLink()
    global theApp
    global theURL
    global theTitle
    tell application (theApp as string)
	set theScheme to "file:/"
	set appUnsupported to false
	try
	    set theDoc to front document
	on error
	    set appUnsupported to true
	end try
	if appUnsupported is false then
	    set theShortTitle to (name of theDoc)
	    set theTitle to theShortTitle & ":" & theApp
	    set thePath to path of theDoc

	end if
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    if appUnsupported is true then
	-- set theLink to theProtocol & escScheme & escErrorURL & "/" & escErrorMessage & ":" & escApp
	set theURL to theScheme & theErrorUrl
	set theTitle to theErrorMesage
    else
	-- set escPath to encodeURIComponent(thePath)
	-- set escShortTitle to encodeURIComponent(theShortTitle)
	-- set escTitle to encodeURIComponent(theTitle)
	-- set theLink to theProtocol & escScheme & escPath & "/" & escTitle & "/" & escShortTitle
	set theURL to theScheme & thePath
	set theTitle to theShortTitle
    end
end doOrgLink
