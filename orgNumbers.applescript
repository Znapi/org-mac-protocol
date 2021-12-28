on doOrgLink()
    global theURL
    global theTitle
    tell application "Numbers"
	set theScheme to "numbers:"
	set theDoc to front document
	set theShortTitle to (name of theDoc)
	set theTitle to theShortTitle & ":" & theApp
	set thePath to (path of theDoc) & "::"
	tell theDoc
	    set theSheet to 0
	    repeat with i from 1 to the count of sheets
		tell sheet i
		    set x to the count of (tables whose selection range is not missing value)
		end tell
		if x is not 0 then
		    set theSheet to i
		    exit repeat
		end if
	    end repeat
	    if theSheet is 0 then
		set theSheet to 1 & "::"
		set theTable to 1 & "::"
		set theRange to "A1:A1"
		set theContent to ""
	    else
		tell sheet theSheet
		    set theTable to first table whose selection range is not missing value
		    tell theTable
			set theSheet to (theSheet as text) & "::"
			set theTable to (name of theTable) & "::"
			set theRange to (name of selection range)
			set theRangeValues to value of every cell of selection range
			set AppleScript's text item delimiters to " "
			set theContent to theRangeValues as string
			set AppleScript's text item delimiters to ""
		    end tell
		end tell
	    end if
	end tell
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    -- set escShortTitle to encodeURIComponent(theShortTitle)
    -- set escTitle to encodeURIComponent(theTitle)
    -- set escPath to encodeURIComponent(thePath)
    -- set escSheet to encodeURIComponent(theSheet)
    -- set escTable to encodeURIComponent(theTable)
    -- set escRange to encodeURIComponent(theRange)
    -- set escContent to encodeURIComponent(theContent)

    -- set theLink to theProtocol & escScheme & escPath & escSheet & escTable & escRange & "/" & escTitle & "/" & escShortTitle & "/" & escContent & ":" & escApp
    set theURL to theScheme & thePath & theSheet & theTable & theRange
    set theTitle to theShortTitle
end doOrgLink
