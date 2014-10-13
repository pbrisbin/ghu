PREFIX ?= /usr/local

test:
	cram test

install:
	install -D -m755 bin/ghu $(DESTDIR)$(PREFIX)/bin/ghu
	install -D -m755 share/ghu/parse-header $(DESTDIR)$(PREFIX)/share/ghu/parse-header

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/ghu \
	  $(DESTDIR)$(PREFIX)/share/ghu/parse-header

.PHONY: test install uninstall
