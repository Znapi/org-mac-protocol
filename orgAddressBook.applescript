on doOrgLink()
    (*
By Alexander Poslavsky
*)
    global theURL
    global theTitle
    tell application "Address Book"
	set theScheme to "address:"
	set AllContacts to selection
	if number of items in AllContacts = 1 then
	    set one_contact to item 1 of AllContacts
	    set theID to id of one_contact
	    set theName to name of one_contact
	else
	    tell application "System Events"
		activate
		display dialog "Error: Choose one contact"
	    end tell
	end if
    end tell

    -- set escID to encodeURIComponent(theID)
    -- set escName to encodeURIComponent(theName)
    -- set escScheme to encodeURIComponent(theScheme)
    -- set theLink to theProtocol & escScheme & escID & "/" & escName & ":" & escApp
    set theURL to theScheme & theID
    set theTitle to theName
end doOrgLink
