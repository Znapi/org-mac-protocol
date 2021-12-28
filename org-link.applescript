tell script "org-link-protocol" to go(me)

on getParams()
    -- The handler's doOrgLink() will fill out these globals.
    -- Generally they will only need to fill out theURL and theTitle.
    -- The other options are provided just in case it is easier to
    -- leave some of the processing to emacs instead of trying to get
    -- applescript alone to produce a nice url and title.
    global theURL
    global theTitle
    global theProtocol
    set theProtocol to "store-link"
    global theHandler
    tell script theHandler to doOrgLink()
    global theParams
    set theParams to {"url", theURL, "title", theTitle}
end getParams
