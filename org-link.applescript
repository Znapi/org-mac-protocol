tell script "org-link-protocol" to run

if theHandler is not ""
    -- The handler's doOrgLink() will fill out these globals.
    -- Generally they will only need to fill out theURL and theTitle.
    -- The other options are provided just in case it is easier to
    -- leave some of the processing to emacs instead of trying to get
    -- applescript alone to produce a nice url and title.
    global theURL
    global theTitle
    global otherParams
    set otherParams to {}
    set theProtocol to "store-link"
    tell script theHandler to doOrgLink()

    set theParams to {"url", theURL, "title", theTitle} & otherParams
    tell script "org-link-protocol" to sendLink()
end if
