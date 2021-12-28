global theHandler
global theProtocol
global theParams
global theApp

global orgMacProtocolScriptPath

on getAppHandler(theApp)
    set defaultHandler to "org" & theApp
    tell application "Finder"
	if exists file (orgMacProtocolScriptPath & defaultHandler & ".scpt") then
	    return defaultHandler
	end if
    end tell
    return "orgGenericApplication"
end getAppHandler

on encodeURI(theURI)
    set uriEncodeLib to POSIX path of (orgMacProtocolScriptPath & "escape.rb")
    return do shell script "ruby " & quoted form of uriEncodeLib & " " & quoted form of theURI
end encodeURI

on sendLink()
    set theQuery to item 1 of theParams & "=" & encodeURI(item 2 of theParams)
    repeat with i from 2 to ((length of theParams)/2)
	set theQuery to theQuery & "&" & item (2*i-1) of theParams & "=" & encodeURI(item (2*i) of theParams)
    end repeat
    do shell script (script "getEmacsClient")'s getEmacsClient() & " org-protocol://" & theProtocol & "?" & theQuery
end sendLink

tell application "Finder"
    set orgMacProtocolScriptPath to (container of (path to me)) as text
end tell

tell application "System Events"
    set theApp to item 1 of (get name of processes whose frontmost is true)
end tell

set theHandler to getAppHandler(theApp)
