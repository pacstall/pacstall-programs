pkgname="zotero"
repology=("project: zotero")
pkgver="6.0.30"
source=("https://download.zotero.org/client/release/${pkgver}/Zotero-${pkgver}_linux-x86_64.tar.bz2")
pkgdesc="Your personal research assistant"
sha256sums=("e17419d71c3d42d9374b31ccb04524f87b8862d1c300e320a70cdb01de504295")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "${_archive}"
  # Modify desktop file to point to install location
  sed -i -e "s/^Exec=.*/Exec=\/opt\/zotero\/zotero -url %U/" \
    -e "s/^Icon=.*/Icon=zotero/" zotero.desktop
}

package() {
  cd "${_archive}"
  install -D zotero.desktop -t "${pkgdir}/usr/share/applications"
  installdir="${pkgdir}/opt/zotero"
  mkdir -p "${installdir}"
  cp -r ./ "${installdir}"
  for size in 16 32 48 256; do
    install -Dm644 "chrome/icons/default/default${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/zotero.png"
  done
}
