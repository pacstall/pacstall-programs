name="zotero"
repology=("project: zotero")
version="6.0.23"
url="https://download.zotero.org/client/release/${version}/Zotero-${version}_linux-x86_64.tar.bz2"
description="Your personal research assistant"
hash="0cfb9448485933a8113bcd9e5da95fd6e7030508762af4c1c0e3e34790c4b2a3"
arch=('amd64')
maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

prepare() {
  # Modify desktop file to point to install location
  sed -i -e "s/^Exec=.*/Exec=\/opt\/zotero\/zotero -url %U/" \
    -e "s/^Icon=.*/Icon=zotero/" zotero.desktop
}

install() {
  sudo install -D zotero.desktop -t "${pkgdir}/usr/share/applications"
  installdir="${pkgdir}/opt/zotero"
  sudo mkdir -p "${installdir}"
  sudo cp -r ./ "${installdir}"
  for size in 16 32 48 256; do
    sudo install -Dm644 "chrome/icons/default/default${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/zotero.png"
  done
}
