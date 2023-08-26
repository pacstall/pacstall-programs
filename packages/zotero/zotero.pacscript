name="zotero"
repology=("project: zotero")
pkgver="6.0.26"
url="https://download.zotero.org/client/release/${pkgver}/Zotero-${pkgver}_linux-x86_64.tar.bz2"
pkgdesc="Your personal research assistant"
hash="06daf3bfdb6b5058c2ad0f8e11cecc50eceaef1dd75bb8ed81424c8ad98f2b40"
arch=('amd64')
maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

prepare() {
  # Modify desktop file to point to install location
  sed -i -e "s/^Exec=.*/Exec=\/opt\/zotero\/zotero -url %U/" \
    -e "s/^Icon=.*/Icon=zotero/" zotero.desktop
}

package() {
  sudo install -D zotero.desktop -t "${pkgdir}/usr/share/applications"
  installdir="${pkgdir}/opt/zotero"
  sudo mkdir -p "${installdir}"
  sudo cp -r ./ "${installdir}"
  for size in 16 32 48 256; do
    sudo install -Dm644 "chrome/icons/default/default${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/zotero.png"
  done
}
