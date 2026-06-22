pkgname="eclipse-rcp-bin"
pkgver="4.39"
_release="2026-03"
pkgdesc="IDE for Rich Client Platform (RCP) and Remote Application Platform (RAP)"
arch=('amd64')
url="https://eclipse.org/ide"
license=('EPL-2.0')
depends=('libwebkit2gtk-4.1-0')
source=("https://cdimage.debian.org/mirror/eclipse.org/technology/epp/downloads/release/${_release}/R/eclipse-rcp-${_release}-R-linux-gtk-x86_64.tar.gz"
  "eclipse.desktop::https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse.desktop")
sha512sums=('2e3af4cd1a8a0581ffe872fbaf29215166f5c2b7ac414a2d51150f6d2e7b54b0f843337055b8e2abb04af9e4d2eba815e6081ae7f84596897c974927c25f7cfd'
  '824875ab1454349a58eb2bb6fd70edd5e7a8e14a9b999372024374a1e04722398095db9bdba91b17bfb424c1e1271446f0370c79596f35fb516dbada31aebec5')
backup=('usr/lib/eclipse/eclipse.ini')
maintainer=("Matthias Mailänder <matthias@mailaender.name>")

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r eclipse "${pkgdir}/usr/lib/eclipse"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/eclipse/eclipse "${pkgdir}/usr/bin/eclipse"

  install -Dm0644 eclipse.desktop "${pkgdir}/usr/share/applications/eclipse.desktop"

  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dm0644 eclipse/plugins/org.eclipse.platform_"${pkgver}"*/eclipse"${i}".png \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
  done
}
