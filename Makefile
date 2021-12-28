EMACSCLIENT_SEARCH_PATHS=$(HOME)/bin:$(HOME)/Applications/Emacs.app/Contents/MacOS/bin/Applications/Emacs.app/Contents/MacOS/bin:/Applications/MacPorts/Emacs.app/Contents/MacOS/bin:/Applications/MacPorts/EmacsMac.app/Contents/MacOS/bin:/usr/local/bin:/opt/local/bin:/usr/bin
PREFIX=$(HOME)/Library/Script\ Libraries/

# org-link-protocol.applescript must be compiled before some other scripts
SRCS = org-link-protocol.applescript org-link.applescript $(wildcard *.applescript) $(wildcard *.rb)
OBJS = $(addprefix $(PREFIX),$(patsubst %.applescript,%.scpt,$(SRCS)))
OTHER_SCRIPTS=escape.rb

EMACSCLIENT?=$(shell env "EMACSCLIENT_SEARCH_PATHS=$(EMACSCLIENT_SEARCH_PATHS)" ./findEmacsClient.sh)

all: $(OBJS)

.PHONY: getEmacsClient.applescript
getEmacsClient.applescript:
	sed -i -E "s:return \".*\":return \"$(EMACSCLIENT)\":" $@

$(PREFIX)%.scpt: %.applescript
	# don't stop for errors because compilation will fail for
	# scripts referencing apps that don't exist on this system
	-osacompile -o "$@" "$+"

$(PREFIX)%.rb: %.rb
	cp "$+" "$@"

uninstall:
	rm $(OBJS)

SERVICES=org-link.workflow org-link-alt.workflow
services: $(SERVICES)

%.workflow:
	cp -R workflow-template.workflow $@
	# LANG=C prevents "illegal byte sequence" errors (from nonascii chars?)
	LANG=C find $@ -type f -exec sed -i -E "s:%%%TITLE%%%:$(basename $@):" \{\} \;
	LANG=C find $@ -type f -exec sed -i -E "s:%%%PREFIX%%%:$(PREFIX):" \{\} \;
	LANG=C find $@ -type f -exec sed -i -E "s:%%%SCRIPT%%%:$(basename $@).scpt:" \{\} \;

clean-services:
	rm -rf $(SERVICES)

install-services:
	cp -R $(SERVICES) $(HOME)/Library/Services

uninstall-services:
	rm -rf $(addprefix $(HOME)/Library/Services/,$(SERVICES))
