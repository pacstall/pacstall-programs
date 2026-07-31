pkgname="eclipse-rcp-bin"
pkgver="4.40"
_release="2026-06"
pkgdesc="IDE for Rich Client Platform (RCP) and Remote Application Platform (RAP)"
arch=('amd64')
url="https://eclipse.org/ide"
license=('EPL-2.0')
depends=('libwebkit2gtk-4.1-0')
source=("https://cdimage.debian.org/mirror/eclipse.org/technology/epp/downloads/release/${_release}/R/eclipse-rcp-${_release}-R-linux-gtk-x86_64.tar.gz"
  "eclipse.desktop::https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse.desktop")
sha512sums=('df0c35a056f4f151f0ee5ed36869aff023a2b9418ac1ef8b77938f4978de1a9c71b760e927b354175002a9e1385c981ad1d93a78561c30230945e589a6b97ecc'
  'bb5c1bbf07c52a68b123f40d35ffa1b09a0743003c734e53c0a0b23c4bb81a28c25b1be0c74b1507da8237db96b06f5e53baf6b6234bbc102e54602c30207291')
backup=('usr/lib/eclipse/eclipse.ini')
maintainer=("Matthias Mailänder <matthias@mailaender.name>")
repology=("project: eclipse-rcp")

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
