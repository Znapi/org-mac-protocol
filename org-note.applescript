(*
org-note.scpt --- make a note in an org-mode file without linking to front document

Author: Christopher Suckling <suckling AT gmail DOT com>

Version: 0.624

Commentary

Part of org-annotation-quicksilver

Syntax

Text processed by Quicksilver:

foobar

Append a note using *remember* template "QS Inbox"

foobar::x

Append a note using *remember* template x

foobar::

Raise Emacs and initialize an empty *remember* buffer

Installation

1) Copy to ~/Library/Application Support/Quicksilver/Actions/

2) Restart Quicksilver

Please see org-annotation-quicksilver.org for full installation and usage instructions
*)

property orgQSLib : ((path to home folder as text) & "Library:Application Support:Quicksilver:Actions:orgQSLib:")
property getEmacsLib : load script ((orgQSLib as text) & "getEmacsClient.scpt") as alias
property getItemMetaLib : load script ((orgQSLib as text) & "getItemMetadata.scpt") as alias
property theProtocol : "remember://"

using terms from application "Quicksilver"
	on process text theText
		
		set AppleScript's text item delimiters to "::"
		if (count text items in theText) = 0 then
			return 0
		else
			if (count text items in theText) = 1 then
				set rememberFile to "file"
				set raiseEmacs to false
				set theTemplate to "q"
			else
				if (count text items in theText) = 2 then
					set theTemplate to last text item in theText
					set theText to first text item in theText
					if theTemplate is "" then
						return 0
					else
						set rememberFile to "file"
						set raiseEmacs to false
					end if
				end if
			end if
		end if
		set AppleScript's text item delimiters to ""
		
		set theLink to "remember://http://dummy::remember::dummy::remember::"
		
		set noAnnotation to true
		
		set theScript to getEmacsLib's getEmacsClient() & " -e \"(progn (org-annotation-helper-remember \\\"" & theLink & "\\\" \\\"" & theText & "\\\" \\\"" & theTemplate & "\\\" \\\"" & noAnnotation & "\\\" \\\"" & rememberFile & "\\\") nil)\""
		
		
		do shell script theScript
		
		if raiseEmacs is true then
			tell application "Emacs"
				activate
			end tell
		end if
		
		close "QuickSilver"
		
	end process text
end using terms from