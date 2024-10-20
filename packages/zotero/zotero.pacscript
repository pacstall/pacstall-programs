pkgname="zotero"
repology=("project: zotero")
pkgver="7.0.8"
source=("https://download.zotero.org/client/release/${pkgver}/Zotero-${pkgver}_linux-x86_64.tar.bz2")
pkgdesc="Your personal research assistant"
sha256sums=("bad8aa4b8fcfbe59107aca933b212f8fcbb05b5b03c65aa39e1bfa1857d8e6e9")
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
  for size in 32 64 128; do
    install -Dm644 "icons/icon${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/zotero.png"
  done
}
