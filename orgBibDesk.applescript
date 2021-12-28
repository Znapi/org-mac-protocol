on linkBibDesk
    global theURL
    global theTitle
    tell application "BibDesk"
	set templateText to "<$publications>
<$pubType=article?>
<$authors.name.@componentsJoinedByCommaAndAnd/> <$fields.Year/>. <$fields.Title/>. <$fields.Journal/>, <$fields.Volume/>(<$fields.Number/>), <$fields.Pages/>.
<?$pubType=book?>
<$authors.name.@componentsJoinedByCommaAndAnd/> <$fields.Year/>. <$fields.Title/>. <$fields.Address/>: <$fields.Publisher/>.
<?$pubType=unpublished?>
<$authors.name.@componentsJoinedByCommaAndAnd/> <$fields.Title/>. <$fields.Note/>
<?$pubType?>
<$authors.name.@componentsJoinedByCommaAndAnd/> <$fields.Year/>. <$fields.Title/>. <$fields.Journal/>, <$fields.Volume/>(<$fields.Number/>), <$fields.Pages/>
</$pubType?>
</$publications>
"
	set theScheme to "bibdesk:"
	set theDoc to front document
	set theTitle to (name of theDoc) & "::"
	set thePath to (path of theDoc) & "::"
	set theSelection to the selection of theDoc
	set thePub to item 1 of theSelection
	set theReference to templated text of theDoc using text templateText for thePub
	set theCite to cite key of thePub
	set theAppName to ":" & theApp
	set theKeywords to keywords of thePub
    end tell

    -- set escScheme to encodeURIComponent(theScheme)
    -- set escTitle to encodeURIComponent(theTitle)
    -- set escCite to encodeURIComponent(theCite)
    -- set escPath to encodeURIComponent(thePath)
    -- set escReference to encodeURIComponent(theReference)
    -- set escAppName to encodeURIComponent(theAppName)

    set theKeywordsSed to (do shell script "echo \"" & theKeywords & "\" | sed -e 's/[;,]//g'")

    set theProperty to ":PROPERTIES:
  :BIBDESK:  " & theKeywordsSed & "
  :END:"
    set theContent to theProperty & "

  " & theReference
    -- set escContent to encodeURIComponent(theContent)


    -- set theLink to theProtocol & escScheme & escPath & escCite & "/" & escTitle & escCite & escAppName & "/" & escCite & "/" & escContent & ":" & escApp
    set theURL to theScheme & thePath & theCite
    set theTitle to theTitle & theCite & theAppName
end doOrgLink
