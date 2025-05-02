pkgname="zotero"
repology=("project: zotero")
pkgver="7.0.15"
source=("@${pkgname}~${pkgver}::https://download.zotero.org/client/release/${pkgver}/Zotero-${pkgver}_linux-x86_64.tar.bz2")
pkgdesc="Your personal research assistant"
sha256sums=("d16a8aca23562c025e07e274524fbf7cc1225f67f6075b1958ec896eeb4523bf")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "${pkgname}~${pkgver}"
  # Modify desktop file to point to install location
  sed -i -e "s/^Exec=.*/Exec=\/opt\/zotero\/zotero -url %U/" \
    -e "s/^Icon=.*/Icon=zotero/" zotero.desktop
}

package() {
  cd "${pkgname}~${pkgver}"
  install -D zotero.desktop -t "${pkgdir}/usr/share/applications"
  installdir="${pkgdir}/opt/zotero"
  mkdir -p "${installdir}"
  cp -r ./ "${installdir}"
  for size in 32 64 128; do
    install -Dm644 "icons/icon${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/zotero.png"
  done
}
