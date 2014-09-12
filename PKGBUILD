# Author: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=ghu
pkgver=0.0.3
pkgrel=1
pkgdesc="TODO"
arch=('any')
url="https://github.com/pbrisbin/$pkgname"
license=('MIT')
depends=(curl)
source=("https://pbrisbin.github.io/$pkgname/dist/$pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

md5sums=('a9ea5baabb2a9eba61cdd9a955871c9b')
