on doOrgLink()
    global theURL
    global theTitle
    tell application "Safari"
	set theURL to do JavaScript "document.URL" in document 1
	set theShortTitle to (do JavaScript "document.title" in document 1)
	-- set theTitle to theShortTitle & ":" & theApp
	-- set theContent to (do JavaScript "var x = ''+document.getSelection();x" in document 1)
	-- (*
	-- Fixes bug detailed https://discussions.apple.com/thread/3197130?start=0&tstart=0
	-- *)
    end tell
    set theURL to theURL
    set theTitle to theShortTitle
end doOrgLink
