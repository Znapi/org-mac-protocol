on doOrgLink()
    global theURL
    global theTitle
    tell application "iTunes"
	set theScheme to "iTunes:"
	set theID to (persistent ID of (item 1 of selection))
	set theShortName to (name of (item 1 of selection))
	set theName to theShortName & ":" & theApp
	set theTitle to (name of (item 1 of selection))
	set theComposer to (composer of (item 1 of selection))
	set theAlbum to (album of (item 1 of selection))
	set theArtist to (artist of (item 1 of selection))
	set theContent to "
" & theTitle & "
" & theAlbum & "
" & theComposer & "
" & theArtist
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    -- set escShortName to encodeURIComponent(theShortName)
    -- set escName to encodeURIComponent(theName)
    -- set escTitle to encodeURIComponent(theTitle)
    -- set escComposer to encodeURIComponent(theComposer)
    -- set escAlbum to encodeURIComponent(theAlbum)
    -- set escArtist to encodeURIComponent(theArtist)
    -- set escContent to encodeURIComponent(theContent)

    -- set theLink to theProtocol & escScheme & theID & "/" & escName & "/" & escShortName & "/" & escContent & ":" & escApp
    set theURL to theScheme & theID
    set theTitle to theShortName
end doOrgLink
