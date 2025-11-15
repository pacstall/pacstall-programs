pkgname=zapzap
pkgver=6.2.3.1
pkgrel=1
pkgdesc='WhatsApp desktop application written in PyQt6 + PyQt6‑WebEngine'
arch=('x86_64')
url="https://github.com/rafatosta/zapzap"
license=("GPL-3.0-only")
depends=('python3-pyqt6' 'python3-pyqt6.qtwebengine' 'python3-dbus' 'qt6-wayland'
  'python3-jaraco.text' 'python3-inflect' 'python3-pydantic'
  'python3-typing-extensions' 'pyqt6-dev-tools')
makedepends=('git' 'python3-build' 'python3-installer' 'python3-setuptools>=40.8.0'
  'python3-wheel' 'desktop-file-utils')
optdepends=('hunspell: spell check')
source=("git+$url#tag=$pkgver")
b2sums=('5997d545fbee428634a72df0c632d61ae22422b940c19f5776e73f4407980848f6aa5df375f01ca3cd190682a83e2e04f1b2ff63800ef4dc58f2cac2faf92cfb')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 share/icons/com.rtosta.zapzap.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.rtosta.zapzap.svg"
  install -Dm664 share/applications/com.rtosta.zapzap.desktop "$pkgdir/usr/share/applications/com.rtosta.zapzap.desktop"
  install -Dm664 share/metainfo/com.rtosta.zapzap.appdata.xml "$pkgdir/usr/share/metainfo/com.rtosta.zapzap.appdata.xml"
}
