# Default course language
CLANG?=el

HTMLDIR?=$(UH)/dds/pubs/web/home/ba-$(CLANG)
DISTDIR?=/cygdrive/d/pres
TARGETS=$(shell sed -n 's|<li><a href="\([^"]*\)">.*|$(HTMLDIR)/\1|p' index-$(CLANG).html)
INDEX=$(HTMLDIR)/index.html

.SUFFIXES:.html .md

$(HTMLDIR)/%.html: %.md
	( cat head1-$(CLANG).html ; \
	  sed -n 's|<li><a href="$(@F)">\([^<]*\)<.*|<title>\1<\/title>|p' index-$(CLANG).html ; \
	  cat head2-$(CLANG).html ; \
	  sed -n 's|<li><a href="$(@F)">\([^<]*\)<.*|## \1|p' index-$(CLANG).html ; \
	  cat title-$(CLANG).md ; \
	  cat $< ; \
	  cat tail-$(CLANG).html ) >$@

all: $(TARGETS) $(INDEX)
	cp -ru a $(HTMLDIR)/

$(INDEX): index-$(CLANG).html
	cp $< $@

clean:
	rm -f $(TARGETS)

dist: $(TARGETS)
	test -r $P.md
	cp $(HTMLDIR)/$P.html $(DISTDIR)
	echo "file:/boot/pres/$P.html" >$(DISTDIR)/../kiosk
