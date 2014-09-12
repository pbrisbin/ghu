NAME    = ghu
VERSION = 0.0.4
RELEASE = 1
AUTHOR  = pbrisbin
URL     = https://github.com/$(AUTHOR)/$(NAME)

DISTFILES = LICENSE Makefile bin/ghu share/ghu/ghu-parse

PREFIX ?= /usr/local

pkgver:
	sed -i "s/^pkgver=.*/pkgver=$(VERSION)/" PKGBUILD
	sed -i "s/^pkgrel=.*/pkgrel=$(RELEASE)/" PKGBUILD

md5sums:
	sed -i '/^md5sums=.*/,$$d' PKGBUILD
	makepkg --geninteg --clean >> PKGBUILD

test:
	cram test

install: ghu ghu-parse
	install -D -m755 ghu $(DESTDIR)$(PREFIX)/bin/ghu
	install -D -m755 ghu-parse $(DESTDIR)$(PREFIX)/share/ghu/ghu-parse

distclean:
	rm -f dist/$(NAME)-$(VERSION).tar.gz
	rm -rf $(NAME)-$(VERSION)

dist: distclean
	mkdir -p dist $(NAME)-$(VERSION)
	cp $(DISTFILES) $(NAME)-$(VERSION)
	tar czf dist/$(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	rm -rf $(NAME)-$(VERSION)

pkgbuild: pkgver md5sums
	git add PKGBUILD
	git commit -m 'Update PKGBUILD'

gh_pages:
	git checkout gh-pages
	git stash --include-untracked
	git rebase master
	git stash pop
	git add dist/$(NAME)-$(VERSION).tar.gz
	git commit -m 'Releasing $(VERSION)-$(RELEASE)'
	git push --force
	git checkout master

release: test dist gh_pages

release_aur: pkgbuild
	mkaurball
	aur-submit $(NAME)-$(VERSION)-$(RELEASE).src.tar.gz
	git tag -a -m v$(VERSION) v$(VERSION)
	rm -f $(NAME)-$(VERSION).tar.gz
	rm -f $(NAME)-$(VERSION)-$(RELEASE).src.tar.gz
	rm -f $(NAME)-$(VERSION)-$(RELEASE)-any.pkg.tar.xz

.PHONY: pkgver md5sums test distclean gh_pages release_aur release
