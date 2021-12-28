on doOrgLink()
    global theURL
    global theTitle
    tell application "Skim"
	set theDoc to front document
	set theShortTitle to (name of theDoc)
	set thePath to (path of theDoc) & "::"
	set thePage to (get index for current page of theDoc)
    end tell

    set theTitle to theShortTitle
    set theURL to thePath & thePage
end doOrgLink
