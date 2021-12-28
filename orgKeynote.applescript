on doOrgLink()
    global theURL
    global theTitle
    tell application "Keynote"
	set theScheme to "keynote:"
	set theDoc to front slideshow
	set theShortTitle to (name of theDoc)
	set theTitle to theShortTitle & ":Keynote"
	set thePath to (path of theDoc) & "::"
	set theSlide to (current slide of front slideshow)
	set theSlideIndex to (slide number of theSlide)
	set theContent to (title of theSlide) & "

	" & (body of theSlide)
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    -- set escPath to encodeURIComponent(thePath)
    -- set escTitle to encodeURIComponent(theTitle)
    -- set escShortTitle to encodeURIComponent(theShortTitle)
    -- set escContent to encodeURIComponent(theContent)

    -- set theLink to theProtocol & escScheme & escPath & theSlideIndex & "/" & escTitle & "/" & escShortTitle & "/" & escContent & ":" & escApp
    set theURL to theScheme & thePath & theSlideIndex
    set theTitle to theShortTitle
end doOrgLink
