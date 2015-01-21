PREFIX ?= /usr/local

test:
	cram test

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/share/ghu
	install -m755 bin/ghu $(DESTDIR)$(PREFIX)/bin/ghu
	install -m755 share/ghu/parse-header $(DESTDIR)$(PREFIX)/share/ghu/parse-header

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/ghu \
	  $(DESTDIR)$(PREFIX)/share/ghu/parse-header

.PHONY: test install uninstall
