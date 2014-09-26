NAME    = ghu
VERSION = 0.0.4
RELEASE = 3
AUTHOR  = pbrisbin
URL     = https://github.com/$(AUTHOR)/$(NAME)

DISTFILES = LICENSE Makefile bin/ghu share/ghu/ghu-parse

PREFIX ?= /usr/local

test:
	cram test

dist: $(DISTFILES)
	mkdir -p $(NAME)-$(VERSION)
	cp $(DISTFILES) $(NAME)-$(VERSION)
	tar czf dist/$(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	rm -rf $(NAME)-$(VERSION)

md5sums: dist/$(NAME)-$(VERSION).tar.gz
	cp dist/$(NAME)-$(VERSION).tar.gz pkg/
	updpkgsums pkg/PKGBUILD

pkgver:
	sed -i "s/^pkgver=.*/pkgver=$(VERSION)/" pkg/PKGBUILD
	sed -i "s/^pkgrel=.*/pkgrel=$(RELEASE)/" pkg/PKGBUILD

packageclean:
	rm -f pkg/$(NAME)-$(VERSION)-$(RELEASE).src.tar.gz
	rm -f pkg/$(NAME)-$(VERSION)-$(RELEASE)-any.pkg.tar.xz

package: pkgver md5sums packageclean
	cd pkg && mkaurball
	rm -f pkg/$(NAME)-$(VERSION).tar.gz
	rm -rf pkg/src

submit: pkg/$(NAME)-$(VERSION)-$(RELEASE).src.tar.gz
	aur-submit pkg/$(NAME)-$(VERSION)-$(RELEASE).src.tar.gz
	rm -f pkg/$(NAME)-$(VERSION)-$(RELEASE).src.tar.gz

release: test dist package submit
	git add dist/$(NAME)-$(VERSION).tar.gz
	git add pkg/PKGBUILD
	git tag -s -m v$(VERSION)-$(RELEASE) v$(VERSION)-$(RELEASE)
	git push
	git push --tags

install: ghu ghu-parse
	install -D -m755 ghu $(DESTDIR)$(PREFIX)/bin/ghu
	install -D -m755 ghu-parse $(DESTDIR)$(PREFIX)/share/ghu/ghu-parse

.PHONY: test pkgver
